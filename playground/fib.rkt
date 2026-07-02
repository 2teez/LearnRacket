#lang racket

;; import function defined in util/util.rkt
(require "util/util.rkt")

(displayln "Start, Here!")
(define (fib n)
  (cond
    ((<= n 0) 0)
    ((<= n 2) 1)
    (else (+ (fib (- n 1))
             (fib (- n 2))))))

#|
;; utility to get the last element of a list
(define (last lst)
  (first (reverse lst)))
|#

;;
(last (map fib (range -5 34)))
