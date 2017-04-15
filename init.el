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
   ("M" "~/Pictures/animu/madoka_magica/mami")))

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

;; xah-fly-keys
;(require 'xah-fly-keys)
;(xah-fly-keys-set-layout "qwerty")
;(xah-fly-keys 1)

;; evil and evil-leader binds
(global-evil-leader-mode)
(require 'evil) ;avoids arthiritis
(evil-mode 1)
(add-to-list 'evil-emacs-state-modes 'waifu-mode) ; stop eviling it up

(define-key evil-normal-state-map (kbd ";") 'smex)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ";" 'smex
  "qq" 'save-buffers-kill-terminal
          ;files
  "ff" 'find-file
  "fw" 'save-buffer
  "fd" 'dired
          ;windows
  "w-" 'split-window-below
  "w/" 'split-window-right
  "wh" 'evil-window-left
  "wj" 'evil-window-down
  "wk" 'evil-window-up
  "wl" 'evil-window-right
  "ww" 'other-window
  "wc" 'delete-window
  "wr" 'evil-window-rotate-upwards
  "wR" 'evil-window-rotate-downwards
  "wb" 'balance-windows
  "wf" 'toggle-frame-fullscreen
          ;buffers
  "bb" 'switch-to-buffer
  "bk" 'kill-buffer
    ;eval
  "eb" 'eval-buffer
  "er" 'eval-expression
  "ev" 'eval-region
          ;registers
  "ry" 'copy-to-register
  "rp" 'insert-register
          ;latex
  "lp" 'preview-buffer
  "lc" 'preview-clearout-buffer
          ;git
  "gg" 'magit-status
  "gc" 'magit-commit
  "gp" 'magit-push
  "gs" 'magit-stage
          ;minor modes
  "pp" 'parinfer-mode
  "pt" 'parinfer-toggle-mode
  "ps" 'show-paren-mode
  "po" 'olivetti-mode
  "pc" 'company-mode
  "pf" 'fci-mode
  "pw" 'waifu
          ; applications
  "at" 'tetris
  "a2" '2048-game
  "aw" 'eww)

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

