#lang racket

(displayln "Start Here!")

(define (fact x)
  (if (<= x 1) 1 (* x (fact (- x 1)))))

(define (fact-iter x acc)
  (cond ((<= x 1) acc)
        (else (fact-iter (- x 1) (* x acc)))))

(displayln (fact 5)) ;; > 120
(displayln (fact-iter 5 1)) ;; > 120

(define (looper lst acc)
  (if (empty? lst)
      acc
      (looper (rest lst)
              (cons (fact (first lst)) acc))))
(println (looper (range 100 0 -3) '())) ;;
(println (looper (reverse (range 100 0 -3)) '())) ;;

;; using fact-iter to avoid stack overflow
;; using car/cdr instead of first/rest
(define (looper-iter lst acc)
  (if (empty? lst)
      acc
      (looper-iter (cdr lst)
                   (cons (fact-iter (car lst) 1) acc))))
(println (looper-iter (range 100 0 -3) '())) ;;
(println (looper-iter (reverse (range 100 0 -3)) '())) ;;
