#lang racket

(define a-number 123)
(define b-number a-number)
(displayln (list a-number 'eq b-number (eq? a-number b-number)))
(printf "~a == ~a is ~a\n" a-number b-number (equal? a-number b-number))
;;(list (car a-number) (cdr b-number)) ; this would work car/cdr expect a pair

(displayln ((lambda (x) (+ x 1)) 1)) ; anonymous function/procedure

(define add-1-to (lambda (x) (+ x 1)))

(writeln (add-1-to 3))

(define (add-2-to x) (+ x 2)) ;; function/procedure without the lambda wordings

(writeln (add-2-to 3))
