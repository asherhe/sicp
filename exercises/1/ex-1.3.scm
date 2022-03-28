;;;;;;;;;;;;
; Exercise 1.3:
; 
; Define a procedure that takes three numbers as arguments and returns the sum
; of the squares of the two larger numbers.
; 
; (p. 27)
;;;;;;;;;;;;

(define (sum-of-two-largest a b c)
  (cond ((and (>= b a) (>= c a)) (+ b c))
        ((and (>= a b) (>= c b)) (+ a c))
        ((and (>= a c) (>= b c)) (+ a b))))

; Basically all permutations of greater than, equal to, and less than should
; suffice for testing.
; This was a pain to write by the way.
; I didn't feel like actually writing the test cases by hand so I ended up:
; - Writing a program to generate a test case for each permutation of a, b, and
;   .c
; - Rewriting the program from scratch (because I accidentally deleted it) to
;   also generate the trailing comment thing
; - Doing research on Visual Studio Code multiline editing to make life less
;   painful
; - Setting up a complicated Regex to make verifying the test cases easier
; So in short I spent ten minutes trying to save time
; Time well wasted in my opinion

(sum-of-two-largest 0 0 0) ; 0
(sum-of-two-largest 0 0 1) ; 1
(sum-of-two-largest 0 0 2) ; 2
(sum-of-two-largest 0 1 0) ; 1
(sum-of-two-largest 0 1 1) ; 2
(sum-of-two-largest 0 1 2) ; 3
(sum-of-two-largest 0 2 0) ; 2
(sum-of-two-largest 0 2 1) ; 3
(sum-of-two-largest 0 2 2) ; 4
(sum-of-two-largest 1 0 0) ; 1
(sum-of-two-largest 1 0 1) ; 2
(sum-of-two-largest 1 0 2) ; 3
(sum-of-two-largest 1 1 0) ; 2
(sum-of-two-largest 1 1 1) ; 2
(sum-of-two-largest 1 1 2) ; 3
(sum-of-two-largest 1 2 0) ; 3
(sum-of-two-largest 1 2 1) ; 3
(sum-of-two-largest 1 2 2) ; 4
(sum-of-two-largest 2 0 0) ; 2
(sum-of-two-largest 2 0 1) ; 3
(sum-of-two-largest 2 0 2) ; 4
(sum-of-two-largest 2 1 0) ; 3
(sum-of-two-largest 2 1 1) ; 3
(sum-of-two-largest 2 1 2) ; 4
(sum-of-two-largest 2 2 0) ; 4
(sum-of-two-largest 2 2 1) ; 4
(sum-of-two-largest 2 2 2) ; 4
