; since phi = (1 + sqrt(5)) / 2,
;   1 + 1 / phi
; = 1 + 2 / (1 + sqrt(5))
; = (1 + sqrt(5) + 2) / (1 + sqrt(5))
; = (3 + sqrt(5)) / (1 + sqrt(5))
; = ((3 + sqrt(5))(1 - sqrt(5))) / ((1 + sqrt(5))(1 - sqrt(5)))
; = (3 - 3 sqrt(5) + sqrt(5) - 5) / (1 - sqrt(5) + sqrt(5) - 5)
; = (-2 - 2 sqrt(5)) / (-4)
; = (1 + sqrt(5)) / 2

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
