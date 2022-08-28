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

(define (fermat-test-all n)
  (define (fermat-test a n)
    (cond ((>= a n) true)
          ((= (expmod a n n) a) (fermat-test (+ a 1) n))
          (else false)))
  (fermat-test 1 n))

(fermat-test-all 561)
(fermat-test-all 1105)
(fermat-test-all 1729)
(fermat-test-all 2465)
(fermat-test-all 2821)
(fermat-test-all 6601)
