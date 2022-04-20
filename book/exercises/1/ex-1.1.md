# Exercise 1.1

> Below is a sequence of expressions. What is the result printed by the
> interpreter in response to each expression? Assume that the sequence is to be
> evaluated in the order in which it is presented.
> 
> *(p. 26)*

Believe it or not, I did all of this by hand.

If you don't believe me that's fine but that's actually what happened as far as I can tell.

Also I'm not going to be very picky about whether I should use normal-order evaluation or applicative-order evaluation.

And in addition my formatting is inconsistent and do not conform to any set rules because I made the rules as I went along so maybe I'll have to improve the formatting at some point in the future.

```scheme
   10
=> 10

   (+ 5 3 4)
=> 12

   (- 9 1)
=> 8

   (/ 6 2)
=> 3

   (+ (* 2 4) (- 4 6))
=> (+       8       -2)
=> 6


   (define a 3)
=> Output is implementation-dependent but now a is 3

   (define b (+ a 1))
=> (define b (+ 3 1))
=> (define b       4)
=> Again, output is implementation-dependent but now b is 4

   (+ a b (* a b))
=> (+ 3 4 (* 3 4))
=> (+ 3 4      12)
=> 19

   (= a b)
=> (= 3 4)
=> #f (or false, but I'll use #f)

   (if (and (> b a) (< b (* a b)))
       b
       a)
=> (if (and (> 4 3) (< 4 (* 3 4)))
       4
       3)
=> (if (and      #t (< 4      12))
       4
       3)
=> (if (and      #t            #t)
       4
       3)
=> (if                          #t
       4
       3)
=> 4

   (cond ((= a 4) 6)
         ((= b 4) (+ 6 7 a))
         (else 25))
=> (cond ((= 3 4) 6)
         ((= 4 4) (+ 6 7 3))
         (else 25))
=> (cond (     #f 6)
         (     #t        16)
         (  #t 25))
=> 16

=> (+ 2 (if (> b a) b a))
=> (+ 2 (if (> 4 3) 4 3))
=> (+ 2 (if      #t 4 3))
=> (+ 2                4)
=> 6

=> (* (cond ((> a b) a)
            ((< a b) b)
            (else -1))
      (+ a 1))
=> (* (cond ((> 3 4) 3)
            ((< 3 4) 4)
            (else -1))
      (+ 3 1))
=> (* (cond (     #f 3)
            (     #t 4)
            (  #t -1))
            4)
=> (* 4
            4)
=> 16
```