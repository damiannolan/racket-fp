#lang racket

; Rough work snippets

; Sublsum
(define (sum lst)
  (if (null? lst) 0
	(+ (car lst) (sum (cdr lst)))))

(sum '(1 2 3))

(map sum (combinations '(1 2 3 4 -5)))

(define (sublsum lst)
  (if (null? lst)
	'()
	(sublsum-aux = 0 (combinations lst))))

(define (sublsum-aux f z lst)
  (if (null? lst)
	'()
	(if (f (car (map sum lst)) z)
	  (cons (car lst) (sublsum-aux f z (cdr lst)))
	  (sublsum-aux f z (cdr lst)))))

(sublsum '(1 2 3 4 -5))

; Majority - SHA256
(map (lambda (x y z) (+ x y z))
	   '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

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
