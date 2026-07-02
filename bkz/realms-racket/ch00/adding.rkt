#lang racket

;; Adds up all the numbers in a list
; lst: the list of numbers to sum up
(define (sum-up lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-up (cdr lst))))))

; Applies a function to each element of a list, accumulating the result
; func: the function to apply to each element
; acc: the initial accumulator value
; lst: the list to reduce
(define (reduce func acc lst)
  (cond ((empty? lst) acc)
        (else (reduce func (func acc (car lst)) (cdr lst)))
        ))
;; exports the sum-up and reduce functions
(provide sum-up reduce)
