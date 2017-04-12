;;;; entry-plug.el --- Minor mode for modal editing
;;;; just get in the fucking text editor shinji
;;;; -*- lexical-binding: t; -*-

(defvar entry-plug-mode-map (make-sparse-keymap))

(defun entry-plug-keymap-from-list (list)
  (dolist (key-elem list)
    (let ((key (car key-elem))
          (cmd (nth 1 key-elem)))
      (define-key entry-plug-mode-map
                  (kbd key)
                  cmd))))

(define-minor-mode entry-plug-mode
  "Modal editing mode"
  nil " entry-plug")

(defun entry-plug ()
  (interactive)
  ())

(provide 'entry-plug)
