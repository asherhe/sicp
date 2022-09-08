(define (filtered-accumulate combiner null-value filter? term a next b)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter? a)
            (iter (next a) (combiner result (term a))))
          (else ; skip this value
            (iter (next a) a))))
  (iter a null-value))

;;;;;;;; Sum of the squares of primes ;;;;;;;;
(define (prime? n)
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
  (miller-rabin-prime? n 10000)) ; the miller-rabin test is fast enough for us to be able to test a lot of numbers. however, adjust as you wish

(define (sum-prime-squares a b)
  (filtered-accumulate + 0 prime? square a inc b))

;;;;;;;; PRODUCT OF ALL RELATIVELY PRIME NUMBERS ;;;;;;;;
(define (rel-prime? a b)
  (= (gcd a b) 1))
(define (prod-rel-prime n)
  (filtered-accumulate * 1 (lambda (i) (rel-prime? i n)) (lambda (x) x) 1 inc (- n 1)))
