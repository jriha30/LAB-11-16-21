;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |LAB 11 16 21|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;1. (A (B (D 1 2) (E 3 4)) (C (F 5 6) (G 7 8)))

(define count-block-exp
  (lambda (block-exp sum)
    (cond
      ((null? block-exp) sum)
      ((number? block-exp) (+ block-exp sum))
      ((symbol? block-exp) (count-block-exp '() 0))
      (else
       (+ (+ (count-block-exp (car block-exp) sum) (count-block-exp (cadr block-exp) sum)) (count-block-exp (caddr block-exp) sum))))))


(define collect-symbols
  (lambda (block-exp)
    (cond
      ((null? block-exp) '())
      ((number? block-exp) '())
      ((symbol? block-exp) (list block-exp))
      (else
       (append (append (collect-symbols (car block-exp)) (collect-symbols (cadr block-exp))) (collect-symbols (caddr block-exp)))))))

