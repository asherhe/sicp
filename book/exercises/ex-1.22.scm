; Primality code
(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; timing
(define (timed-prime-test n)
  (newline) ; print newline
  (display n) ; print the value of n
  (start-prime-test n (runtime))) ; start the timing function with the current timed

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time)))) ; report elapsed time ONLY IF n IS PRIME

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; checks the primality of odd integers in a specific range
(define (search-for-primes from to)
  (cond ((>= from to) 0) ; nothing there is to do
        ((even? from) (search-for-primes (+ from 1) to))
        ((prime? from) (display from) (newline) (search-for-primes (+ from 2) to))
        (else (search-for-primes (+ from 2) to))))
