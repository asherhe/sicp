; Assumed to be defined
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* a b)
  (if (> b a)
    (*-iter b a 0) ; reduce iteration count
    (*-iter a b 0)))

(define (*-iter a b sum)
  (cond
    ((<= b 0) sum)
    ((even? b) (*-iter (double a) (halve b) sum))
    (else (*-iter a (- b 1) (+ sum a)))))
