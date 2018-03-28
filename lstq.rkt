#lang racket

; To reference 'The Little Schemer' - The 1st Commandment and the 5th Commandment
; When recurring on a list of atoms, lat, ask two questions: (null? lat) and else
; When building a value with +, always use 0 for the value of the terminating line,
; for adding zero does not change the value

; Auxiliary function for squaring the i'th element of y taken from the i'th element of x
(define (lstq-aux-sq x y)
  (* (- (car x) (car y)) (- (car x) (car y))))

; Build the value using + and recurse until x OR y is null
(define (lstq x y)
  (if (null? x)
	0
	(+ (lstq-aux-sq x y) (lstq (cdr x) (cdr y)))))

(lstq (list 4.5 5.1 6.2 7.8) (list 1.1 -0.1 6.1 3.8)) ; 54.61

