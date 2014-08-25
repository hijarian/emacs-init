;;;; hij-package --- Hijarian setup for package system

;;; Commentary:
;;; Setting up package repositories and `use-package` syntax.

;;; Code:
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

(provide 'hij-package)
;;; hij-package ends here