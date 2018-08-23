(require 'hydra)

(defhydra hydra-window ()
  "window commands"
  ("-" split-window-below)
  ("/" split-window-right )
  ("h" windmove-left)
  ("j" windmove-down )
  ("k" windmove-up)
  ("l" windmove-right)
  ("w" other-window)
  ("c" delete-window)
  ("b" balance-windows)
  ("f" toggle-frame-fullscreen)
  ("H" buf-move-left)
  ("J" buf-move-down)
  ("K" buf-move-up)
  ("L" buf-move-right))

(defhydra hydra-modes (:color blue)
  ("c" company-mode)
  ("r" rainbow-delimiters-mode)
  ("l" lispy-mode)
  ("s" show-paren-mode)
  ("o" olivetti-mode)
  ("i" imenu-smart-list-toggle))

(defhydra hydra-cmd (:color blue)
  "command commands"
  ("w" hydra-window/body)
  ("g" magit-status)
  ("f" ido-find-file)
  ("b" ido-switch-buffer)
  ("p" hydra-modes/body))

(defun hydra-modal/pre ()
  (setq cursor-type 'hollow))

(defun hydra-modal/post ()
  (setq cursor-type 'box))

(defhydra hydra-modal (:color amaranth :hint none :pre hydra-modal/pre :post hydra-modal/post)
  "movement and editing"
  ;; Right hand: movement commands
  ("h" backward-char)
  ("j" next-line)
  ("k" previous-line)
  ("l" forward-char)

  ("u" beginning-of-line)
  ("p" end-of-line)
  ("i" backward-word)
  ("o" forward-word)

  ("y" scroll-down-command)
  ("n" scroll-up-command)
  ("Y" beginning-of-buffer)
  ("N" end-of-buffer)

  ("C-;" nil :color blue)

  ;; Left hand: editing commands
  ("a" smex)
  ("s" delete-backward-char)
  ("d" delete-forward-char)
  ("f" nil :color blue)

  ("w" backward-kill-word)
  ("e" kill-word)
  ("r" set-mark-command)

  ("x" kill-region)
  ("c" kill-ring-save)
  ("v" yank)

  ("t" undo-tree-undo)
  ("b" undo-tree-redo)

  ("<SPC>" hydra-cmd/body :color blue))

(global-set-key (kbd "C-;") 'hydra-modal/body)
