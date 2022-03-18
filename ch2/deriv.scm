; Differentiation Rules 
;,,,,,,,,,,,,,,,,,,,,,,,

; k' = 0
; for any constant k. "Constant" refers to any term that is not the
; differentiation variable.

; x' = 1

; (f + g)' = f' + g'
; f and g are both expressions

; (fg)' = f'g + fg'
; Product rule

; (f(g))' = f'(g) g'
; Chain rule

; (x^k)' = k x^(k-1)
; Power rule; again, k is a constant

(define (deriv exp var)
  (cond
    ((constant? exp var) 0) ; Derivatives of constants are zero
    ((same-var? exp var) 1) ; Derivative of a variable is 1
    ((sum? exp) (make-sum (deriv (addend exp) var) ; The derivative of a sum is the sum of the derivatives
                          (deriv (augend exp) var)))
    ((product? exp) (make-sum (make-product (multiplier exp) ; Product rule
                                            (deriv (multiplicand exp) var))
                              (make-product (deriv (multiplier exp) var)
                                            (multiplicand exp))))))

(define (same-var? exp var)
  (and (symbol? exp)
       (eq? exp var)))

(define (constant? exp var)
  (not (or (same-var? exp var)
           (pair? exp))))

(define (sum? exp)
  (and (pair? exp)          ; List
       (eq? (car exp) '+))) ; '+ is the symbol that denotes addition

(define (make-sum a b)
  (cond
    ((eq? a 0) b)
    ((eq? b 0) a)
    ((and (number? a) (number? b))
      (+ a b))
    ((eq? a b) (make-product 2 a))
    (else (list '+ a b))))
(define addend cadr)
(define augend caddr)

(define (product? exp) ; Same logic as sum?
  (and (pair? exp)
       (eq? (car exp) '*)))

(define (make-product a b)
  (cond
    ((or (eq? a 0) (eq? b 0)) 0)
    ((eq? a 1) b)
    ((eq? b 1) a)
    ((and (number? a) (number? b))
      (* a b))
    ((number? b) (make-product b a)) ; Mostly just a style choice, so that constants go in front
    ((and (product? b)
          (number? a)
          (number? (multiplier b)))
      (make-product (* a (multiplier b)) (multiplicand b)))
    (else (list '* a b))))
(define multiplier cadr)
(define multiplicand caddr)

(define foo
  '(+ (* a (* x x))
      (+ (* b x)
         c)))

(deriv foo 'x)
