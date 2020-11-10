;;; ca.el --- Elementary Cellular Automata for Emacs -*- lexical-binding: t; -*-

;;; Commentary:
;; Not much to say here. Could do with some speedup, and proper edge handling.
;; I really use (loop) too much hehe.

(defconst cell-size 2)

(defun make-rule (id)
  "Make a 1D elementary cellular automata lookup array using Wolfram code ID"
  ;; Decompose ID to it's bits. Each bit from LSB to MSB represents the result
  ;; of taking the index of that bit as a lookup trio of cell states.
  (vconcat (loop for index from 0 upto 7
		 for bit = (logand 1 id) then (logand 1 (lsh id (- index)))
		 collect bit)))

(defun rule-lookup (rule a b c)
  (aref rule (logior (lsh a 2)
		     (lsh b 1)
		     (lsh c 0))))

(defun evolve (pop rule)
  "Take a variable size pop POP and evolve according to RULE."
  ;; TODO ignore edges i.e. start at 1 and end at len - 1
  ;; TODO ^ don't do that, instead start at 0 but fake (-1) and (len+1)
  (append '(0) (loop for (a b c) on pop
		     when (not (eq c nil))
		     collect (rule-lookup rule a b c))
	  '(0)))

(defun draw-pop-gen (pop gen)
  "Draw population on GEN, i.e. GEN times cell-size from origin."
  (let ((pop-len (length pop)))
    (loop for cell in pop
	  for n from 1
	  when (eq cell 1)
	  collect `(rect ((x . ,(* n cell-size))
			  (y . ,(* gen cell-size))
			  (width . ,cell-size)
			  (height . ,cell-size))))))

;; TODO random inital pop or single life
(defun draw-rule (svg rule maxgens &rest pop)
  "Draw CA rule RULE, with MAXGENS iterations, onto canvas SVG.
POP specifies a custom population, which defaults to a single 1 in the centre."
  (let* ((svg-width (cdr (assoc 'width (cadr svg))))
	 (padding-list (make-list (/ (/ svg-width cell-size) 2) 0))
	 (pop (when (eq pop nil)
		(append padding-list '(1) padding-list))))
    (loop for i from 0 upto maxgens
	  for iter-pop = pop then (evolve iter-pop rule)
	  append (draw-pop-gen iter-pop i))))

(defun ca-random (rule)
  "Draw a 1d cellular automata in a new *ca* buffer, following RULE,
with a random initial population."
  (interactive "nRule: ")
  (switch-to-buffer "*ca*")
  (erase-buffer)
  (let* ((svg (svg-create (window-pixel-width) (window-pixel-height)))
	 (svg-width (cdr (assoc 'width (cadr svg))))
	 (max-gens (/ (window-pixel-height) cell-size))
	 (rule-arr (make-rule rule)))
    (setq svg (append svg (draw-rule svg rule-arr max-gens
				     (loop for i from 0 upto (/ svg-width cell-size)
					   collect (random 2)))))
    (svg-insert-image svg)
    nil))

(defun ca (rule)
  "Draw a 1d cellular automata in a new *ca* buffer, following RULE."
  (interactive "nRule: ")
  (switch-to-buffer "*ca*")
  (erase-buffer)
  (let ((svg (svg-create (window-pixel-width) (window-pixel-height)))
	(max-gens (/ (window-pixel-height) cell-size))
	(rule-arr (make-rule rule)))
    (setq svg (append svg (draw-rule svg rule-arr max-gens)))
    (svg-insert-image svg)
    nil))
