#lang racket

; Write a function that takes a list as input and returns the number of non-zero elements in it.
; The function stated above can be easily achieved using a filter function and count function.

; Filter function
; The filter function returns a list in which every element satisfies a predicate
(define (filterx p? lst)
  (if (null? lst)
    '()
    (if (p? (car lst))
	  (cons (car lst) (filterx p? (cdr lst)))
	  (filterx p? (cdr lst)))))

; Predicate function
; If the atom x is equal to zero then returns false, otherwise return true
(define (non-zero x)
  (if (= 0 x)
	#f
	#t))

; Count function
; Count the number of elements in a list
(define (count lst)
  (if (null? lst)
	0
	(+ 1 (count (cdr lst)))))

; (count '(1 2 3)) ; 3

; Hamming List
; Combining the use of the above helper functions
; Count the number of elements that satisfy the non-zero function
(define (hamming-weight lst)
  (count (filterx non-zero lst)))

(hamming-weight '(1 0 1 0 1 1 1 0)) ; 5
