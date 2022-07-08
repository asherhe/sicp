---
tags: 
date created: 2022/06/24 10:03:41 pm
date modified: 2022/07/02 8:00:51 pm
---

# Case Study - Counting Change

#case-study

*(p. 51)*

> [!quote] Excerpt from the book
> It takes only a bit of cleverness to come up with the iterative Fibonacci algorithm. In contrast, consider the following problem: How many different ways can we make change of $1.00, given half-dollars, quarters, dimes, nickels, and pennies? More generally, can we write a procedure to compute the number of ways to change any given amount of money?

*(just as a unrelated comment, the next sentence is a bit of an understatement:)*

> [!quote] Simple indeed
> This problem has a simple solution as a recursive procedure.

So the solution splits the problem into two problems:

- Counting the number of ways to have change without using the first type of coin
- Using up the first type of coin and then counting the number of ways to make change

```scheme
(define (count-change amount) (cc amount 5))
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination
                          kinds-of-coins))
                     kinds-of-coins)))))
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
```
