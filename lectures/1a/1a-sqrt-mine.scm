; To find an approximation to sqrt(x)
;  - Make a guess g
;  - Improve the guess by averaging g and x/g
;  - Keep improving the guess until it is good enough
; (from slide)

(define accuracy 0.001)

(define (square x) (* x x))
(define (avg a b) (/ (+ a b) 2))

(define (sqrt x)
  (define (try-guess guess)
    (if (good-enough? guess)
      guess
      (try-guess (improve guess))))
  (define (good-enough? guess)
    (< (abs (- x (square guess)))
       accuracy))
  (define (improve guess)
    (avg guess (/ x guess)))
  (try-guess (/ x 2.0))) ; x/2 is probably a good enough starting point
