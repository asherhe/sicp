# Exercise 1.2

> Translate the following expression into prefix form:
> 
> ```
> 5 + 4 + (2 - (3 - (6 + 4/5)))
> ---------------------------
>       3(6 - 2)(2 - 7)
> ```
> 
> (I tried to do my best to recreate the fractions but that didn't work well)
> 
> *(p. 27)*

(with indentation so it's easier on the eyes)

```scheme
(/ (+ 5
      4
      (- 2
         (- 3
            (+ 6
               (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
```