;;;; waifu.el --- Browse trash^H^H^H^H^H images folder
;;;; inspiration from xkcd-mode, thanks i guess

;;; Commentary:
;; i GUESS if you REALLY WANTED you could use this
;; for browsing NORMAL image folders. but I don't
;; really see why you'd do that
;;
;; requires image-magick to be compiled in to emacs

;;; Code:
(define-derived-mode waifu-mode special-mode "waifu"
  "Major mode for browsing waifu folder"
  :group 'waifu)

(define-key waifu-mode-map (kbd "r") 'waifu-random-root)
(define-key waifu-mode-map (kbd "c") 'waifu-comf)

(defgroup waifu nil
  "A waifu browser"
  :group 'multimedia)

(defcustom root-waifu-directory
  "~/Pictures/animu/"
  "waifu store aka trash"
  :group 'waifu
  :type 'directory)

;; #lispisbest
(defun waifu-keybind-to-dir (key-dir-list)
  (dolist (key-dir-pair key-dir-list)
    (let ((key  (car key-dir-pair))
          (path (nth 1 key-dir-pair))) ;bad but work
      (define-key waifu-mode-map
                  (kbd key)
                  `(lambda () (interactive) (waifu-random ',path))))))

(defun get-file-list-recurse (rootdir)
  (directory-files-recursively rootdir ".*\.\\(jpg\\|jpeg\\|png\\|gif\\)"))

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

(defun waifu-random (curdir)
  (interactive)
  (let* ((imgs (get-file-list-recurse curdir))
         (img-path (nth (random (length imgs)) imgs)))
    (waifu-show img-path)))

(defun waifu-random-root ()
  (interactive)
  (let* ((imgs (get-file-list-recurse root-waifu-directory))
         (img-path (nth (random (length imgs)) imgs)))
    (waifu-show img-path)))

(defalias 'waifu 'waifu-random-root)

(provide 'waifu)
;;; waifu.el ends here
