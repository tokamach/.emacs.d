;; For annoying autoload reasons we have to do this here instead of in conf.org
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	 "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	 'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'org)

;; Load a compiled file if exists, otherwise tangle and interpret
(let ((compiled-conf (expand-file-name "conf.elc" user-emacs-directory)))
  (if (file-exists-p compiled-conf)
      (load-file compiled-conf)
    (org-babel-load-file (concat user-emacs-directory "conf.org"))))
