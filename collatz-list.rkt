#lang racket

; The Collatz Conjecture - using recursive lists

; The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined as follows: start with any
; positive integer n. Then each term is obtained from the previous term as follows: if the previous term is even, the
; next term is one half the previous term. Otherwise, the next term is 3 times the previous term plus 1. The conjecture
; is that no matter what value of n, the sequence will always reach 1.

; It is possible to construct an append function which is written from scratch using only null?, cons, car and cdr
; cons - takes two args. If the 2nd arg is a list 
; -> makes the 1st arg the first of the new list
; -> makes the 2nd arg the rest of the new list
; car list1 -> 1 cdr 2 3 -> 1 2 cdr 3 -> 1 2 3 cdr null -> 1 2 3 4 5 6

; car list1 is 1 cdr is 2 3
; car list1 is 2 cdr is 3
; car list1 is 3 cdr is null
; cons 1 2 3 with 4 5 6 -> '(1 2 3 4 5 6)
(define (append-list list1 list2)
  (if (null? list1)
	list2
	(cons (car list1) (append-list (cdr list1) list2))))

(append-list '(1 2 3) '(4 5 6)) ; '(1 2 3 4 5 6)

(define (collatz-list n)
  (collatz-conj n (list n)))

(define (collatz-conj n l)
  (if (= n 1)
	l
	(if (= (modulo n 2) 0)
	  (collatz-conj (/ n 2) (append-list l (list (/ n 2))))
	  (collatz-conj (+ 1 (* n 3)) (append-list l (list (+ 1 (* n 3))))))))

(collatz-list 5) ; '(5 16 8 4 2 1)

(collatz-list 9) ; '(9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)

(collatz-list 2) ; '(2 1)
