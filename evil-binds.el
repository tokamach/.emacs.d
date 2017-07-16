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
