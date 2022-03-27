; Code that runs before the rest of the program is runs
; Put utility functions, bootstrap code, etc. here

; probably a decent definition for an atom
(define (atom? x)
  (not (pair? x)))