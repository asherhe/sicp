(define tolerance 0.0001)
(define dx 0.0001)

(define (fixed-point f guess)
  (define (try guess)
    (define (close-enough? g) (< (abs (- guess g)) tolerance))
    (let ((next (f guess)))
      (if (close-enough? next)
        next
        (try next))))
  (try guess))

; approximates the derivative of a function
(define (d f)
  (lambda (x) (/ (- (f (+ x dx)) (f x))
                 dx)))

; newton's method: approximate the root of a function by repeatedly taking the x-intercept of a tangent line
(define (newtons-method f guess)
  (fixed-point (lambda (x) (- x (/ (f x) ((d f) x))))
               guess))

; creates a cubic function x^3 + ax^2 + bx + c
(define (cubic a b c)
  (lambda (x) (+ (* (+ (* (+ x a) x)
                       b) x)
                 c)))

(define f (cubic 1 2 3))
(newtons-method f 1) ; approximately -1.2757
(f (newtons-method f 1))
