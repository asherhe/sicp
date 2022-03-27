; Pattern Matching language

; Language Constructs:

; Pattern rules
; foo - matches the expression "foo"
; (f a b c) - matches a list containing "f," then "a," then "b," and finally "c"
; (? a) - matches an arbitrary expression, and call it "a"
; (?c a) - matches a arbitrary constant, call it "a"
; (?v a) - matches a arbitrary variable, call it "a"

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

; Recursively matches an expression against a pattern, emitting matched values to a dictionary
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
    ((arbitrary-constant? pat))
    ((arbitrary-expression? pat))
     (cons (cons (cadr pat) exp) dict))
    ((atom? exp) ; we have already confirmed that pat is not atomic
     'failed)
    (else ; traverse the structure of the expression
      (match (cdr pat)
             (cdr exp)
             (match (car pat)
                    (car exp)
                    dict)))))