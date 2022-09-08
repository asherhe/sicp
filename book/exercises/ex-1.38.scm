(define (cont-frac n d k)
  (define (iter i)
    (if (= i k)
      (/ (n i) (d i))
      (/ (n i) (+ (d i)
                  (iter (inc i))))))
  (iter 1))

; compute e
; n is 1
; and d is 1 2 1 1 4 1 1 6 1 1 8 ...
(cont-frac (lambda (i) 1.0)
           (lambda (i)
             (if (= (remainder i 3) 2)
               (* 2 (inc (floor (/ i 3))))
               1))
           100)