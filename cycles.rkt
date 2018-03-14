#lang racket

; Append function from scratch from previous collatz-list problem
(define (append-list list1 list2)
    (if (null? list1)
	  list2
	  (cons (car list1) (append-list (cdr list1) list2))))

; lcycle as defined to take a list as input and returns the list cyclically shifted one place to the left
(define (lcycle l)
  (if (null? l)
	'()
	(append-list (cdr l) (list (car l))))) 

(lcycle (list 1 2 3 4 5)) ; '(2 3 4 5 1)

; last-element as defined to take a list as input and return the last-element using recursion
; if the rest of l is null then return the first of l
; otherwise make a recursive call passing the rest of l - i.e popping off the first element in the list
(define (last-element l)
  (if (null? (cdr l))
	(car l)
	(last-element (cdr l))))

; (last-element (list 1 2 3 4 5)) ; 5

; remove-last as defined to take a list as input and return a list removing the last element using recursion
; if the rest of l is null then return an empty list
; otherwise cons the first of l passing the rest of l in a recursive call
; when the rest/cdr of l is null, an empty list is returned and thus the last element of l is not cons to the new list
(define (remove-last l)
  (if (null? (cdr l))
	'()
	(cons (car l) (remove-last (cdr l)))))

; (remove-last (list 1 2 3 4 5)) ; '(1 2 3 4)

; rcycle as defined to take a list as input and returns the list cyclically shifted one place to the right 
(define (rcycle l)
  (if (null? l)
	'()
	(append-list (list (last-element l)) (remove-last l))))

(rcycle (list 1 2 3 4 5)) ; '(5 1 2 3 4)

