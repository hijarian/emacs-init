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

(use-package zenburn-theme
  :ensure zenburn-theme)

;---------------------------------------------------------------------------------------------------
; Call find-file-dialog with C-x M-f
;(defadvice find-file-read-args (around find-file-read-args-always-use-dialog-box act)
;  "Simulate invoking menu item as if by the mouse; see `use-dialog-box'."
;  (let ((last-nonmenu-event nil))
;    ad-do-it))
;(global-set-key (kbd "C-x M-f") 'menu-find-file-existing)

;-----------------------------------------------------------------------
; 4: KILL RING INTEGRATION IN X CLIPBOARD

(transient-mark-mode 1)  ; Now on by default: makes the region act quite like the text "highlight" in many apps.
(setq shift-select-mode t) ; Now on by default: allows shifted cursor-keys to control the region.
(setq mouse-drag-copy-region nil)  ; stops selection with a mouse being immediately injected to the kill ring
(setq x-select-enable-primary nil)  ; stops killing/yanking interacting with primary X11 selection
(setq x-select-enable-clipboard t)  ; makes killing/yanking interact with clipboard X11 selection

;; these will probably be already set to these values, leave them that way if so!
(setf interprogram-cut-function 'x-select-text)
(setf interprogram-paste-function 'x-cut-buffer-or-selection-value)

; You need an emacs with bug #902 fixed for this to work properly. It has now been fixed in CVS HEAD.
; it makes "highlight/middlebutton" style (X11 primary selection based) copy-paste work as expected
; if you're used to other modern apps (that is to say, the mere act of highlighting doesn't
; overwrite the clipboard or alter the kill ring, but you can paste in merely highlighted
; text with the mouse if you want to)
(setq select-active-regions t) ;  active region sets primary X11 selection
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; with this, doing an M-y will also affect the X11 clipboard, making emacs act as a sort of clipboard history, at
;; least of text you've pasted into it in the first place.
(setq yank-pop-change-selection t)  ; makes rotating the kill ring change the X11 clipboard.

;---------------------------------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote (("." . "~/.emacs.d/backups"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (zenburn)))
 '(desktop-globals-to-save (quote ((extended-command-history . 30) (file-name-history . 100) (grep-history . 30) (compile-history . 30) (minibuffer-history . 50) (query-replace-history . 60) (read-expression-history . 60) (regexp-history . 60) (regexp-search-ring . 20) (search-ring . 20) (shell-command-history . 50) tags-file-name register-alist)))
 '(desktop-path (quote ("~/.emacs.d/")))
 '(desktop-save t)
 '(desktop-save-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(line-number-mode t)
 '(recentf-max-menu-items 20)
 '(recentf-mode t)
 '(recentf-save-file "~/.emacs.d/.recentf")
 '(save-place t nil (saveplace))
 '(save-place-file "~/.emacs.d/.emacs-places")
 '(savehist-mode t)
 '(scroll-bar-mode (quote right))
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(visible-bell t))
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))
(provide 'init)
;;; init.el ends here
