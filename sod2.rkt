#lang racket

; Write a function sod2 in Racket that takes three lists x, y and z of equal length and containing
; only 0's and 1's. It should return a list containing a 1 where the number of 1's in a given position
; in x, y and z contains an odd number of 1's and 0 otherwise. For example:
; > (sod2 (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
; '(0 1 1 0 1 0 0 1)

; Similary to the 'Majority function' or maj
; Map a function to the 3 input lists - x y z - and some their indices
; Futhermore, pass the result to an auxilary function - sod2-aux
; If the (car lst) % 2 = 1 then it is odd, otherwise it is even
; cons 1 or 0 to the new list appropriately
(define (sod2 x y z)
  (sod2-aux (map (lambda (x y z) (+ x y z)) x y z)))

(define (sod2-aux lst)
  (if (null? lst)
	'()
	(if (= 1 (modulo (car lst) 2))
	  (cons 1 (sod2-aux (cdr lst)))
	  (cons 0 (sod2-aux (cdr lst))))))

(sod2 '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))

