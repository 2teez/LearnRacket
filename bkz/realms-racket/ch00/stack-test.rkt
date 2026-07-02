#lang racket

(require rackunit)
(require "stack.rkt")
(require rackunit/text-ui)

(define stack-test
  (test-suite
    "stack"
    (test-case
      "new-stack"
      (check-equal? (new-stack) (stack '())))
    (test-case
      "push"
      (check-equal? (push (new-stack) 1) (stack '(1))))
    (test-case
      "pop"
      (check-equal? (pop (push (new-stack) 1)) (stack '())))
    (test-case
      "peek"
      (check-equal? (peek (push (new-stack) 1)) 1))))

(run-tests stack-test 'verbose)
