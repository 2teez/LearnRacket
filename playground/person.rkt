#lang racket

(displayln "Start, Here!")
(struct person (first-name last-name age) #:transparent #:mutable)

(define a-person (person "John" "Doe" 30))
(displayln a-person)
(displayln (person-first-name a-person))
(displayln (person-last-name a-person))
(displayln (person-age a-person))

;; change the last-name of the person
(set-person-last-name! a-person "Java")
(displayln a-person)
