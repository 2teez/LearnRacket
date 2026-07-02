#lang racket

;; utility to sum the elements of a list
(define (sum-list lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-list (cdr lst))))))

;; utility to reduce a list using a function f and an accumulator acc
(define (reduce f acc lst)
  (cond ((empty? lst) acc)
        (else (f (car lst) (reduce f acc (cdr lst))))))

; Run a function f counter times, printing the result each time
(define (looper f counter)
  (cond ((= counter 0) 'done)
        (else (begin
                (printf "function: ~a: " f)
                (displayln (f))
                )
              (looper f (sub1 counter)))))

;; utility to get the last element of a list
(define (last lst)
  (if (empty? lst)
      (error "empty list")
      (let ([v (list->vector lst)])
        (vector-ref v (- (vector-length v) 1)))))

;; export the following functions namely sum-list, reduce, looper, and last
(provide sum-list reduce looper last)
