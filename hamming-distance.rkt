#lang racket

; Write a function that takes two lists and returns the number of positions in which they differ.
; For example: 
;   '(1 0 1 0 1 1 1 0)
;   '(1 1 1 1 0 0 0 0)
; Hamming Distance = 5

; Count function
; Count the number of elements in a list
(define (count lst)
  (if (null? lst)
	0
	(+ 1 (count (cdr lst)))))

; Auxiliary Function which essentially does the work
(define (hamming-distance-aux lst1 lst2)
  (if (null? lst1)
	0
    (if (= (car lst1) (car lst2))
	  (hamming-distance-aux (cdr lst1) (cdr lst2))
	  (+ 1 (hamming-distance-aux (cdr lst1) (cdr lst2))))))

; Hamming Distance - the auxiliary function wrapped to essentially check for lists of equal length before computing the
; hamming distance.
; Racket's built in displayln function is used to log an error message to the terminal
; Could also simply replace this to return -1 if the lists are not of equal length
(define (hamming-distance lst1 lst2)
  (if (= (count lst1) (count lst2))
	(hamming-distance-aux lst1 lst2)
	(displayln "Lists must be of equal length")))

(hamming-distance '(1 0 1 0 1 1 1 0) '(1 1 1 1 0 0 0 0)) ; 5

(hamming-distance '(1 0 1 0 1 1 1 0) '(1 1 1 1)) ; "Lists must be of equal length"

