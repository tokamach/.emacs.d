(require 'hydra)

(defhydra hydra-window ()
  "Hydra for window commands"
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

(defhydra hydra-cmd (:color blue)
  "Command commands"
  ("w" hydra-window/body)
  ("g" magit-status)
  ("f" ido-find-file)
  ("p" (defhydra hydra-modes ()
	 ("c" company-mode)
	 ("r" rainbow-delimiters-mode)
	 ("l" lispy-mode))
   :color blue))

(defhydra hydra-modal (global-map
		       "C-;"
		       :color amaranth)
  "hydra for movement and editing"
  ;; Right hand: movement commands
  ("h" backward-char)
  ("j" next-line)
  ("k" previous-line)
  ("l" forward-char)

  ("i" backward-word)
  ("o" forward-word)

  ("y" scroll-up-command)
  ("n" scroll-down-command)
  ("Y" beginning-of-buffer)
  ("N" end-of-buffer)

  ("u" undo) ;;TODO: better undo location

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

  ("<SPC>" hydra-cmd/body :color blue))

;; (global-set-key (kbd "C-;") 'hydra-modal/body)
