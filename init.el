;; My init.el
;; elisp is cool

;; package
;; shit
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; personal
;; config
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/colors/")

;; waifu-mode
(require 'waifu)
(waifu-keybind-to-dir
 '(("m" . "~/Pictures/animu/madoka_magica/stern-homura.jpg")
   ("M" . "~/Pictures/animu/madoka_magica/BuQVDUF.gif")))

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

;; evil and evil-leader binds
(global-evil-leader-mode)
(require 'evil) ;avoids arthiritis
(evil-mode 1)
(define-key evil-normal-state-map (kbd ";") 'smex)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ";" 'smex
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
  "be" 'eval-buffer
  "br" 'eval-expression
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
  "qq" 'save-buffers-kill-terminal
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


;; some stupid emacs trash
;; basically ignore anything below

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "0ee3fc6d2e0fc8715ff59aed2432510d98f7e76fe81d183a0eb96789f4d897ca" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a1382d7377687da344ab290dc6718839031ddd5989cb1e756f7f7d575201ea63" "2997ecd20f07b99259bddba648555335ffb7a7d908d8d3e6660ecbec415f6b95" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "9d91458c4ad7c74cf946bd97ad085c0f6a40c370ac0a1cbeb2e3879f15b40553" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "44eec3c3e6e673c0d41b523a67b64c43b6e38f8879a7969f306604dcf908832c" "10e231624707d46f7b2059cc9280c332f7c7a530ebc17dba7e506df34c5332c4" "47aa6e82734866b2915781c6e1d9517bd897d45fe8aec360dd4b6294fec73068" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" default)))
 '(markdown-command "/usr/local/bin/markdown")
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (irony company-jedi sudoku gnugo symon slack rainbow-delimiters flycheck smart-mode-line-powerline-theme smart-mode-line neotree imenu-list xcode-mode swift3-mode auctex base16-theme lua-mode web-mode zenburn-theme solarized-theme birds-of-paradise-plus-theme fill-column-indicator projectile minimap company-auctex latex-pretty-symbols gruvbox-theme slime-company slime which-key markdown-preview-mode smart-tabs-mode evil-leader xkcd fireplace company parinfer darktooth-theme selectric-mode markdown-mode anti-zenburn-theme magit 2048-game twittering-mode smex ido-vertical-mode olivetti fountain-mode creamsody-theme ## evil-visual-mark-mode)))
 '(safe-local-variable-values (quote ((eval turn-on-orgtbl))))
 '(tool-bar-mode nil))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
