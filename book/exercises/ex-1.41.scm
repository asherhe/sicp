(define (double f)
  (lambda (x) (f (f x))))

; (double double) doubles a procedure twice - quadrupling
; this quadrupling is applied twice; with the effect of sexadecupling (x16)
; the procedure we are sexadecupling is inc, which adds one, so we add 16 to 5, giving 21
(((double (double double)) inc) 5)
