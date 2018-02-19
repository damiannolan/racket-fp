#lang racket

(define (comb lst)
  (combinations lst))

(comb '(1 2 3))

(define (sum lst)
  (if (null? lst) 0
	(+ (car lst) (sum (cdr lst)))))

(sum '(1 2 3))

(define (sublsum lst)
  (if (= (sum (car (combinations lst) 0)))
	(cons (car (combinations lst)) (sublsum (cdr lst)))
	(sublsum (cdr (combinations lst)))))

(sublsum '(1 2 3 4 -5))


; if the sum of the car of the combinations equals 0 - cons to list and recursive call with cdr
; else recursive call with cdr
