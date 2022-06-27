---
date created: 2022/04/25 9:10:37 pm
date modified: 2022/06/24 9:52:08 pm
---
# Exercise 1.6

#exercise

> Alyssa P. Hacker doesn't see why `if` needs to be provided in a speical form. "Why can't I just define it as an ordinary procedure in terms of `cond`?" she asks. Alyssa's friend Eva Lu Ator claims that this can indeed be done, and she defines a new version of `if`:
>
> ```scheme
> (define (new-if predicate then-clause else-clause)
>   (cond (predicate then-clause)
>         (else else-clause)))
> ```
>
> Eva demonstrates the program for Alyssa:
>
> ```scheme
> (new-if (= 2 3) 0 5)
> 5
> (new-if (= 1 1) 0 5)
> 0
> ```
>
> Delighted, Alyssa uses `new-if` to rewrite the square-root program:
>
> ```scheme
> (define (sqrt-iter guess x)
>   (new-if (good-enough? guess x)
>           guess
>           (sqrt-iter (improve guess x) x)))
> ```
>
> What happens when Alyssa attempts to use this to compute square roots? Explain
>
> *(p. 32)*

Because the Lisp interpreter uses applicative-order evalutation, the `new-if` procedure will generate very deep recursion that may cause the interpreter to fail.

More specifically, if `new-if` is called, then first the operands must be evaluated. Among the operands is a recursion, which leads us back to another `new-if`. To evaluate this `new-if`, we expand the operands first, a process that repeats itself until either the interpreter runs out of resources or the operands are finally evaluated.
