#lang racket

;; test sum-list function
(require "blockchain.rkt")
(require rackunit)

(check-equal? (sum-list '(1 2 3)) 6)

