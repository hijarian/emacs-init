;;;; hij-visuals --- Hijarian settings for EMACS appearance

;;; Commentary:
;;; Customizations of UI, theme and font faces.

;;; Code:

(column-number-mode t)
(line-number-mode t)
(scroll-bar-mode 'right)
(tool-bar-mode -1)
(blink-cursor-mode -1)

(show-paren-mode t)
(setq show-paren-delay 0)

(setq
 inhibit-startup-screen t ; No startup screen
 initial-scratch-message nil ; Empty scratch buffer by default
 visible-bell t) ; NO BEEPING MOTHERFUCKER

(setq-default
 tab-width 4) ; tab character is 4 spaces wide, not 8

(set-face-attribute 'default t :family "DejaVu Sans Mono" :foundry "outline" :slant 'normal :weight 'normal :height 113 :width 'normal)

(modify-all-frames-parameters '((fullscreen . maximized))) ; fullscreen by default

(use-package uniquify
  :init
  (progn
    (setq uniquify-buffer-name-style 'forward) ; Unique modificator like directory name is APPENDED
    (setq uniquify-min-dir-content 2)))

(use-package diff-hl-margin-mode ; Changed lines according to `git diff` are highlighted
  :ensure diff-hl
  :init
  (progn
    (add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)))

(global-visual-line-mode 1) ; Wrap words at word boundary

(provide 'hij-visuals)
;;; hij-visuals ends here
