# Exercise 1.2

> Translate the following expression into prefix form:
>
> $$
> \frac{5+4+\left(2-\left(3-\left(6+\frac45\right)\right)\right)}{3(6-2)(2-7)}
> $$
>
> (This requires that either your markdown viewer supports TeX or that you have the magical ability to read TeX)
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