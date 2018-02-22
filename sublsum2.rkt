#lang racket

(define (sum l)
  (if (null? l)
    0	
    (+ (car l) (sum (cdr l)))))

; If the car of the map sum of combinations = 0
; cons the car with a recursive call passing the cdr of l
; Otherwise make a recursive call passing the cdr of l
(define (sublsum f z l)
 (if (null? l) 
   '() 
   (if (f (car (map sum l)) z)
	 (cons (car l) (sublsum f z (cdr l)))
	 (sublsum f z (cdr l)))))

(sublsum = 0 (combinations '(1 2 3 4 -5)))

