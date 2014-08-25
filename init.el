;;; init.el --- Hijarian's dotfile for Emacs 
;;; Commentary: 

;;; Code:
; Packages
;-----------------------------------------------------------------------------------------------
(require 'package) ; Need this for 'package-archives symbol.
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

; Normally EMACS loads packages from `~/.emacs.d/elpa/` only AFTER processing `init.el`,
; we need to force it to load packages first.
(package-initialize)

; Install package "use-package", which will ENORMOUSLY simplify further config.
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

; Non-ELPA libraries to be loaded from "lisp" subdirectory.
(add-to-list 'load-path "~/.emacs.d/lisp/")

;------------------------------------------------------------------------------------------------

(use-package cl)

(use-package slime-autoloads
  :ensure slime
  :init 
  (progn
    (setq inferior-lisp-program "sbcl") ; Absolute paths will not work on Windows (AFAIK), just put SBCL into $PATH.  
    (setq slime-contribs '(slime-fancy))))

(use-package paredit
  :ensure paredit)
  
(use-package evil
  :ensure evil
  :init 
  (progn
    (evil-mode 1)))

(use-package evil-paredit
      :ensure evil-paredit
      :init
      (progn
        (add-hook 'lisp-mode-hook 'evil-paredit-mode)))
		
(use-package rainbow-delimiters
  :ensure rainbow-delimiters
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))
	
(use-package projectile
  :ensure projectile
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-enable-caching t)))

(use-package redshank
  :ensure redshank) ; FIXME: hotkeys are to be defined! see tutorial video
	
(use-package emr
  :ensure emr
  :commands emr-initialize
  :bind ("M-RET" . emr-show-refactor-menu)
  :init
  (progn
    (emr-initialize)))

(use-package flycheck
  :ensure flycheck
  :init
  (progn
    (global-flycheck-mode)))

(use-package icicles
  :ensure icicles
  :init
  (progn
    (icy-mode 1)))

(use-package lacarte
  :ensure lacarte
  :bind (([?\e ?\M-x] . lacarte-execute-command)
         ([f10] . lacarte-execute-menu-command)))

(use-package auto-complete
  :ensure auto-complete
  :init
  (progn
    (use-package auto-complete-config)
    (ac-config-default)))

(use-package ac-slime
  :ensure ac-slime
  :init
  (progn
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
    (eval-after-load "auto-complete"
      '(add-to-list 'ac-modes 'slime-repl-mode))))

(use-package magit
  :ensure magit)

(use-package skewer-mode
  :ensure skewer-mode
  :init
  (progn
    (skewer-setup)))
	
(use-package js2-mode
  :ensure js2-mode
  :mode "\\.js\\'"
  :init
  (progn
    (add-hook 'js-mode-hook 'js2-minor-mode)))

(use-package js2-refactor
  :ensure js2-refactor)

(use-package web-mode
  :ensure web-mode
  :mode "\\.html?\\'" 
  :mode "\\.soy\\'" 
  :mode "\\.lsp\\'")

(use-package adoc-mode
  :ensure adoc-mode
  :mode "\\.adoc\\'")   

(use-package hij-visuals) ; our own package with style changes

;---------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(desktop-globals-to-save (quote ((extended-command-history . 30) (file-name-history . 100) (grep-history . 30) (compile-history . 30) (minibuffer-history . 50) (query-replace-history . 60) (read-expression-history . 60) (regexp-history . 60) (regexp-search-ring . 20) (search-ring . 20) (shell-command-history . 50) tags-file-name register-alist)))
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(indent-tabs-mode nil)
 '(recentf-max-menu-items 20)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/.emacs-places")
 '(savehist-mode t)
 '(tab-width 4))
 
(provide 'init)
;;; init.el ends here
