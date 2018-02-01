#lang racket

; The Collatz Conjecture

(define (collatz-list n)
  (collatz-conj n (list n)))

(define (collatz-conj n l)
  (if (= n 1)
	l
	(if (= (modulo n 2) 0)
	  (collatz-conj (/ n 2) (append l (list (/ n 2))))
	  (collatz-conj (+ 1 (* n 3)) (append l (list (+ 1 (* n 3))))))))

(collatz-list 5)
