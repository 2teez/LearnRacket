#lang racket

;; Guess the number game
;; Play a game where the user guesses a number between 1 and 100
(define lower 1)
(define upper 100)
(define (guess)
  (quotient (+ lower upper) 2))

;
(define (smaller)
  (set! upper (max lower (sub1 (guess))))
  (guess))

;
(define (larger)
  (set! lower (min upper (add1 (guess))))
  (guess))

; Start the game with a given range [n, m]
(define (start n m)
  (set! lower (min n m))
  (set! upper (max n m))
  (guess))

; Reset the game to the initial state
(define (reset)
  (set! lower 1)
  (set! upper 100)
  (guess))

; Run a function f counter times, printing the result each time
(define (looper f counter)
  (cond ((= counter 0) 'done)
        (else (begin
                (printf "function: ~a: " f)
                (displayln (f))
                )
              (looper f (sub1 counter)))))
