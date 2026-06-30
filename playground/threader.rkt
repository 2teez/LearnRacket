#lang racket

(displayln "Start, Here!")
(define (detailed-fact n)
  (begin
    (displayln (format "Calculating factorial of ~a.." n))
    (cond ((= n 0) 1)
          (else (* n (detailed-fact (- n 1)))))))
(begin (detailed-fact 5)
  (detailed-fact 23))

;; using thread
(writeln "Using threading macro in racket.")
(begin
  (thread (lambda () (detailed-fact 5)))
  (thread (lambda () (detailed-fact 23))))
