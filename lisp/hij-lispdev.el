;;;; hij-lispdev --- Hijarian helpers for Lisp development

;;; Commentary:
;;; Some modes for easy Lisp development including Slime

;;; Code:

(use-package slime-autoloads ; need to (require 'slime-autoloads) but package is named slime
  :ensure slime
  :init
  (progn
    (setq inferior-lisp-program "sbcl") ; Absolute paths will not work on Windows (AFAIK), just put SBCL into $PATH.
    (setq slime-contribs '(slime-fancy slime-asdf))))

(use-package paredit ; Improvements for sexp interaction
  :ensure paredit)

(use-package evil-paredit ; Integration of Evil into Paredit
  :ensure evil-paredit
  :init
  (progn
    (add-hook 'lisp-mode-hook 'evil-paredit-mode)))

(use-package rainbow-delimiters ; Colorize parentheses depending on depth
  :ensure rainbow-delimiters
  :init
  (progn
    (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)))

(use-package emr ; refactoring support
  :ensure emr
  :commands emr-initialize
  :bind ("M-RET" . emr-show-refactor-menu)
  :init
  (progn
    (emr-initialize)))

(use-package redshank ; Lisp-specific refactorings
  :ensure redshank) ; FIXME: hotkeys are to be defined! see tutorial video

(use-package ac-slime ; Integration of Autocomplete into Slime
  :ensure ac-slime
  :init
  (progn
    (add-hook 'slime-mode-hook 'set-up-slime-ac)
    (add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
    (eval-after-load "auto-complete"
      '(add-to-list 'ac-modes 'slime-repl-mode))))

(provide 'hij-lispdev)
;;; hij-lispdev.el ends here
