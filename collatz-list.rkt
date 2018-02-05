#lang racket

; The Collatz Conjecture - using recursive lists

; The Collatz conjecture is a conjecture in mathematics that concerns a sequence defined as follows: start with any
; positive integer n. Then each term is obtained from the previous term as follows: if the previous term is even, the
; next term is one half the previous term. Otherwise, the next term is 3 times the previous term plus 1. The conjecture
; is that no matter what value of n, the sequence will always reach 1.

(define (collatz-list n)
  (collatz-conj n (list n)))

(define (collatz-conj n l)
  (if (= n 1)
	l
	(if (= (modulo n 2) 0)
	  (collatz-conj (/ n 2) (append l (list (/ n 2))))
	  (collatz-conj (+ 1 (* n 3)) (append l (list (+ 1 (* n 3))))))))

(collatz-list 5) ; '(5 16 8 4 2 1)

(collatz-list 9) ; '(9 28 14 7 22 11 34 17 52 26 13 40 20 10 5 16 8 4 2 1)

(collatz-list 2) ; '(2 1)
