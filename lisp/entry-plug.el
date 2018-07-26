;;;; entry-plug.el --- Minor mode for modal editing
;;;; just get in the fucking text editor shinji
;;;; -*- lexical-binding: t; -*-

(defvar entry-plug-mode-map (make-sparse-keymap))
(defvar entry-plug-mode-enabled-p t)

(defcustom entry-plug/leader "<SPC>"
  "Leader key for entry-plug mode"
  :type 'string)

(defcustom entry-plug/exit-key "<ESC>"
  "Key to return to entry-plug mode"
  :type 'string)

(defun entry-plug/set-leader-key (key)
  (setq entry-plug/leader key))

(defun entry-plug--extract-command-or-key (cmd)
  (cond ((stringp cmd) (key-binding cmd))
        (t cmd)))

(defun entry-plug/set-root-keymap (key cmd &rest bindings)
  (while key
    (define-key entry-plug-mode-map
      (read-kbd-macro key)
      cmd)
    (setq key (pop bindings)
	  cmd (pop bindings))))

(defun entry-plug/set-leader-keymap (key cmd &rest bindings)
  (while key
    (define-key entry-plug-mode-map
      (read-kbd-macro (concat entry-plug/leader key))
      cmd)
    (setq key (pop bindings)
	  cmd (pop bindings))))

(define-minor-mode entry-plug-mode
  "Modal editing mode"
  :lighter " entry-plug"
  :keymap entry-plug-mode-map)

;; (define-globalized-minor-mode
;;   global-entry-plug-mode
;;   entry-plug-mode
;;   (lambda ()
;;     (define-key )
;;     (entry-plug-mode 1)))
  
(provide 'entry-plug)
;;; entry-plug.el ends here
