;;;; entry-plug.el --- Minor mode for modal editing
;;;; just get in the fucking text editor shinji
;;;; -*- lexical-binding: t; -*-

(defvar entry-plug-mode-map (make-sparse-keymap))

(defun entry-plug--extract-command-or-key (cmd)
  (cond ((stringp cmd) (key-binding cmd))
	(t cmd)))

(defun entry-plug-keymap-from-list (list)
  (dolist (key-elem list)
    (let ((key (car key-elem))
          (cmd (nth 1 key-elem)))
      (define-key entry-plug-mode-map
	(kbd key)
	(entry-plug--extract-command-or-key cmd)))))

(define-minor-mode entry-plug-mode
  "Modal editing mode"
  :lighter " entry-plug"
  :keymap entry-plug-mode-map)

(define-globalized-minor-mode
  entry-plug-global-mode
  entry-plug-mode
  (lambda () (entry-plug-mode 1)))
  
(provide 'entry-plug)
;;; entry-plug.el ends here
