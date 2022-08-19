---
tags: 
date created: 2022/07/22 8:25:49 pm
date modified: 2022/07/22 8:53:34 pm
---

# Exercise 1.20

> The process that a procedure generates is
of course dependent on the rules used by the interpreter. As an example, consider the iterative `gcd` procedure given above. Suppose we were to interpret this procedure using [[Evaluation Order|normal-order evaluation]], as discussed in Section 1.1.5. (The normal-order-evaluation rule for `if` is described in [[ex-1.5|Exercise 1.5]].) Using the substitution method (for normal order), illustrate the process generated in evaluating `(gcd 206 40)` and indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of `(gcd 206 40)`? In the applicative-order evaluation?

Recall that `gcd` is defined as

```scheme
(define (gcd a b)
	(if (= b 0)
	  a
	  (gcd b (remainder a b))))
```

Using normal-order evaluation `(gcd 206 40)` is evaluated as

```scheme
(gcd 206 40)

(if (= 40 0)
	206
	(gcd 40 (remainder 206 40)))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
	40
	(gcd 40
	     (remainder 40
	                (remainder 206 40))))

(gcd (remainder 206 40)
		 (remainder 40
		            (remainder 206 40))))

(if (= (remainder 40
								   (remainder 206 40))
				0)
	(remainder 206 40)
  (gcd (remainder 40
                  (remainder 206 40))
       (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40)))))

(gcd (remainder 40
								 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40
                           (remainder 206 40)))))

(if (= (remainder (remainder 206 40)
									 (remainder 40
									            (remainder 206 40))))
			  0)
  (remainder 40
             (remainder 206 40))
  (gcd (remainder (remainder 206 40)
                  (remainder 40
                             (remainder 206 40))))
       (remainder (remainder 40
                             (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40))))))

(gcd (remainder (remainder 206 40)
                (remainder 40
                           (remainder 206 40))))
     (remainder (remainder 40
                           (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40
                                      (remainder 206 40))))))

(if (= (remainder (remainder 40
                             (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40))))))
       0)
  (remainder (remainder 206 40)
             (remainder 40
                        (remainder 206 40))))
  (gcd (remainder (remainder 40
                             (remainder 206 40))
                  (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40))))))
       (remainder (remainder (remainder 206 40)
                             (remainder 40
                                        (remainder 206 40))))
                  (remainder (remainder 40
                                        (remainder 206 40))
                             (remainder (remainder 206 40)
                                        (remainder 40
                                                   (remainder 206 40)))))))
(remainder (remainder 206 40)
           (remainder 40
                      (remainder 206 40))))

(remainder 6
					 (remainder 40
					            6))
(remainder 6
					 4)
2
```

The total number of `remainder` calls here were
- 1 in the `if` of the first iterative call
- 2 in the second iterative call
- 4 in the third iterative call
- 7 in the fourth recursive call
  **note: $\langle\text{calls in iteration }n\rangle=\langle\text{calls in iteration }n-2\rangle+\langle\text{calls in iteration }n-1\rangle+1$**
- 4 in the simplification call

So the total number of recursive calls is 18.

In applicative-order evaluation there is one call to `remainder` in each iteration so the total number of calls to `remainder` is 4.

In relation to the number of iterations, `remainder` calls scales exponentially in normal-order evaluation and linearly in applicative-order evaluation.
