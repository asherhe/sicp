; Code that runs before the rest of the program is runs
; Put utility functions, bootstrap code, etc. here

(define inc 1+)
(define dec -1+)

; probably a decent definition for an atom
(define (atom? x)
  (not (pair? x)))