#lang racket

;; struct stack
(struct stack (items) #:prefab)

;; create a new stack
(define (new-stack)
  (stack '()))

;; push an item onto the stack
(define (push stk item)
  (stack (cons item (stack-items stk))))

;; pop an item from the stack
(define (pop stk)
  (if (empty? (stack-items stk))
      (error "empty stack")
      (let ([items (stack-items stk)])
        (stack (cdr items)))))

;; peek at the top item of the stack
(define (peek stk)
  (if (empty? (stack-items stk))
      (error "empty stack")
      (car (stack-items stk))))

(provide stack new-stack push pop peek)
