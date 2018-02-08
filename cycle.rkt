#lang racket

(define (rotate-left l)
  (if (null? l) '()
	(append (cdr l) (cons (car l) '()))))

(rotate-left '(1 2 3 4))

