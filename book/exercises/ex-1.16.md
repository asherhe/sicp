---
tags: 
date created: 2022/07/07 8:01:04 pm
date modified: 2022/07/07 8:01:04 pm
---

# ex-1.17

> Design a procedure that evolves an iterative exponentiation process that uses successive squaring and usees a logarithmic number of steps, as does `fast-expt`. (Hint: Using the observation that $\left(b^{\frac n2}\right)^2=(b^2)^{\frac n2}$, keep, along with the exponent $n$ and the base $b$, an additional state variable $a$, and define the state transformation in such a way that the product $ab^n$ is unchanged from state to state. At the beginning of the process $a$ is taken to be 1, and the answer is given by the value of $a$ at the end of the process. In general, the technique of defining an *invariant quantity* that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

