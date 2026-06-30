#lang racket

(define (sum-list lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-list (cdr lst))))))

(define (reduce f acc lst)
  (cond ((empty? lst) acc)
        (else (f (car lst) (reduce f acc (cdr lst))))))

(provide sum-list reduce)
