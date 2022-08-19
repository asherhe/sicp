---
tags: 
date created: 2022/08/15 9:27:34 pm
date modified: 2022/08/15 9:32:06 pm
---

# Exercise 1.26

> Louis Reasoner is having great difficulty doing [[ex-1.24.scm|Exercise 1.24]]. His `fast-prime?` test seems to run more slowly than his `prime?` test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewriten the `expmod` procedure to use an explicit multiplication, rather than calling `square`:
>
> ```scheme
> (define (expmod base exp m)
>   (cond ((= exp 0) 1)
>         ((even? exp)
>           (remainder (* (expmod base (/ exp 2) m)
>                         (expmod base (/ exp 2) m))
>                      m))
>         (else
>           (remainder (* base
>                         (expmod base (- exp 1) m))
>                      m))))
> ```
>
> “I don’t see what difference that could make,” says Louis.
> “I do.” says Eva. “By writing the procedure like that, you
> have transformed the $\Theta(\log n)$ process into a $\Theta(n)$ process.”
> Explain.

Here Louis is repeating the same conputation twice at every step. Thus, instead of performing the same effort half as many times, we are performing twice the effort half as many times, or the original amount of $\Theta(n)$.

