#lang racket

; Write, from scratch, a function in Racket that uses brute-force algorithm
; that takes a single positive integer and return true if the number is a prime
; and false otherwise.

(require math/number-theory)

(filter prime? (range 1 21))

(define (decide-prime x)
  (prime? x))

(decide-prime 37)

