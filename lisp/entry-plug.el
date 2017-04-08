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

(defun waifu-keybind-to-dir (key-dir-list)
  (dolist (key-dir-pair key-dir-list)
    (let ((key  (car key-dir-pair))
          (path (nth 1 key-dir-pair))) ;bad but work
      (define-key waifu-mode-map
                  (kbd key)
                  `(lambda () (interactive) (waifu-random ',path))))))

(define-minor-mode entry-plug-mode
  "Modal editing mode"
  nil " entry-plug")

  
