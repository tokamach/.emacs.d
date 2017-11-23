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
    ("pinkish\n"   (load-new-theme 'birds-of-paradise-plus))
    ("dark\n"      (load-new-theme 'ciapre))
    (_             (load-new-theme 'zenburn)))) ;fallback

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

;; Smart mode line
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'smart-mode-line-respectful)
(sml/setup)

;; Evil binds
(load "~/.emacs.d/evil-binds.el")
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional))

(which-key-mode)

;; entry-plug binds
;(require 'entry-plug)
;(global-set-key (kbd "C-SPC") 'entry-plug-mode)
;(entry-plug-keymap-from-list
; '(("h" "C-b")
;   ("j" "C-n")
;   ("k" "C-p")
;   ("l" "C-f")))

;; neotree
(setq neo-theme (if (display-graphic-p) 'ascii))
(setq neo-smart-open t)
(add-hook 'neotree-mode-hook
    (lambda ()
      (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
      (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
      (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
      (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

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

;; Latex
(exec-path-from-shell-initialize)
