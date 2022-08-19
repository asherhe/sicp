---
tags: 
date created: 2022/07/16 9:47:42 pm
date modified: 2022/07/22 8:07:55 pm
---

# Exercise 1.19

> There is a clever algorithm for computing the Fibonacci numbers in a logarithmic number of steps. Recall the transformation of the state variables $a$ and $b$ in the `fib-iter` process of Section 1.2.2: $a\leftarrow a+b$ and $b\leftarrow a$. Call this transformation $T$, and observe that applying $T$ over and over againn times, starting with 1 and 0, produces the pair $\newcommand{\Fib}[0]{\mathrm{Fib}}\Fib(n + 1)$ and $\Fib(n)$. In other words, the Fibonacci numbers are produced by applying $T^n$, the $n$th power of the transformation $T$, starting with the pair $(1,0)$. Now consider $T$ to be the special case of $p=0$ and $q=1$ in a family of transformations $T_{pq}$, where $T_{pq}$ transforms the pair $(a,b)$ according to $a\leftarrow bq+aq+ap$ and $b\leftarrow bp+aq$. Show that if we apply such a transformation $T_{pq}$ twice, the effect is the same as using a single transformation $T_{p'q'}$ of the same form, and compute $p'$ and $q'$ in terms of $p$ and $q$. This gives us an explicit way to square these transformations, and thus we can compute $T^n$ using successive squaring, as in the `fast-expt` procedure. Put this all together to complete the following procedure, which runs in a logarithmic number of steps:
> ```scheme
> (define (fib n)
>   (fib-iter 1 0 0 1 n))
> (define (fib-iter a b p q count)
>   (cond ((= count 0) b)
>         ((even? count)
>          (fib-iter a
>                    b
>                    [??] ; compute p′
>                    [??] ; compute q′
>                    (/ count 2)))
>         (else (fib-iter (+ (* b q) (* a q) (* a p))
>                         (+ (* b p) (* a q))
>                         p
>                         q
>                         (- count 1)))))
> ```

So our transformation $T_{pq}$ is $a\leftarrow bq+aq+ap$ and $b\leftarrow bp+aq$. Let's plug this value back into the expression and see what we get

$$
\begin{align*}
(bp+aq)q+(bq+aq+ap)q+(bq+aq+ap)p
&=(bpq+aq^2)+(bq^2+aq^2+apq)+(bpq+apq+ap^2)\\
&=(bq^2+2bpq)+(ap^2+2aq^2+2apq)\\
&=b(q^2+2pq)+a(p^2+2q^2+2pq)\\
(q'=q^2+2pq)\qquad&=bq'+a(p^2+q^2+q')\\
(p'=p^2+q^2)\qquad&=bq'+a(p'+q')
\end{align*}
$$

Now let's repeat the same process for $b$

$$
\begin{align*}
(bp+aq)p+(bq+aq+ap)q
&=(bp^2+apq)+(bq^2+aq^2+apq)\\
&=(bp^2+bq^2)+(aq^2+2apq)\\
&=bp'+aq'
\end{align*}
$$

So as we can see $p'=p^2+q^2$ and $q'=q^2+2pq$ works out.

Thus, our procedure is

```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q) (* 2 p q))
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```
