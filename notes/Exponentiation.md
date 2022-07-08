---
tags: 
date created: 2022/07/07 7:49:11 pm
date modified: 2022/07/07 8:01:00 pm
---

# Exponentiation

The intuitive way of counting exponentiation would be

$$
b^n=\begin{cases}
b\cdot b^{n-1},&n>0 \\
1,&n=0
\end{cases}
$$

This directly translates into

```scheme
(define (expt b n)
	(if (= n 0)
	  1
	  (* b (expt b (- n 1)))))
```

This is a [[Recursion and Iteration#Linear Recursive Processes|linear recursive process]] with running in $\Theta(n)$ time and $\Theta(n)$ space. An iterative version of this would be:

```scheme
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b counter product)
	(if (= counter 0)
	  product
	  (expt-iter b
	             (- counter 1)
	             (* b product))))
```

The iterative version runs in $\Theta(1)$ space, but still linear time.

It is, however, possible to write an algorithm that runs in $\Theta(\log n)$ time. Using the algorithm

$$
b^n=\begin{cases}
\left(b^{\frac n2}\right)^2,&n\text{ even} \\
b\cdot b^{n-1},&n\text{ odd} \\
1,&n=0
\end{cases}
$$

This is written in Scheme as

```scheme
(define (fast-expt b n)
	(cond
	  ((= n 0) 1)
	  ((even? n) (square (fast-expt b (/ n 2))))
	  (else (* b (fast-expt b (- n 1))))))
```

Both the size and space grow at $\Theta(\log n)$.

An iterative version will be written in [[ex-1.16]]
