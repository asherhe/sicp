(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (factorial n)
  (define (identity x) x)
  (product identity 1 inc n))
(factorial 6) ; 720

; pi   2*4 * 4*6 * 6*8 ...
; -- = -------------------
;  4   3*3 * 5*5 * 7*7 ...
(define (pi-approximation n)
  (define (approximation-term n)
    (/ (* 2 (+ (floor (/ n 2)) 1))
       (+ (* 2 (floor (/ (+ n 1) 2))) 1)))
  (* 4 (product approximation-term 1. inc n)))
(pi-approximation 10)
(pi-approximation 100)
(pi-approximation 1000)
