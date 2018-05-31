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
(load-theme 'base16-phd)

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

;; Evil binds
(load "~/.emacs.d/evil-binds.el")
;; entry-plug binds
;;(load (concat user-emacs-directory "entry-plug-binds.el"))
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

;;; language config
;; C/C++
(setq c-default-style "linux"
      c-basic-offset 4)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; Lisps
;; (require 'evil-lispy)
;; (add-hook 'emacs-lisp-mode-hook  #'evil-lispy-mode)
;; (add-hook 'common-lisp-mode-hook #'evil-lispy-mode)
;; (add-hook 'lisp-mode-hook #'evil-lispy-mode)

;; Common Lisp
(require 'slime)
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Crystal
(require 'crystal-mode)

;; Latex
(exec-path-from-shell-initialize)

;; Java
;(require 'eclim)
;(add-hook 'java-mode-hook 'eclim-mode)
;(require 'company)
;(require 'company-emacs-eclim)
;(company-emacs-eclim-setup)
