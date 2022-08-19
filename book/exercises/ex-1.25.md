---
tags: 
date created: 2022/08/15 9:14:38 pm
date modified: 2022/08/15 9:26:58 pm
---

# Exercise 1.25

> Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written
>
> ```scheme
> (define (expmod base exp m)
>   (remainder (fast-expt base exp) m))
> ```
>
> Is she correct? Would this procedure serve as well for our fast prime tester? Explain.

Below is a program implementing the two, and also a timer program:

```scheme
(define (expmod1 base exp m) ; base ^ exp modulo m
  (cond ((= exp 0) 1)
        ((even? exp) (remainder
                        (square (expmod1 base
                                        (/ exp 2)
                                        m))
                        m))
        (else (remainder
                (* base (expmod1 base (- exp 1) m))
                m))))

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (fast-expt base
                                        (/ exp 2))))
        (else (* base (fast-expt base (- exp 1))))))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (time-expmod base exp m)
  (define (time f start) (f) (- (runtime) start))
  (display "expmod1: ")
  (display (time (lambda () (expmod1 base exp m)) (runtime)))
  (display "s\nexpmod2: ")
  (display (time (lambda () (expmod2 base exp m)) (runtime)))
  (display "s"))

```

If we run, for example, `(time-expmod 3 1000000 7)`, we get:

```
expmod1: 0.s
expmod2: 1.1199999999999999s
```

As we can see, `expmod2` (Alyssa's solution) takes a whopping 1.1s, while `expmod1` probably hasn't even hit the millisconds yet.

Why? Shouldn't one remainder at the end be much faster tha a bunch of remainders throughout the program?

I'm not particularly sure about how the internal workings of MIT Scheme work, but I suspect that taking the remainder from a very large number is a slow process. By taking the remainder throughout the program, extremely large numbers can be largely avoided.
