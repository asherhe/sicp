---
tags: 
date created: 2022/07/07 8:01:04 pm
date modified: 2022/07/16 8:10:12 pm
---

# Exercise 1.16

> Design a procedure that evolves an iterative exponentiation process that uses successive squaring and usees a logarithmic number of steps, as does `fast-expt`. (Hint: Using the observation that $\left(b^{\frac n2}\right)^2=(b^2)^{\frac n2}$, keep, along with the exponent $n$ and the base $b$, an additional state variable $a$, and define the state transformation in such a way that the product $ab^n$ is unchanged from state to state. At the beginning of the process $a$ is taken to be 1, and the answer is given by the value of $a$ at the end of the process. In general, the technique of defining an *invariant quantity* that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

![[ex-1.16.scm]]

```scheme
(define (expt b n)
  (expt-iter b n 1))

(define (expt-iter b n a)
  (cond
    ((= n 0) a)
    ((even? n) (expt-iter (square b) (/ n 2) a))
    (else (expt-iter b (- n 1) (* a b)))))
```

The `expt-iter` procedure has three state variables: `b`, `n`, and `a`. We are trying to iterate such that $\texttt a\texttt b^{\texttt n}$ remains constant throughout the procedure.

We have two cases here (apart from the base case):
- **`n` is even**: There really isn't much we can do with `a` because that would involve another invocation to `expt` which makes it recursive. Instead, we square `b` (who said we couldn't) because $(\texttt b^2)^{\frac{\texttt n}2}=\texttt b^{\texttt n}$.
