; To find an approximation to sqrt(x)
;  - Make a guess g
;  - Improve the guess by averaging g and x/g
;  - Keep improving the guess until it is good enough
; (from slide)

; My implementation
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

; Professor's Implementation
(define (square x) (* x x)) ; not included in MIT scheme but assumed to be there by the professor
(define (average a b) (/ (+ a b) 2)) ; same with average

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
      .001))
  (define (try guess)
    (if (good-enough? guess)
      guess
      (try (improve guess))))
  (try 1))
