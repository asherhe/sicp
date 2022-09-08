(define (iterative-improve good-enough? improve)
  (define (iter guess)
      (if (good-enough? guess)
        guess
        (iter (improve guess))))
  iter)

(define (average x y) (/ (+ x y) 2))

(define tolerance 0.001)

(define (sqrt-iter guess x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) tolerance))
    (lambda (guess) (average guess (/ x guess)))) guess))

(define (fixed-point f guess)
  ((iterative-improve
    (lambda (guess) (< (abs (- (f guess) guess)) tolerance))
    f) guess))