---
date created: 2022/04/25 9:10:37 pm
date modified: 2022/06/24 9:51:41 pm
---
# Exercise 1.5

#exercise #evaluation

> Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures:
>
> ```scheme
> (define (p) (p))
> (define (test x y)
>   (if (= x 0) 0 y))
> ```
>
> Then he evaluates the expression
>
> ```scheme
> (test 0 (p))
> ```
>
> What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated first, and the result determines whether to evaluate the consequent or the alternative expression.)
>
> *(p. 27)*

Let's just simulate the evaluation of this program first.

So if we use applicative-order evaluation:

```scheme
   (test 0 (p))
=> (test 0 (p))
=> (test 0 (p))
=> (test 0 (p))
=> (test 0 (p))
=> [...]
```

Using applicative-order evaluation results in an infinite loop

Let us instead try it with normal-order evaluation

```scheme
   (test 0 (p))
=> (if (= 0 0) 0 (p))
=> (if #t 0 (p))
=> 0
```

So if we are using normal-order evaluation on `(test 0 (p))` we end up with zero since the interpreter doesn't evern bother at all with evaluating `(p)`, thus saving it from an infinite loop.
