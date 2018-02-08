#lang racket

(define (rotate-left l)
  (if (null? l) '()
	(append (cdr l) (cons (car l) '()))))

(rotate-left '(1 2 3 4))

(define (last-element l)
  (if (null? (cdr l))
	(car l)
	(last-element (cdr l))))

(last-element '(1 2 3 4))

