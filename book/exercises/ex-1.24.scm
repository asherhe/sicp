(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (= n (smallest-divisor n)))

(define (fast-prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (define (next test)
    (if (= test 2)
        3
        (+ test 2))) ; avoid repeating divisors of two
  (= n (smallest-divisor n)))

(define (fermat-prime? n times)
  (define (fermat-test n)
    (check (+ 1 (random (- n 1))) n))
  (define (check a n)
    (= (expmod a n n) a))
  (define (expmod base exp m) ; base ^ exp modulo m
    (cond ((= exp 0) 1)
          ((even? exp) (remainder
                         (square (expmod base
                                         (/ exp 2)
                                         m))
                         m))
          (else (remainder
                  (* base (expmod base (- exp 1) m))
                  m))))

  (cond ((= times 0) true) ; at this point the test hasn't failed so we'll assume it's prime
        ((fermat-test n) (fermat-prime? n (- times 1)))
        (else false))) ; nope

; timing
(define (timed-prime-test n)
  (newline) ; print newline
  (display n) ; print the value of n
  (newline)
  (display "prime? ")
  (start-test prime? n (runtime))
  (newline)
  (display "fast-prime? ")
  (start-test fast-prime? n (runtime)) ; fast-prime? takes approximately half as much time as prime?
  (newline)
  (display "fermat-prime? ")
  (start-test (lambda (n) (fermat-prime? n 1000)) n (runtime))) ; 50 iterations is good enough?

(define (start-test prime-test n start-time)
  (if (prime-test n)
      (report-prime (- (runtime) start-time)))) ; report elapsed time ONLY IF n IS PRIME

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))