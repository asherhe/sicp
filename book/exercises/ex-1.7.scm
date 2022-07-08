;;;;;;;;;;;;
; Exercise 1.7
; 
; The good-enough? test used in computing square roots will not be very
; effective for finding the square roots of very small numbers. Also in real
; computers, arithmetic operations are almost always performed with limited
; precision. This makes our test inadequate for very large numbers. Explain
; these statements, with examples showing how the test fails for small and large
; numbers. Explain these statements, with examples showing how the test fails
; for small and large numbers. An alternative strategy for implementing
; good-enough? is to watch how guess changes from one iteration to the next and
; to stop when the change is a very small fraction of the guess. Design a
; square-root procedure that uses this kind of end test. Does this work better
; for small and large numbers?
; 
; (p. 33)
;;;;;;;;;;;;

(define (average a b) (/ (+ a b) 2))
(define tolerance 0.0001)

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(define (sqrt-improved x)
  (define (good-enough? guess previous-guess)
    (< (abs (- guess previous-guess)) tolerance))
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (sqrt-iter guess previous-guess)
    (if (good-enough? guess previous-guess)
        guess
        (sqrt-iter (improve guess) guess)))
  (sqrt-iter 1.0 0.0))

(sqrt 2)
(sqrt-improved 2)

;           precision | 0.1                | 0.01               | 0.001              | 0.0001             |
; former sqrt program | 1.4166666666666665 | 1.4166666666666665 | 1.4142156862745097 | 1.4142156862745097 |
; this program        | 1.4166666666666665 | 1.4142156862745097 | 1.4142135623746899 | 1.4142135623746899 |
; true value          | 1.4142135623730950 | 1.4142135623730950 | 1.4142135623730950 | 1.4142135623730950 |

; Downside of this is that it's much slower since the values take a while to converge