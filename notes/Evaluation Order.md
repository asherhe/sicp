# Evaluation Order

- Expressions in Lisp can be evaluated in two ways
	- Both are nearly identical but not really
- Applicative-order evaluation
	- Recursive process starting from the base combination
	- Evaluate the operands of the combination
	- Apply the procedure with the evaluated operands
		- If the procedure is a primitive procedure evaluate it directly
		- For compound procedures swap the arguments with the evaluated operands
	- Repeat process for any resulting non-primitive combinations
	- Used by the Lisp interpreter because of its efficiency over normal-order evaluation
- Normal-order evaluation
	- Recursively substitute symbols until the combination consists entirely of primitives
	- Reduce the combination by evaluating the resulting combination
