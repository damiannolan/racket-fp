#lang racket

; Sum function to add up elements of a list
(define (sum lst)
  (if (null? lst)
    0	
    (+ (car lst) (sum (cdr lst)))))

; Filter function
; The filter function returns a list in which every element satisfies a predicate
(define (filterx p? lst)
  (if (null? lst)
	'()
	(if (p? (car lst))
	  (cons (car lst) (filterx p? (cdr lst)))
	  (filterx p? (cdr lst)))))

; Predicate function
; The predicate function defined below will return true if the sum of the list equals zero
; And false otherwise
; Due to the nature of the null list being equal to 0 from the sum function above it has been adapted to 
; adhere to the given sample answer in the problem using logical 'and' and 'not'
(define (equals-zero x)
  (if (and (= 0 (sum x)) (not (null? x)))
	#t
	#f))

; Sublsum function - essentially subset sum
; Given a list - lst
; Filter the list of combinations satisfying the predicate function
(define (sublsum lst)
  (filterx equals-zero (combinations lst)))

(sublsum '(1 2 3 4 -5))

