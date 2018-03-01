;; kawaiify.el
;; load theme based on global lock
;; todo: flexibilise

(require 'cl)
(require 'filenotify)

(defun load-new-theme (theme)
  (interactive)
  (dolist (i custom-enabled-themes)
    (disable-theme i))
  (load-theme theme t)
  (load-theme 'smart-mode-line-respectful t))

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun theme-update-callback (event)
  (pcase (get-string-from-file "~/.kawaiify/theme.lock")
    ("pink\n"      (load-new-theme 'base16-unikitty-light))
    ("purpur\n"    (load-new-theme 'base16-paraiso))
    ("sleeper\n"   (load-new-theme 'adwaita))
    ("catboi\n"    (load-new-theme 'creamsody) (creamsody-modeline-two))
    ("blue\n"      (load-new-theme 'creamsody) (creamsody-modeline-two))
    ("green\n"     (load-new-theme 'creamsody) (creamsody-modeline-two))
    ("pinkish\n"   (load-new-theme 'birds-of-paradise-plus))
    ("dark\n"      (load-new-theme 'ciapre))
    ("ugly\n"      (load-new-theme 'birds-of-paradise-plus))
    (_             (load-new-theme 'zenburn)))) ;fallback

(theme-update-callback 0)
(file-notify-add-watch
 "~/.kawaiify/theme.lock"
 '(change attribute-change)
 'theme-update-callback)
