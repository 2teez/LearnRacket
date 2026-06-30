#lang racket
(require "util.rkt")


(define lst '(1 2 3 4 5))
(displayln (sum-list lst))
(define acc 0)
(displayln (reduce + acc lst))
