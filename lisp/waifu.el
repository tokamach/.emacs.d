;;;; waifu.el --- Browse trash^H^H^H^H^H images folder
;;;; inspiration from xkcd-mode, thanks i guess

;;(require 'cl) ;thank common lisp for useful
;; lol nvm

;;; Commentary:
;; what am i doing
;; it's not even written well
;; meta-irony levels approaching overflow
;;
;; requires image-magick to be compiled in to emacs

;;; Code:
(define-derived-mode waifu-mode special-mode "waifu"
  "Major mode for browsing waifu folder"
  :group 'waifu)

(define-key waifu-mode-map (kbd "r") 'waifu-random)
(define-key waifu-mode-map (kbd "c") 'waifu-comf)

(defgroup waifu nil
  "A waifu browser"
  :group 'multimedia)

(defcustom waifu-directory
  "~/Pictures/animu/"
  "waifu store aka trash"
  :group 'waifu
  :type 'directory)

;; #lispisbest
(defun waifu-keybind-to-dir (key-dir-list)
  (mapcar (lambda (key-dir)
            (message "%s" `(cdr ,key-dir))
            (define-key waifu-mode-map
                        (kbd (car key-dir))
                        `(lambda () (interactive) (waifu-show (cdr ,key-dir)))))
          key-dir-list))

(defun get-files-from-root ()
  (directory-files-recursively waifu-directory ".*\.\\(jpg\\|jpeg\\|png\\|gif\\)"))

(defun waifu-show (filepath)
  (set-transient-map waifu-mode-map)
  (let* ((img '(create-image filepath 'imagemagick nil))
         (img-dimensions (image-size (eval img) :pixels))
         (width (car img-dimensions))
         (height (cdr img-dimensions)))
    (get-buffer-create "*waifu*")
    (switch-to-buffer "*waifu*")
    (waifu-mode)
    (let (buffer-read-only)
      (erase-buffer)
      (cond
       ((> width height) (setq img (append img '(:width (window-pixel-width)))))
       ((> height width) (setq img (append img '(:height (window-body-height nil t))))))
      (center-line)
      (insert-image (eval img))
      (beginning-of-buffer))))

(defun waifu-comf ()
  (interactive)
  (waifu-show "/Users/tom/Pictures/animu/madoka_magica/homura/1489990442923.jpg"))

(defun waifu-random ()
  (interactive)
  (let* ((imgs (get-files-from-root))
         (img-path (nth (random (length imgs)) imgs)))
    (waifu-show img-path)))

(defalias 'waifu 'waifu-random)

(provide 'waifu)
;;; waifu.el ends here
