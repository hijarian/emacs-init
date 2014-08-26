;;;; hij-interaction --- Hijarian settings for interaction with EMACS

;;; Commentary:
;;; How we indent, how we save and some other tweaks.

;;; Code:

(global-auto-revert-mode 1) ; when file changed, automatically revert buffer

(defalias 'yes-or-no-p 'y-or-n-p) ; `y` instead of `yes` in prompts

(setq
 confirm-nonexistent-file-or-buffer nil ; create buffers for nonexistent files automatically
 indent-tabs-mode nil) ; never use tabs for alignment (when you hit TAB key)

(provide 'hij-interaction)
;;; hij-interaction ends here
