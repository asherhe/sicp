# Lisp

> [!quote] Quote from the lecture
> Well I guess you need a magical language, and sorcerers, real sorcerers, use Ancient Arcadian or Sumerian or Babylonian or whatever. We're going to conjure our spirits in a magical language called Lisp

## Elements of a programming language

- Primitive elements
	- What are the ways you can put it together?
- Means of combination
	- How you combine those primitive elements ot make something meaningful?
- Means of abstraction
	- Black-box abstractions
	- Modular building blocks

These are a very important measure of the applicability of a language

## Lisp

### Primitive Elements

- Numbers
	- `3`
		- Actually a *symbol that represents the platonic idea of "three"*
	- `17.4`
		- Again, a symbol that *represents* the platonic idea of 17.4
	- `5`
		- You get the idea probably
- Procedures
	- `+`, `-`, `*`, `/`
		- Names to denote the standard arithmetic operations
	- `=`, `<`, `>`
		- Represent comparison operators
		- Return a true/false value (predicate)
	- `if` and `cond`
		- Represent the process of case analysis
	- `and`, `or`, `not`
		- Operations for logical composition
		- Allow for more complex compound predicates
### Means of Combination

- Example of a combination:
  `(+ 3 17.4 5)`
  - Applies an operator (`+`) to one or more operands (`3`, `17.4`, and `5`) to get an output (`24.5`)
- Combinations can also be nested:
  `(+ 3 (+ 5 6) 8 2)`
- Lisp uses what is known as *prefix notation*
- Lisp parenthesis are not the same as mathematical parenthesis
- Lisp expressions are actually trees in linear form

### Means of Abstraction

`define`: assigns data to symbols
```scheme
(define a (* 5 5))
(* a a) -> 625
(define b (+ a (* 5 a)))
```

Procedures, being data, can also be assigned to symbols (in a slightly different manner)
```scheme
(define (square x) (* x x))
(square 10) -> 100
```

`lambda` can also be used to denote a procedure
```scheme
(define square (lambda (x) (* x x)))
```

|                      | Procedures                     | Data         |
| -------------------- | ------------------------------ | ------------ |
| Primitive Elements   | `+` `*` `<` `=`                | `23` `1.738` |
| Means of Combination | `()` composition, `cond`, `if` |              |
| Means of Abstraction | `define`                       |              |
