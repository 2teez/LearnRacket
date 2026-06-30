#lang racket

(displayln "Start, Here!")

(define my-test-list '(1 2 3 5 7 8))
(define (add-one x) (+ x 1))
(define (gt-one x) (> x 1))
(define (my-map f lst)
  (cond ((empty? lst) '())
        (else (cons (f (car lst)) (my-map f (cdr lst))))))

(define (my-filter f lst)
  (cond ((empty? lst) '())
        (else
          (if (f (car lst))
              (cons (car lst) (my-filter f (cdr lst)))
              (my-filter f (cdr lst))))))

;; using map to apply add-one and gt-one to my-test-list
(map add-one my-test-list)
(map gt-one my-test-list)

;; using my-map to apply add-one and gt-one to my-test-list
(my-map add-one my-test-list)
(my-map gt-one my-test-list)

(define (even-number x) (even? x))
(define (odd-number x) (odd? x))

;; using filter to filter my-test-list
(filter odd-number my-test-list)
(filter even-number my-test-list)

;; using my-filter to filter my-test-list
(my-filter odd-number my-test-list)
(my-filter even-number my-test-list)
