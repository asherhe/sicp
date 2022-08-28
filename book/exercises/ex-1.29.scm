; sums term from a to b with next as the transition
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integrate f a b n)
  (let ((h (/ (- b a) n)))
    (define (simpson-term i)
      (* (cond ((= i 0) 1)
               ((= i n) 1)
               ((odd? i) 4)
               (else 2))
         (f (+ a (* i h)))))
    (/ (* h (sum simpson-term 0 1+ n)) 3)))

(integrate cube 0. 1. 100)
(integrate cube 0. 1. 1000)