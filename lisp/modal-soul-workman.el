(require 'hydra)

(defhydra hydra-avy ()
  "avy commands"
  ("w" avy-goto-word-1)
  ("W" avy-goto-word-2)
  ("l" avy-goto-line))

(defhydra hydra-window ()
  "window commands"
  ("-" split-window-below)
  ("/" split-window-right )
  ("y" windmove-left)
  ("n" windmove-down )
  ("e" windmove-up)
  ("o" windmove-right)
  ("w" other-window)
  ("c" delete-window)
  ("b" balance-windows)
  ("f" nil :color blue)
  ("F" toggle-frame-fullscreen)
  ("Y" buf-move-left)
  ("N" buf-move-down)
  ("E" buf-move-up)
  ("O" buf-move-right))

(defhydra hydra-modes (:color blue)
  ("c" company-mode)
  ("r" rainbow-delimiters-mode)
  ("l" lispy-mode)
  ("s" show-paren-mode)
  ("o" olivetti-mode)
  ("i" imenu-smart-list-toggle)
  ("t" treemacs))

(defhydra hydra-cmd (:color blue)
  "command commands"
  ("w" hydra-window/body)
  ("g" magit-status)
  ("f" counsel-find-file)
  ("b" counsel-switch-buffer)
  ("p" hydra-modes/body))

(defun hydra-modal/pre ()
  (setq cursor-type 'hollow))

(defun hydra-modal/post ()
  (setq cursor-type 'box))

(defhydra hydra-modal (:color amaranth :hint none :pre hydra-modal/pre :post hydra-modal/post)
  "movement and editing"
  ;; Right hand: movement commands
  ("y" backward-char)
  ("n" next-line)
  ("e" previous-line)
  ("o" forward-char)

  ("U" beginning-of-line)
  ("p" end-of-line)
  ("u" backward-word)
  ("p" forward-word)

  ("j" scroll-up-command)
  ("k" scroll-down-command)
  ("J" beginning-of-buffer)
  ("K" end-of-buffer)

  ("C-i" nil :color blue)

  ;; Left hand: editing commands
  ("a" counsel-M-x)
  ("s" delete-backward-char)
  ("h" delete-forward-char)
  ("t" nil :color blue)

  ("d" backward-kill-word)
  ("r" kill-word)
  ("g" set-mark-command)

  ("x" kill-region)
  ("m" kill-ring-save)
  ("c" yank)

  ("b" undo-tree-undo)
  ("v" undo-tree-redo)

  ("<SPC>" hydra-cmd/body :color blue))

(global-set-key (kbd "C-i") 'hydra-modal/body)
