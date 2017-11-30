(require 'entry-plug)
(global-entry-plug-mode)
(global-set-key (kbd "C-;") 'entry-plug-mode)

(entry-plug/set-leader-key "<SPC>")
(entry-plug/set-root-keymap
 '(;; Regular movement
   ("h" backward-char)
   ("j" next-line)
   ("k" previous-line)
   ("l" forward-char)

   ;;commands
   (";" smex)))

(entry-plug/set-leader-keymap
 '(
   ;;window commands
   ("w-" split-window-below)
   ("w/" split-window-right)
   ("wh" windmove-left)
   ("wj" windmove-down)
   ("wk" windmove-up)
   ("wl" windmove-right)
   ("ww" other-window)
   ("wc" delete-window)
   ("wb" balance-windows)
   ("wf" toggle-frame-fullscreen)
   ("wH" buf-move-left)
   ("wJ" buf-move-down)
   ("wK" buf-move-up)
   ("wL" buf-move-right)
   ;;buffers
   ("bb" 'switch-to-buffer)
   ("bk" 'kill-buffer)
   ;;eval
   ("eb" 'eval-buffer)
   ("er" 'eval-expression)
   ("ev" 'eval-region)
   ;;latex
   ("lp" 'preview-buffer)
   ("lc" 'preview-clearout-buffer)
   ("lo" 'org-toggle-latex-fragment)
   ;;git
   ("gg" 'magit-status)
   ("gc" 'magit-commit)
   ("gp" 'magit-push)
   ("gs" 'magit-stage)
   ;;minor modes
   ("pp" 'parinfer-mode)
   ("pt" 'parinfer-toggle-mode)
   ("ps" 'show-paren-mode)
   ("po" 'olivetti-mode)
   ("pc" 'company-mode)
   ("pf" 'fci-mode)
   ("pw" 'waifu)
   ("pm" 'minimap-mode)
   ("pi" 'imenu-list-smart-toggle)
   ("pn" 'neotree-toggle)))

