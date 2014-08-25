;;;; hij-visuals --- Hijarian settings for EMACS appearance

;;; Commentary:
;;; Customizations of UI, theme and font faces.

;;; Code:
(use-package zenburn-theme
  :ensure zenburn-theme
  :init
  (progn
    (load-theme 'zenburn t)))

(column-number-mode t)
(line-number-mode t)
(scroll-bar-mode 'right)
(tool-bar-mode -1)

(setq
 inhibit-startup-screen t
 initial-scratch-message nil
 visible-bell t)

(set-face-attribute 'default t :family "DejaVu Sans Mono" :foundry "outline" :slant 'normal :weight 'normal :height 113 :width 'normal)

(provide 'hij-visuals)
;;; hij-visuals ends here
