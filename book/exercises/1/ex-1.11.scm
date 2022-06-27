;;;;;;;;;;;;
; Exercise 1.11
;
; A function f is defined by the rule that
; f(n) = { n if n < 3
;        { f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3
;
; Write a procedure that computes f by means of a recursive process. Write a
; procedure that computes f by means of an iterative process.
;
; (p. 53)
;;;;;;;;;;;;

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f n)
  (define (f-iter count a b c)
    (if (= count 2)
        c
        (f-iter (- count 1) b c (+ c (* 2 b) (* 3 a)))))
  (if (< n 3)
    n
    (f-iter n 0 1 2)))

; I left (f-recursive 100) running and after ten or so minutes it's still not done
; (f 100) ran almost instantaneously