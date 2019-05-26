;;; My init.el
;;; elisp is cool

;; package shit
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; personal config
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colors/")

;;; editor config
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

;; theme
(load-theme 'doom-peacock)

;; tramp
(setq tramp-default-method "ssh")

;; flyspell
(setq ispell-program-name "/usr/local/bin/ispell")

;; smooth scroll
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)

(global-undo-tree-mode)

;; stop backups
(setq backup-inhibited t
      auto-save-default nil)

;; fonts
(set-frame-font "Anonymous Pro 12" nil t)

;; ｍｉｎｉｍａｌｉｓｍ
(blink-cursor-mode 0)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(fringe-mode 0)
(setq frame-title-format "%b")

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
;(add-to-list 'default-frame-alist '(ns-appearance . dark))
(add-to-list 'default-frame-alist '(ns-appearance . light))

;; better modeline
(require 'doom-modeline)
(doom-modeline-mode 1)

;; modal-soul, my hydras
(load "~/.emacs.d/modal-soul.el")
(which-key-mode)

(global-set-key (kbd "M-x") 'counsel-M-x)

;;; language config
;; C/C++
(setq c-default-style "linux"
      c-basic-offset 4)


(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Lisps
(require 'evil-lispy)
(add-hook 'emacs-lisp-mode-hook  #'evil-lispy-mode)
(add-hook 'common-lisp-mode-hook #'evil-lispy-mode)
(add-hook 'scheme-mode-hook #'evil-lispy-mode)
(add-hook 'lisp-mode-hook #'evil-lispy-mode)

;; Common Lisp
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Latex
(exec-path-from-shell-initialize)
