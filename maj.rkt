#lang racket

; Write a function maj in Racket that takes three lists x, y and z of equal length
; and containing only 0's and 1's. It should return a list containing a 1 where two or more
; of x, y and z contains 1's and 0 otherwise. For example:

; (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
; '(0 0 0 1 0 1 1 1)

; This produces '(0 1 1 2 1 2 2 3)
; maybe if > 1 then cons 1 otherwise cons 0
(define (temp x y z)
  (temp2 (map (lambda (x y z)(+ x y z)) x y z)))

(define (temp2 lst)
  (if (null? lst)
	'()
	(if (> (car lst) 1)
	  (cons 1 (temp2 (cdr lst)))
	  (cons 0 (temp2 (cdr lst))))))

(temp '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))
;(map (lambda (x y z)
;	   (+ x y z))
;	   '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

(define (majority x y z)
  (converge (maj-aux x y) (maj-aux x z) (maj-aux y z)))

(define (maj-aux x y)
  (if (null? x)
	'()
    (if (= 1 (car x)) 
	  (if (= 1 (car y))
	    (cons 1 (maj-aux (cdr x) (cdr y)))
	    (cons 0 (maj-aux (cdr x) (cdr y))))
      (cons 0 (maj-aux (cdr x) (cdr y))))))

(define (maj-or x y z)
  (if (null? x)
	'()
	(if (and (or (= 1 (car x)) (= 1 (car y)) (= 1 (car z))))
	  (cons 1 (maj-or (cdr x) (cdr y) (cdr z)))
	  (cons 0 (maj-or (cdr x) (cdr y) (cdr z))))))

(maj-or '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

(define (converge x y z)
  (if (null? x)
	'()
	(if (or (= (car x) 1) (= (car y) 1) (= (car z) 1))
	  (cons 1 (converge (cdr x) (cdr y) (cdr z)))
	  (cons 0 (converge (cdr x) (cdr y) (cdr z))))))

(maj-aux '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1)) ; x y
(maj-aux '(0 0 0 0 1 1 1 1) '(0 1 0 1 0 1 0 1)) ; x z
(maj-aux '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1)) ; y z
(majority '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

(define (maj x y z)
  (if (null? x)
	'()
	(if (= 1 (car x))
	  (if (= 1 (car y)) 
		(cons 1 (maj (cdr x) (cdr y) (cdr z))) ; x is 1, y is 1
		(if (= 1 (car z))
		  (cons 1 (maj (cdr x) (cdr y) (cdr z))) ; x is 1, y is 0, z is 1
		  (cons 0 (maj (cdr x) (cdr y) (cdr z))))) ; x is 1, y is 0, z is 0
	  (if (= 1 (car y))
	    (if (= 1 (car z))
		  (cons 1 (maj (cdr x) (cdr y) (cdr z))) ; x is 0, y is 1, z is 1
		  (cons 0 (maj (cdr x) (cdr y) (cdr z)))) ; x is 0, y is 1, z is 0
	    (cons 0 (maj (cdr x) (cdr y) (cdr z))))))) ; x is 0, y is 0, z is 0

(maj '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

