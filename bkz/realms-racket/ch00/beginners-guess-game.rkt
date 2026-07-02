#lang racket

;; Guess the number game
;; Play a game where the user guesses a number between 1 and 100
(define lower 1)
(define upper 100)
(define (guess)
  (quotient (+ lower upper) 2))
(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))
(define (larger)
  (set! lower (min upper (add1 (guess))))
  (guess))
