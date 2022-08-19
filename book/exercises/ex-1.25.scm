(define (expmod1 base exp m) ; base ^ exp modulo m
  (cond ((= exp 0) 1)
        ((even? exp) (remainder
                        (square (expmod1 base
                                        (/ exp 2)
                                        m))
                        m))
        (else (remainder
                (* base (expmod1 base (- exp 1) m))
                m))))

(define (fast-expt base exp)
  (cond ((= exp 0) 1)
        ((even? exp) (square (fast-expt base
                                        (/ exp 2))))
        (else (* base (fast-expt base (- exp 1))))))

(define (expmod2 base exp m)
  (remainder (fast-expt base exp) m))

(define (time-expmod base exp m)
  (define (time f start) (f) (- (runtime) start))
  (display "expmod1: ")
  (display (time (lambda () (expmod1 base exp m)) (runtime)))
  (display "s\nexpmod2: ")
  (display (time (lambda () (expmod2 base exp m)) (runtime)))
  (display "s"))
