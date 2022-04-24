# Exercise 1.10

> The following procedure computes a mathematical function called Ackermann's function.
>
> ```scheme
> (define (A x y)
>   (cond ((= y 0) 0)
>         ((= x 0) (* 2 y))
>         ((= y 1) 2)))
>         (else (A (- x 1) (A x (- y 1)))))
> ```
>
> What are the values of the following expressions?
>
> ```scheme
> (A 1 10)
> (A 2 4)
> (A 3 3)
> ```
>
> Consider the following procedure, where `A` is the procedure defined above:
>
> ```scheme
> (define (f n) (A 0 n))
> (define (g n) (A 1 n))
> (define (h n) (A 2 n))
> (define (k n) (* 5 n n))
> ```
>
> Give concise mathematical definitions for the functions computed by the procedures `f`, `g`, and `h` for positive integer values of $n$. For example, `(k n)` computes $5n^2$.
>
> *(p. 47)*

First of all,

```scheme
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024
```

As we can see `(A 1 10)` computes powers of two the long way. Let's just remember this for future reference because without that the next one is going to be *very* ugly.

```scheme
(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 (A 1 2)))
(A 1 (A 1 4))
(A 1 16)
65536
```

As we can see our rule of thumb saved us from the expression of `(A 1 16)` which I can tell you isn't fun (this could be a nice thing to try when you're bored).

Onto the next one.

```scheme
(A 3 3)
(A 2 (A 3 2))
(A 2 (A 2 (A 3 1)))
(A 2 (A 2 2))
```

Hold up. `(A 2 2)` is bad. *Really bad*.

Let's look back at our expansion of `(A 2 4)` too see if there's a shortcut for this. It turns out that `(A 2 x)` is repeated exponentiation, which is slightly less than fun (I tried computing `(A 2 5)` and the result was 19729 digits long which was bad).

Back to the computation

```scheme
(A 2 (A 2 2))
(A 2 4)
65536
```

Whew.

Wasn't that bad.

Well Ackermann's function is actually very interesting because it demonstrates operations beyond multiplication and exponentiation. Repeated exponentiation is also known as *tetration* (addition, multiplication, exponentiation, and tetration are part of a larger set of operations known as [*hyperoperations*](https://en.wikipedia.org/wiki/Hyperoperation)).

So in the process of evaluating Ackermann's function we also accidentally answered the second half of the problem.

So `(f n)` is the same as multiplication, `(g n)` is the same as exponentiation, and `(h n)` is the same as tetration.

[I feel the need to insert Q.E.D. for some reason but I have refrained from doing so]
