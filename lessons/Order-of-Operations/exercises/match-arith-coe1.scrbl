#lang curr/lib

@(define exprs '((/ (* -1 2) 5)
                 (/ 5 (* -1 2))
		 (* (- 4 5) (+ 2 3))
		 (- (* 4 5) (+ 2 3))
		 (* (- (+ 2 2) 5) (+ 3 2))
		 (* (+ 5 (- 2 2)) (+ 3 2))
	         (+ (/ 6 3) 0)
	         (+ (- 5 5) (/ 6 3))
	         ))

@(define permuted-exprs
   '((+ (- 5 5) (/ 6 3))
     (- (* 4 5) (+ 2 3))
     (/ (* -1 2) 5)
     (+ (/ 6 3) 0)
     (* (- 4 5) (+ 2 3))
     (* (+ 5 (- 2 2)) (+ 3 2))
     (/ 5 (* -1 2))
     (* (- (+ 2 2) 5) (+ 3 2))
     ))

@(exercise-handout 
  #:title "Matching Circles of Evaluation and Arithmetic Expressions"
  #:instr "Match each Circle of Evaluation in the left column with its corresponding arithmetic expression in the right column:" 
  @(matching-exercise 
    (map sexp exprs)
    (map sexp->math permuted-exprs)))