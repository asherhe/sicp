---
date created: 2022/05/05 9:02:27 pm
date modified: 2022/06/21 7:32:27 pm
---
# Course Overview

**Lisp is all about controlling complexity**

Complexity in Lisp can be controlled in three ways

- Black-box abstraction
- Conventional interfaces
- Metalinguistic abstraction

## Black-box abstractions

- An abstract "thing" that performs a specific function
- Takes inputs and outputs an value
- We don't need to know about the internal workings of the black box - we assume it works

**Course components:**
- **Primitive objects** - built into language
	- Primitive procedures
	- Primitive data
- **Means of combination** - compositing primitives together
	- Procedure composition
	- Construction of compound data
- **Means of abstraction**
	- Procedure definition
	- Simple data abstraction
- **Capturing common patterns**
	- High-order procedures - procedures with procedures themselves as input
	- *Data as procedures*

## Conventional Interfaces

- Unified way of combining things
- Example: Addition
	- We can add numbers, vectors, polynomials, or even functions
	- These are all inherently different and require different procedures
	- Common interface: performing addition on a *general* object
- Standardization across different types of data

**Course components:**
- Generic operations
	- Example with addition
- Large scale structure and modularity
	- Modelling large real-world systems
- Object-oriented programming
	- An object represents a "thing"
	- Objects communicate with each other
- Operations on aggregates
	- Streams

## Metalinguistic Abstraction

- How to construct new languages
- Desinging new languages to simplify a task
- **Build Lisp in Lisp**

**Course components:**
- Interpretation (apply-eval loop)
- Example: Logic Programming
- Register Machines
