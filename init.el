;;; init.el --- Hijarian's dotfile for Emacs
;;; Commentary:

;;; Code:

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file) ; Separate out the Custom system.

(add-to-list 'load-path "~/.emacs.d/lisp/") ; put other non-ELPA libraries here

(require 'hij-package) ; setup of package system and `use-package` macro

(use-package hij-core) ; Core Emacs enhancements

(use-package hij-visuals) ; Improvements to appearance

(use-package hij-history) ; Enabling history

(use-package hij-interaction) ; Sane interaction with Emacs

(use-package hij-lispdev) ; Additions for Common Lisp development

(use-package hij-webdev) ; Additions for Web development

(use-package hij-filetypes) ; Support for some useful auxiliary file types

(provide 'init)
;;; init.el ends here
