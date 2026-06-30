#lang racket

;; define sum-list function
(define (sum-list lst)
  (cond ((empty? lst) 0)
        (else (+ (first lst) (sum-list (rest lst))))))
;; export sum-list function
(provide sum-list)

