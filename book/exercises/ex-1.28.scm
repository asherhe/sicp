; if n is a natural number then
; a^(n-1) is congruent to 1 (mod n)
; for all a < n

; in addition, if there is some a < n such that
; a^2 is congruent to 1 (mod n)
; then n is also guarenteed to not be prime
(define (expmod base exp m) ; base ^ exp modulo m
  (define (check-nontrivial-sqrt a)
    (let ((sqr-a (square a))) (let ((mod-sqr-a (remainder sqr-a m)))
      (cond ((or (= a 1)
                 (= a (- m 1)))
             mod-sqr-a)
            ((= mod-sqr-a 1) 0) ; causes the test to automatically fail because 0 cannot be any value of a
            (else mod-sqr-a)))))
  (cond ((= exp 0) 1)
        ((even? exp) (check-nontrivial-sqrt
                       (expmod base
                               (/ exp 2)
                               m)))
        (else (remainder
                (* base (expmod base (- exp 1) m))
                m))))

(define (miller-rabin-prime? n times)
  (define (miller-rabin-test n)
    (check (+ 1 (random (- n 1))) n))
  (define (check a n)
    (= (expmod a n n) a))
  (cond ((= times 0) true) ; at this point the test hasn't failed so we'll assume it's prime
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else false))) ; nope

(miller-rabin-prime? 5 5) ; #t
(miller-rabin-prime? 4 4) ; #f
(miller-rabin-prime? 561 561) ; one of our camichael numbers - #f
