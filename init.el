;; My init.el
;; elisp is cool

;; package
;; shit
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; custom-variable stuff
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; personal
;; config
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colors/")

;; waifu-mode
(require 'waifu)
(waifu-keybind-to-dir
 '(("m" "~/Pictures/animu/madoka_magica/madoka")
   ("h" "~/Pictures/animu/madoka_magica/homura")
   ("s" "~/Pictures/animu/madoka_magica/sayaka")
   ("k" "~/Pictures/animu/madoka_magica/kyouko")
   ("M" "~/Pictures/animu/madoka_magica/mami")
   ("t" "~/Pictures/animu/gabriel_dropout/tapris")
   ("v" "~/Pictures/animu/gabriel_dropout/vigne")))

;;tramp
(setq tramp-default-method "ssh")

;;flyspell
(setq ispell-program-name "/usr/local/bin/ispell")

;; stop backups
(setq backup-inhibited t
      auto-save-default nil)

;; ｍｉｎｉｍａｌｉｓｍ
(blink-cursor-mode 0)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

;; slime
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; kawaiify theme
(require 'cl)
(require 'filenotify)

(defun get-string-from-file (filePath)
  "Return filePath's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(defun theme-update-callback (event)
  (pcase (get-string-from-file "~/.kawaiify/theme.lock")
    ("pink\n" (load-theme 'pink-bliss t))
    ("tol\n"  (load-theme 'birds-of-paradise-plus t))
    ("dark\n" (load-theme 'zenburn t))
    (_ (load-theme 'creamsody t)))) ;blue

(theme-update-callback 0)

(file-notify-add-watch
 "~/.kawaiify/theme.lock"
 '(change attribute-change)
 'theme-update-callback)

;;Smart mode line
(setq sml/no-confirm-load-theme t)
(sml/setup)

;;Evil binds
(load "~/.emacs.d/evil-binds.el")

;; xah-fly-keys
;(require 'xah-fly-keys)
;(xah-fly-keys-set-layout "qwerty")
;(xah-fly-keys 1)

(which-key-mode)

;; ido and smex
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

