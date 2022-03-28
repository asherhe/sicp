(define (square x) (* x x)) ; not included in MIT scheme for some reason
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
