#lang racket

; Write a function maj in Racket that takes three lists x, y and z of equal length
; and containing only 0's and 1's. It should return a list containing a 1 where two or more
; of x, y and z contains 1's and 0 otherwise. For example:

; (maj (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
; '(0 0 0 1 0 1 1 1)

; The map function above produces '(0 1 1 2 1 2 2 3)
; Therefore, if an element of the output list is greater than 1, it has occurred more than once
; Create an auxiliary function to recursively loop through the list and produce a new list
; containing only 0's and 1's. 
; if > 1 then cons 1 otherwise cons 0
(define (maj x y z)
  (maj-aux (map (lambda (x y z) (+ x y z)) x y z)))

(define (maj-aux lst)
  (if (null? lst)
	'()
	(if (> (car lst) 1)
	  (cons 1 (maj-aux (cdr lst)))
	  (cons 0 (maj-aux (cdr lst))))))

(maj '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))
