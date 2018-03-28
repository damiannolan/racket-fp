#lang racket

; Rough work snippets

(define (sum lst)
  (if (null? lst) 0
	(+ (car lst) (sum (cdr lst)))))

(sum '(1 2 3))

(map sum (combinations '(1 2 3 4 -5)))

(define (sublsum lst)
  (if (null? lst)
	'()
	(sublsum-aux = 0 (combinations lst))))

(define (sublsum-aux f z lst)
  (if (null? lst)
	'()
	(if (f (car (map sum lst)) z)
	  (cons (car lst) (sublsum-aux f z (cdr lst)))
	  (sublsum-aux f z (cdr lst)))))

(sublsum '(1 2 3 4 -5))


(require math/number-theory)

(filter prime? (range 1 21))

(define (decide-prime x)
    (prime? x))

(decide-prime 37)

