#lang racket

; - The list to be reduced is the combinations of '(1 2 3 4 -5)
; - To reduce it, we need to find the sum of each combinations
; - and keep the ones = 0

(define (sum lst)
  (if (null? lst)
	0
	(+ (car lst) (sum (cdr lst)))))

(define (sublsum-aux lst1 lst2)
  (if (null? lst1)
	'()
    (if (= 0 (car lst1))
	  (cons (car lst2) (sublsum-aux (cdr lst1) (cdr lst2)))
	  (sublsum-aux (cdr lst1) (cdr lst2)))))

(define (sublsum lst)
  (sublsum-aux (map sum (cdr (combinations lst))) (cdr (combinations lst))))

(sublsum '(1 2 3 4 -5))
