(define (divides? a b) (= (remainder b a) 0))

; check if the only proper divisor is n
(define (prime? n)
  (define (smallest-divisor n) (find-divisor n 2))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (= n (smallest-divisor n)))

; prime? but skip even numbers after 2
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

; use fermat's little theorem
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

; "unfoolable" variant of fermat's test
(define (miller-rabin-prime? n times)
  (define (expmod base exp m) ; the miller-rabin test requires its own form of expmod
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
  (define (miller-rabin-test n)
    (check (+ 1 (random (- n 1))) n))
  (define (check a n)
    (= (expmod a n n) a))
  (cond ((= times 0) true) ; at this point the test hasn't failed so we'll assume it's prime
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else false))) ; nope