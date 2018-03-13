#lang racket

; Write a function maj in Racket that takes three lists x, y and z of equal length
; and containing only 0's and 1's. It should return a list containing a 1 where two or more
; of x, y and z contains 1's and 0 otherwise. For example:

; (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
; '(0 0 0 1 0 1 1 1)

(map (lambda (x y z) (+ x y z))
  '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

; The map function above produces '(0 1 1 2 1 2 2 3)
; Therefore, if an element of the output list is greater than 1, it has occurred more than once
; Create an auxiliary function to recursively loop through the list and produce a new list
; containing only 0's and 1's. 
; maybe if > 1 then cons 1 otherwise cons 0
(define (maj x y z)
  (maj-aux (map (lambda (x y z) (+ x y z)) x y z)))

(define (maj-aux lst)
  (if (null? lst)
	'()
	(if (> (car lst) 1)
	  (cons 1 (maj-aux (cdr lst)))
	  (cons 0 (maj-aux (cdr lst))))))

(maj '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

(define (majority x y z)
  (converge (majority-aux x y) (majority-aux x z) (majority-aux y z)))

(define (majority-aux x y)
  (if (null? x)
	'()
    (if (= 1 (car x)) 
	  (if (= 1 (car y))
	    (cons 1 (majority-aux (cdr x) (cdr y)))
	    (cons 0 (majority-aux (cdr x) (cdr y))))
      (cons 0 (majority-aux (cdr x) (cdr y))))))

(define (converge x y z)
  (if (null? x)
	'()
	(if (or (= (car x) 1) (= (car y) 1) (= (car z) 1))
	  (cons 1 (converge (cdr x) (cdr y) (cdr z)))
	  (cons 0 (converge (cdr x) (cdr y) (cdr z))))))

(majority-aux '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1)) ; x y
(majority-aux '(0 0 0 0 1 1 1 1) '(0 1 0 1 0 1 0 1)) ; x z
(majority-aux '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1)) ; y z
(majority '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

; The naive way
(define (maj-naive x y z)
  (if (null? x)
	'()
	(if (= 1 (car x))
	  (if (= 1 (car y)) 
		(cons 1 (maj-naive (cdr x) (cdr y) (cdr z))) ; x is 1, y is 1
		(if (= 1 (car z))
		  (cons 1 (maj-naive (cdr x) (cdr y) (cdr z))) ; x is 1, y is 0, z is 1
		  (cons 0 (maj-naive (cdr x) (cdr y) (cdr z))))) ; x is 1, y is 0, z is 0
	  (if (= 1 (car y))
	    (if (= 1 (car z))
		  (cons 1 (maj-naive (cdr x) (cdr y) (cdr z))) ; x is 0, y is 1, z is 1
		  (cons 0 (maj-naive (cdr x) (cdr y) (cdr z)))) ; x is 0, y is 1, z is 0
	    (cons 0 (maj-naive (cdr x) (cdr y) (cdr z))))))) ; x is 0, y is 0, z is 0

(maj-naive '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

