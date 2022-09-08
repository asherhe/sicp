(define dx 0.01)

(define (smooth f)
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (dec n)))))

(define (n-fold-smooth f n)
  (repeated smooth n))
