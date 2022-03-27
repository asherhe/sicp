; To find an approximation to sqrt(x)
;  - Make a guess g
;  - Improve the guess by averaging g and x/g
;  - Keep improving the guess until it is good enough
; (from slide)

; My implementation
(define accuracy 0.01)

(define (square x) (* x x))
(define (avg a b) (/ (+ a b) 2))

(define (sqrt x)
  (define (good-enough? x approx)
    (< (abs (- x (square approx)))
       accuracy))
  (define (try-guess x guess)
    (if (good-enough? x sguess)
      guess
      (try-guess x (avg guess (/ x guess)))))
  (try-guess x (/ x 2))) ; probably a good enough guess
