(require 'entry-plug)
;; (global-entry-plug-mode)
(global-set-key (kbd "C-;") 'entry-plug-mode)

(entry-plug/set-leader-key "<SPC>")
(entry-plug/set-root-keymap
 ;; Regular movement
 "h" 'backward-char
 "j" 'next-line
 "k" 'previous-line
 "l" 'forward-char

 "i" 'entry-plug-mode ;exit entry plug (go to insert mode)

 ;; commands
 ";" 'smex)

(entry-plug/set-leader-keymap
 ;; window commands
 "w-" 'split-window-below
 "w/" 'split-window-right
 "wh" 'windmove-left
 "wj" 'windmove-down
 "wk" 'windmove-up
 "wl" 'windmove-right
 "ww" 'other-window
 "wc" 'delete-window
 "wb" 'balance-windows
 "wf" 'toggle-frame-fullscreen
 "wH" 'buf-move-left
 "wJ" 'buf-move-down
 "wK" 'buf-move-up
 "wL" 'buf-move-right
 ;; buffers
 "bb" 'switch-to-buffer
 "bk" 'kill-buffer
 ;; eval
 "eb" 'eval-buffer
 "er" 'eval-expression
 "ev" 'eval-region
 ;; latex
; "lp" 'org-toggle-latex-fragment
 ;; git
 "gg" 'magit-status
 "gc" 'magit-commit
 "gp" 'magit-push
 "gs" 'magit-stage
 ;; minor modes
 "ps" 'show-paren-mode
 "pr" 'rainbow-delimiters-mode
 "po" 'olivetti-mode
 "pc" 'company-mode
 "pf" 'fci-mode
 "pw" 'waifu
 "pi" 'imenu-list-smart-toggle
 "pn" 'neotree-toggle
 ;; avy
 "ac" 'avy-goto-char
 "aC" 'avy-goto-char-2
 "aw" 'avy-goto-char-timer
 "al" 'avy-goto-line)

