(define (divides? a b) (= (remainder b a) 0))

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

(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (= n (smallest-divisor n)))

; timing
(define (timed-prime-test n)
  (newline) ; print newline
  (display n) ; print the value of n
  (newline)
  (display "prime? ")
  (start-test prime? n (runtime))
  (newline)
  (display "fast-prime? ")
  (start-test fast-prime? n (runtime))) ; fast-prime? takes approximately half as much time

(define (start-test primeFun? n start-time)
  (if (primeFun? n)
      (report-prime (- (runtime) start-time)))) ; report elapsed time ONLY IF n IS PRIME

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))