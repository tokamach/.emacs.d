;; -*- outline-minor-mode: t -*-

;;* Config Mode
;; Switch between home/server/mobile/work modes
(setq tk/env 'home)

(setq custom-file (concat user-emacs-directory  "custom.el"))
(load custom-file)
(add-to-list 'load-path (concat user-emacs-directory "lisp/"))

;; TODO: perhaps no root 'packages' heading, and just one per item?
;;* Packages
;;** straight.el
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

;;** use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;;* Editor
;;** Appearance
(when (display-graphic-p)
  (set-frame-font "Iosevka Term Slab 13" nil t)
  (use-package tao-theme
    :init
    (load-theme 'tao-yang)
    (setq tao-theme-use-sepia t)
    (setq tao-theme-use-boxes t)))

(blink-cursor-mode 0)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq initial-scratch-message "")
(tool-bar-mode 0)
(menu-bar-mode 0)
(when (display-graphic-p)
  (scroll-bar-mode 0)
  (fringe-mode '(1 . 1)))
(setq frame-title-format "emacs: %b")

;;*** Dashboard
    (use-package dashboard
      :init
      (when (display-graphic-p)
	(let ((random-choice (lambda (elems)
                               (let* ((size (length elems))
                                      (index (random size)))
				 (nth index elems))))
	      ;; TODO: if (= tk/env 'home) use some other pics too (~/Pictures/animu maybe?)
              (imgs (append (file-expand-wildcards (concat user-emacs-directory "dashboard-images/*.png"))
                            (file-expand-wildcards (concat user-emacs-directory "dashboard-images/*.jpg"))
                            (file-expand-wildcards (concat user-emacs-directory "dashboard-images/*.svg"))))
              (quotes `("You're slacking off instead of writing Lisp? Pretty cringe bro."
			"What Would McCarthy Do?"
			"Have you read your SICP today?"
			"Don't think! Feel!"
			"THINK!"
			,(if (eq tk/env 'home)
                             "Do it for her."
			   "Remember, it's all in your head."))))
	  (setq dashboard-startup-banner (funcall random-choice imgs))
	  (setq dashboard-banner-logo-title (funcall random-choice quotes)))
	(setq dashboard-image-banner-max-height 400)
	(setq dashboard-image-banner-max-width 400))
      (setq dashboard-center-content t)
      (setq dashboard-items '((recents . 5)
                              (projects . 5)))
      (setq dashboard-set-footer nil)

      (dashboard-setup-startup-hook)
      (setq inital-buffer-choice (lambda () (get-buffer "*dashboard*"))))

;;** Functionality
(use-package smooth-scrolling
  :init (smooth-scrolling-mode 1))

(use-package minions
  :config
  (setq minions-mode-line-lighter "≡")
  (minions-mode 1))

(use-package which-key
  :init (which-key-mode))

;;** Completion
;; Vertico: vertical completion prompt
(use-package vertico
  :init (vertico-mode))

(when (display-graphic-p)
  (use-package vertico-posframe
    :init (vertico-posframe-mode)))

;; Orderless: better completion
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Marginalia: rich completion annotations
  (use-package marginalia
    :bind (:map minibuffer-local-map
           ("M-A" . marginalia-cycle))
    :init (marginalia-mode))

;; Consult: swiper style searching
(use-package consult
  :bind (;; C-c bindings (mode-specific-map)
         ("C-c h" . consult-history)
         ("C-c m" . consult-mode-command)
         ("C-c b" . consult-bookmark)
         ("C-c k" . consult-kmacro)
         ;; C-x bindings (ctl-x-map)
         ("C-x M-:" . consult-complex-command) ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer) ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame) ;; orig. switch-to-buffer-other-frame
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store) ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)	;; orig. yank-pop
         ("<help> a" . consult-apropos)	;; orig. apropos-command
         ;; M-g bindings (goto-map)
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake) ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)	 ;; orig. goto-line
         ("M-g M-g" . consult-goto-line) ;; orig. goto-line
         ("M-g o" . consult-outline) ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings (search-map)
         ("M-s f" . consult-find)
         ("M-s F" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s m" . consult-multi-occur)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch)
         :map isearch-mode-map
         ("M-e" . consult-isearch)   ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch) ;; orig. isearch-edit-string
         ("M-s l" . consult-line) ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)))
    
;;** Keybindings
;; Have to load these packages before modal-soul.el
(use-package hydra)
(use-package avy)
(use-package buffer-move)
(load "~/.emacs.d/lisp/modal-soul.el")

;; Emacs Mac App bindings
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)

;;** Backups
(setq
   backup-by-copying t ;; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs.d/backups/")) ;; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t) ;; use versioned backups

;;* Tools
;; Non-editing emacs tools
(use-package magit)
(use-package projectile)
(when (display-graphic-p)
  (use-package pdf-tools
    :init
    (pdf-loader-install)
    (add-hook 'pdf-view-mode-hook (lambda () (linum-mode -1)))))

(use-package vterm)

;;* Org
(setq org-log-into-drawer "LOGBOOK"
      org-src-window-setup 'current-window
      org-hide-emphasis-markers t
      org-startup-indented t)

(when (display-graphic-p)
  (use-package org-superstar
    :config (org-superstar-configure-like-org-bullets)
    :hook (org-mode . org-superstar-mode))

  (use-package org-fragtog
    :config
    (setq org-preview-latex-default-process 'dvisvgm) ;; For HD latex
    (setq org-format-latex-options '(:scale 0.8))
    :hook (org-mode-hook . org-fragtog-mode))

  (use-package org-variable-pitch
    :config (org-variable-pitch-setup)
    :hook (org-mode . org-variable-pitch-minor-mode)))

;;** Notes
(setq tk/org-directory "~/doc/org/"
      tk/org-wiki-directory "~/doc/org/wiki/"
      tk/org-blog-directory "~/doc/blog/"
      tk/org-file-list `(,@(file-expand-wildcards (concat tk/org-directory "*.org"))))

(setq org-todo-keywords '((sequence "TODO" "WAIT" "DOING" "|" "DONE" ))
      org-default-notes-file (concat tk/org-directory "inbox.org")
      org-refile-targets (mapcar (lambda (e) `(,e . (:maxlevel . 2)))
				 tk/org-file-list)
      org-refile-use-outline-path 'file)

(use-package org-pomodoro)
(use-package org-roam
      :after org
      ;; :straight (:host github :repo "org-roam/org-roam")
      :config
      (setq org-roam-directory (file-truename tk/org-wiki-directory))
      (setq org-roam-file-extensions '("org"))
      (org-roam-setup)
      :bind
      ("C-c n /" . org-roam-node-find)      
      ("C-c n c" . org-roam-capture)
      ("C-c n i" . org-roam-node-insert))

(use-package org-download
  :after org
  :bind
  (:map org-mode-map
        (("s-Y" . org-download-screenshot)
         ("s-y" . org-download-yank))))

;;** Agenda
(setq org-agenda-block-separator ?-
      org-agenda-restore-windows-after-quit 1
      org-agenda-files tk/org-file-list
      org-id-extra-files `(,@(file-expand-wildcards (concat tk/org-wiki-directory "*.org")))
      org-agenda-custom-commands
      `(("a" "Agenda"
	 ;; The Week
	 ((agenda ""
		  ((org-agenda-span 'week)
		   (org-agenda-overriding-header "This Week")
		   (org-deadline-warning-days 5)))
	  ;; Inbox
	  (todo "TODO"
		((org-agenda-overriding-header "Inbox")
		 (org-agenda-files `(,(concat tk/org-directory "inbox.org")))))
	  ;; Doing
	  (todo "DOING"
		((org-agenda-overriding-header "In Progress")
	         (org-agenda-files `(,@(file-expand-wildcards (concat tk/org-directory "*.org"))))))
	  ;; Tasks to do
	  (todo "TODO"
		((org-agenda-overriding-header "Tasks")
		 (org-agenda-files `(,(concat tk/org-directory "todo.org")))
		 (org-agenda-skip-function '(org-agenda-skip-entry-if 'deadline 'scheduled))))
	  ;; Waiting
	  (todo "WAIT"
		((org-agenda-overriding-header "Waiting On")
	         (org-agenda-files `(,@(file-expand-wildcards (concat tk/org-directory "*.org")))))))))
      
      org-clock-idle-timer 15

      org-capture-templates
      `(("i" "inbox" entry (file ,(concat tk/org-directory "inbox.org")) "* TODO %?")
	("t" "todo"  entry (file ,(concat tk/org-directory "todo.org"))  "* TODO %?")
	("b" "blog"  entry (file ,(concat tk/org-blog-directory
					  (format-time-string "%y-%m-%d.org"))) "* %?" )))

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;** Publishing
(when (eq tk/env 'home)
  (setq org-html-postamble nil)
  (setq tk/site-publish-base-dir "/ssh:comftail:/usr/local/www/")
  (setq org-publish-project-alist
        `(("comf.moe-root"
           :base-directory "~/doc/sites/comf.moe/"
           :base-extension "org"
           :section-numbers nil
           :table-of-contents nil
           :publishing-function org-html-publish-to-html
           :publishing-directory ,(concat tk/site-publish-base-dir "comf.moe"))
  
          ("comf.moe-static"
           :base-directory "~/doc/sites/comf.moe"
           :base-extension "css\\|html\\|js\\|jpg\\|png\\|gif"
	   :exclude "images" ;; We manually move using rsync
           :recursive t
           :publishing-function org-publish-attachment
           :publishing-directory ,(concat tk/site-publish-base-dir "comf.moe"))
  
          ("comf.moe-blog"
           :base-directory "~/doc/blog/"
           :base-extension "org"
	   :recursive t
           :auto-index t
           :auto-index "index"
	   :sitemap-sort-files anti-chronologically
	   :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/modern.css\" />"
           :publishing-function org-html-publish-to-html
           :publishing-directory ,(concat tk/site-publish-base-dir "comf.moe/" "blog/"))
	  
	  ("comf.moe-wiki"
	   :base-directory "~/doc/org/wiki/"
	   :base-extension "org"
	   :auto-sitemap t
	   :sitemap-filename "index"
	   :sitemap-title "Index"
	   :sitemap-sort-files anti-chronologically
	   :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/modern.css\" />"
	   :publishing-function org-html-publish-to-html
	   :publishing-directory ,(concat tk/site-publish-base-dir "comf.moe/wiki/"))
  
          ("comf.moe" :components ("comf.moe-root" "comf.moe-static" "comf.moe-blog"))

	  ("tokama.ch-root"
	   :base-directory "~/doc/sites/tokama.ch/"
           :base-extension "org"
           :section-numbers nil
           :table-of-contents nil
           :publishing-function org-html-publish-to-html
           :publishing-directory ,(concat tk/site-publish-base-dir "tokama.ch"))  
          ("tokama.ch-static"
           :base-directory "~/doc/sites/tokama.ch"
           :base-extension "css\\|html\\|js\\|jpg\\|png\\|gif"
           :recursive t
           :publishing-function org-publish-attachment
           :publishing-directory ,(concat tk/site-publish-base-dir "tokama.ch"))

	  ("tokama.ch" :components ("tokama.ch-root")))))

;;* Languages
(use-package company)
(use-package eglot)

;;** C/C++
(setq c-default-style "linux"
      c-basic-offset 4)

;;** Lisp
(defun tk/lisp-hook ()
  (company-mode))

(use-package lispy
  :hook (tk/lisp . lispy-mode))e

(use-package rainbow-delimiters
  :hook (tk/lisp . rainbow-delimiters-mode))

(add-hook 'emacs-lisp-mode-hook  #'tk/lisp-hook)
(add-hook 'common-lisp-mode-hook #'tk/lisp-hook)
(add-hook 'scheme-mode-hook      #'tk/lisp-hook)
(add-hook 'lisp-mode-hook        #'tk/lisp-hook)

(use-package geiser)
(use-package geiser-guile)
(use-package sly)
  
;;** LaTeX
;;(use-package auctex)
;;(use-package latex-pretty-symbols)

(use-package exec-path-from-shell)
(exec-path-from-shell-initialize)

;;(setq TeX-parse-self t) ; Enable parse on load.
;;(setq TeX-auto-save t) ; Enable parse on save.
