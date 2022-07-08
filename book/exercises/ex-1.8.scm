;;;;;;;;;;;;
; Exercise 1.8
; 
; Newton's method for cube roots is based on the fact that if y is an
; approximation to the cube root of x, then a better approximation is given by
; the value
; 
; (x/y^2 + 2y) / 3
; 
; Use this formula to impelment a cube-root procedure analogous to the
; square-root procedure (In Secton 1.3.4 we will see how to implement Newton's
; method in general as an abstraction of these square-root and cube-root
; procedures.)
; 
; p. 33
;;;;;;;;;;;;

(define (cube-root x)
  (define (good-enough? guess)
    (< (abs (- x (cube guess))) 0.001))
  (define (improve guess)
    (/ (+ (/ x (square guess))
          (* guess 2))
        3))

  (define (cube-root-iter guess)
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve guess))))
  (cube-root-iter 1.0)))
