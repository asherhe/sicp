(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 0)
    (lambda (x) x)
    (compose f (repeated f (dec n)))))

((repeated square 2) 5)
