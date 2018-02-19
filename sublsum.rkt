#lang racket

(define (append-list list1 list2)
    (if (null? list1)
	  list2
	  (cons (car list1) (append-list (cdr list1) list2))))

(define (comb lst)
  (combinations lst))

(comb '(1 2 3))

(define (sum lst)
  (if (null? lst) 0
	(+ (car lst) (sum (cdr lst)))))

(sum '(1 2 3))

(define (temp lst)
  (if (= (sum (car (comb lst))) 0) #t #f))

(temp '(1 2 3))

(define (helper lst)
  (if (null? lst)
	'()
    (if (= (sum (car lst)) 0)
	  (cons (car lst) (helper (cdr lst)))
	  (helper (cdr lst)))))

(define (wrapper lst)
  (if (null? lst)
	'()
	(helper (combinations lst))))

(wrapper '(1 2 3 4 -5))


(define (sublsum lst)
  (if (= (sum (car (combinations lst))) 0)
	(append-list (car (combinations lst)) (sublsum (cdr (combinations lst))))
	(sublsum (cdr (combinations lst)))))

;(sublsum '(1 2 3 4 -5))


; if the sum of the car of the combinations equals 0 - append to list and recursive call with cdr
; else recursive call with cdr
