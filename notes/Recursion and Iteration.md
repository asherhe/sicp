---
date created: 2022/05/20 10:26:27 pm
date modified: 2022/06/26 9:27:59 pm
---

# Recursion and iteration

#evaluation

## Linear Recursive Processes

^601158

#recursion

Take for example the factorial function

```scheme
(define (factorial n)
	  (if (= n 1)
	      1
	      (* (n (factorial (- n 1))))))
```

Its [[Evaluation Order|evaluation]] looks like this:

```scheme
(factorial 6)
(* 6 (factorial 5))
(* 6 (* 5 (factorial 4)))
(* 6 (* 5 (* 4 (factorial 3))))
(* 6 (* 5 (* 4 (* 3 (factorial 2)))))
(* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
(* 6 (* 5 (* 4 (* 3 (* 2 1)))))
(* 6 (* 5 (* 4 (* 3 2))))
(* 6 (* 5 (* 4 6)))
(* 6 (* 5 24))
(* 6 120)
720
```

This is what is known as a *linear recursive process*

Basically what this means is that each function call will lead to another until eventually it reaches a easy-to-calculate function call and it directly returns the value instead of further rerouting it.

In addition, the steps required to execute a linear recursive process is always proportional to its input, hence the name *linear*.

## Linear Iterative Processes

#iteration

Let's look at this modified version of `factorial`:

```scheme
(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
	(if (> counter max-count)
			product
			(fact-iter (* counter product)
						     (+ counter 1)
						     max-count)))
```

Its evaluation looks like this:

```scheme
(factorial 6)
(fact iter 1 1 6)
(fact-iter 1 2 6)
(fact-iter 2 3 6)
(fact-iter 6 4 6)
(fact-iter 24 5 6)
(fact-iter 120 6 6)
(fact-iter 720 7 6)
720
```

Same result, different procedure.

This version of `factorial` is what is known as a *linear iterative process*. As the name suggests, it is an *iterative process*. Rather than generating a long chain of recursive calls, `fact-iter` just has one function; its computational state managed by *state variables* (`product`, `counter`, `max-count`).

Iterative processes repeat a certain computation again and again until some condition is met by their state variables. In the case of `fact-iter`, it is until the procedure has run a certain amount of times (kept track through `counter` and `max-count`)

One property of iterative processes is that, since their computational state is stored in its parameters, representing a step in the computation is a matter of remembering a few values. In contrast, recursive processes have the bulk of its calculations uncalculated until its base case is met, making the representation of calculation state cumbersome.

In many other languages such as C or Java, recursive processes tend to consume memory. This makes iterative processes impractical as the more iterations there are, the more memory it consumes. In Lisp, however, there is no such problem, and iterative processes can be executed without any additional memory. This is a property known as *tail recursion*.

## Tree Recursion

$$
\newcommand{\Fib}{\mathrm{Fib}}
$$
**Example: Fibonacci Numbers**

![](fib.scm)

Fibonacci numbers are defined by the rule

$$
\Fib(n)=
\begin{cases}
0&\text{if }n=0,\\
1&\text{if }n=1,\\
\Fib(n-1)+\Fib(n-2)&\text{otherwise.}
\end{cases}
$$

Transliterating this word-for-word looks like this:

```scheme
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))
```

If we run `(fib 5)` the execution looks like:

![[fig-1.5.png]]

This is highly inefficient and it happens that the complexity increases exponentially as `n`

### Replacing this with iteration

![](fib-iter.scm)

As with `factorial`, we are going to need a few state variables and a process to apply on them to make this iterative.

So `fib` involves two values: $\Fib(n-1)$ and $\Fib(n-2)$. Let's call them `a` and `b`

On each new iteration $\Fib(n-1)$ becomes $\Fib(n-2)$ and $\Fib(n-2)$ has become $Fib(n-3)$ so we have to change things up.

Since `a` is the new `b` we can just set `b` to `a`

$\Fib(n-2)+\Fib(n-3)=\Fib(n-1)$ so the new `a` is `(+ a b)`.

And to top things off we need a `count` to keep track of where we are.

The whole program looks like so:

```
(define (fib n)
  (define (fib-iter a b count)
    (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))
```

This is now a linear iteration!
