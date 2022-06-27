---
date created: 2022/04/25 9:10:37 pm
date modified: 2022/06/24 9:51:30 pm
---
# Exercise 1.4

#exercise #evaluation

> Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:
>
> ```scheme
> (define (a-plus-abs-b a b)
>   ((if (> b 0) + -) a b))
> ```
>
> *(p. 27)*

Depending on the sign of `b` the program will switch between operators In short the procedure evaluates `a + |b|`, which I just realized was the name of the procedure
