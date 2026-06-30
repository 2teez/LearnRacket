#lang racket

(displayln "Start Here!")

(define (fact x)
  (if (<= x 1) 1 (* x (fact (- x 1)))))

(displayln (fact 5)) ;; > 120

(define (looper lst acc)
  (if (empty? lst)
      acc
      (looper (rest lst)
              (cons (fact (first lst)) acc))))
(println (looper (range 100 0 -3) '())) ;; > '()
