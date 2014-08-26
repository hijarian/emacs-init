;;;; hij-core --- Hijarian core modules

;;; Commentary:
;;; This is a basic packages which turn Emacs to something usable

;;; Code:

(use-package cl) ; I want Common Lisp stuff available to me in elisp

(use-package evil ; I want modal editing like in Vim
  :ensure evil
  :init
  (progn
    (evil-mode 1)))

(use-package projectile ; I want project navigation and Go to Definition
  :ensure projectile
  :init
  (progn
    (projectile-global-mode)
    (setq projectile-enable-caching t)))

(use-package flycheck ; I want syntax checking
  :ensure flycheck
  :init
  (progn
    (global-flycheck-mode)))

(use-package icicles ; I want autocompletion
  :ensure icicles
  :init
  (progn
    (icy-mode 1)))

(use-package lacarte ; I want access for menu commands from keyboard
  :ensure lacarte
  :bind (([?\e ?\M-x] . lacarte-execute-command)
         ([f10] . lacarte-execute-menu-command)))

(use-package auto-complete ; I want autosuggest for code entities
  :ensure auto-complete
  :init
  (progn
    (use-package auto-complete-config)
    (ac-config-default)))

(use-package magit ; I want Git integration because I use it with everything I write
  :ensure magit)

(provide 'hij-core)
;;; hij-core.el ends here
