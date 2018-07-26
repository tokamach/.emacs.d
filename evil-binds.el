;; evil and evil-leader binds
(setq evil-want-C-u-scroll t)
(global-evil-leader-mode)
(require 'evil)
(evil-mode 1)
;(add-to-list 'evil-emacs-state-modes 'waifu-mode) ; stop eviling it up

(require 'evil-magit)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional))

(define-key evil-normal-state-map (kbd ";") 'smex)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)
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
  "wH" 'buf-move-left
  "wJ" 'buf-move-down
  "wK" 'buf-move-up
  "wL" 'buf-move-right
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
  "lp" 'org-toggle-latex-fragment
          ;git
  "gg" 'magit-status
  "gc" 'magit-commit
  "gp" 'magit-push
  "gs" 'magit-stage
          ;minor modes
  "ps" 'show-paren-mode
  "pr" 'rainbow-delimiters-mode
  "po" 'olivetti-mode
  "pc" 'company-mode
  "pf" 'fci-mode
;;  "pw" 'waifu
  "pm" 'minimap-mode
  "pi" 'imenu-list-smart-toggle
  "pn" 'neotree-toggle
  ;; avy
  "ac" 'avy-goto-char
  "aC" 'avy-goto-char-2
  "aw" 'avy-goto-char-timer
  "al" 'avy-goto-line)
