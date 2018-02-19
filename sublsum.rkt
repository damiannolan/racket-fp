#lang racket

; A helper function for summing the elements of a list of integers
(define (sum lst)
  (if (null? lst) 0 
	(+ (car lst) (sum (cdr lst)))))

(sum '(1 2 3)) ; 6

; Use a wrapper function and make use of a helper function which passes the combinations
; Helper function will do the bulk of the work
; If the sum of the car (first element) of the combinations equals 0
; - cons the car (first element) with a recursive function call passing the cdr
; Else or Otherwise
; - Make a recursive function call passing the cdr
(define (sublsum-aux lst)
  (if (null? lst)
	'()
    (if (= (sum (car lst)) 0)
	  (cons (car lst) (sublsum-aux (cdr lst)))
	  (sublsum-aux (cdr lst)))))

(define (sublsum lst)
  (if (null? lst)
	'()
	(sublsum-aux (combinations lst))))

(sublsum '(1 2 3 4 -5)) ; '(() (2 3 -5) (1 4 -5))

(sublsum '(1 2 3 4 5) ; '(())

