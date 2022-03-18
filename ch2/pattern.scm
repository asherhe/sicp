; Pattern Matching language

; Language Constructs:

; Pattern rules
; foo - matches the expression "foo"
; (f a b c) - matches a list containing "f," then "a," then "b," and finally "c"
; (? a) - matches any expression, and call it "a"
; (?c a) - matches a constant, call it "c"
; (?v x) - matches a variable, call it "x"

; Skeleton rules
; (: [expression]) - evaluates expression

(define deriv-rules
  '(
    ((dd (?c c) (? v)) 0) ; differentiating a constant
    ((dd (?v u) (? v)) 0) ; differentiating a variable that is not the differentiation variable
    ((dd (?v v) (? v)) 1)

    ((dd (+ (? a) (? b)) (? v))
     (+ (dd (: a) (: v))
        (dd (: b) (: v))))
    
    ((dd (* (? a) (? b)) (? v))
     (+ (* (: a) (dd (: b) (: v)))
        (* (dd (: a) (: v)) (:b))))
  ))

; Program structure:
; The patterns fed into the program one by one.
; For each pattern, we match it agains the expression. If successful, we should get a dictionary of variables back.
; Afterwards, we substitute it into the skeleton, repeating the matching process for any clauses that require evalutation.

; Tries to match an expression against a pattern and add pattern variables to dictionary if successful - return the dictionary
(define (match pat exp dict)
  (cond
    ((eq? dict 'failed) 'failed)
    ((atom? pat)
     (if (atom? exp)
       (cond
        ((null? exp) dict)
        ((eq? pat exp) dict)
        (else 'failed))
       (match pat (cdr exp) dict)))
    ((atom? exp)
     'failed)
    (else
      (match (cdr pat) (cdr exp) (match (car pat) (car exp) dict)))))