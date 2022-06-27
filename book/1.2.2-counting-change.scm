(define (count-change amount)
  (cc amount 5))

; Counts the number of ways change could be made
; Reduces this problem to two cases:
;  - A coin is used
;  - A coin is not used
; The coin in question is determined by first-denomination
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1)) ; Coin is not used; move on to the next denomination
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins))))) ; Coin is used, subtract its value

; Finds the first denomination (value) given the kinds of coins left
; Here it is arranged from largest to smallest but it doesn't really matter
(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
