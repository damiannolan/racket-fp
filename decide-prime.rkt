#lang racket

; Write, from scratch, a function in Racket that uses brute-force algorithm that
; takes a single positive integer and return true if the number is a prime and false
; otherwise. Call the function decide-prime

; A function that takes a single positive integer
; 1 is NOT prime so always return false
; Otherwise call the function prime passing n and 2 as the starting value of test-no
(define (decide-prime? n)
  (if (= n 1)
      #false
  (prime n 2)
))

; Helper function for essentially testing if n has any factors > 1 or itself
; Returns true if a % b == 0
(define (factor x y)
  (= (modulo x y) 0)
)

; Recursively call itself incrementing the test-no value by 1 if the following
; conditions evaluate
; -> n is NOT 1
; -> n / 2 is greater than test-no
; -> n % test-no is NOT zero
(define (prime n test-no)
  (if (> test-no (/ n 2))
      #true
  (if (factor n test-no)
      #false
  (prime n (+ test-no 1)))))

(decide-prime? 1)

(decide-prime? 7)
; Evaluation path of 7
; 2 > 3.5 -> false
; factor -> false
; 3 > 3.5 -> false
; factor -> false
; 4 > 3.5 - true
; 7 is prime because its only factors are itself and 1

(decide-prime? 6)
; Evaluation path of 6
; 2 > 3 -> false
; factor -> true
; 6 is NOT prime because it has at least 1 more factor than 1 and itself
; Function returns and recursion is terminated
