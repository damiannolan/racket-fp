#lang racket

; Write a function that takes a list as input and returns the number of non-zero elements in it.

(define (hamming-weight lst)
  (if (null? lst)
	'()
	(if (= (car lst) 0)
	  (hamming-weight (cdr lst))
	  (cons (car lst) (hamming-weight (cdr lst))))))

(hamming-weight '(1 0 1 0 1 1 1 0)) ; 5

