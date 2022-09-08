(define tolerance 0.0001)

(define (fixed-point f guess)
  (define (try guess)
    (define (close-enough? g) (< (abs (- guess g)) tolerance))
    (let ((next (f guess)))
      (if (close-enough? next)
        next
        (try next))))
  (try guess))

(define (average x y) (/ (+ x y) 2))

(define (average-damp f)
  (lambda (y) (average y (f y))))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (dec n)))))

(define (expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (expt base
                                   (/ exp 2))))
        (else (* base (expt base (- exp 1))))))

(define (log2 x)
  (define (log2-iter i n)
    (if (> n x)
      (dec i)
      (log2-iter (inc i) (+ n n))))
  (log2-iter 0 1))

(define (rt n x)
  (fixed-point ((repeated average-damp (log2 n))
                  (lambda (y) (/ x
                                 (expt y (dec n)))))
    1.0))
