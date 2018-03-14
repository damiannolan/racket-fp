#lang racket

; Write a function chse in Racket that takes three lists x, y and z of equal length and containing
; only 0's and 1's. It should return a list containing the elements of y in the positions where x is 1
; and the elements of z otherwise. For example:
; > (chse (list 0 0 0 0 1 1 1 1) (list 0 0 1 1 0 0 1 1) (list 0 1 0 1 0 1 0 1))
; '(0 1 0 1 0 0 1 1)

; SHA-256 'Ch' or 'Choose' function.
; If the (car x) is equal to 1 then cons the (car y) with a recursive call to the choose function
; Otherwise cons the (car z) with a recurisve call to the choose function
(define (chse x y z)
  (if (null? x)
	'()
    (if (= 1 (car x))
	  (cons (car y) (chse (cdr x) (cdr y) (cdr z)))
	  (cons (car z) (chse (cdr x) (cdr y) (cdr z))))))

(chse '(0 0 0 0 1 1 1 1) '(0 0 1 1 0 0 1 1) '(0 1 0 1 0 1 0 1))
	
