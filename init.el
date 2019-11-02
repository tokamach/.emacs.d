;; TODO: replace this with org-babel-load-file, which has problems when enabling byte-compilation
(require 'org)
(find-file (concat user-emacs-directory "conf.org"))
(org-babel-tangle)
(load-file (concat user-emacs-directory "conf.el"))
(byte-compile-file (concat user-emacs-directory "conf.el"))
