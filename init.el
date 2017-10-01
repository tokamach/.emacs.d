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
   ("v" "~/Pictures/animu/gabriel_dropout/vigne")
   ("f" "~/Pictures/animu/re_zero/felix")
   ("p" "~/Pictures/animu/proggybooks")))

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
    ("doll-loli\n"  (load-theme 'base16-summerfruit-light t))
    ("purpur\n"  (load-theme 'base16-paraiso t))
    ("sleeper\n" (load-theme 'adwaita t))
    ("dragons\n" (load-theme 'anti-zenburn t))
    ("conman\n"  (load-theme 'base16-grayscale-light t))
    ("catboi\n"  (load-theme 'creamsody t) (creamsody-modeline-two))
    ("blue\n"  (load-theme 'creamsody t) (creamsody-modeline-two))
    ("madohomu\n"   (load-theme 'birds-of-paradise-plus t))
    (_ (load-theme 'zenburn t)))) ;fallback

(theme-update-callback 0)
(file-notify-add-watch
 "~/.kawaiify/theme.lock"
 '(change attribute-change)
 'theme-update-callback)

;; tramp
(setq tramp-default-method "ssh")

;; flyspell
(setq ispell-program-name "/usr/local/bin/ispell")

;; smooth scroll
(require 'smooth-scrolling)
(smooth-scrolling-mode 1) 

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
(fringe-mode '(2 . 2))

;; Smart mode line
(setq sml/no-confirm-load-theme t)
(sml/setup)

;; Evil binds
(load "~/.emacs.d/evil-binds.el")
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

;;; Languages
;; C/C++
(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Common Lisp
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Crystal
(require 'crystal-mode)
