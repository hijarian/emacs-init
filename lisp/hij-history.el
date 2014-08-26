;;;; hij-history --- Hijarian setup for Emacs history

;;; Commentary:
;;; It's a lot more convenient to have recent files enabled and Emacs starting with files opened previously.

;;; Code:

(setq
 backup-directory-alist '(("." . "~/.emacs.d/backups"))
 desktop-globals-to-save (quote ((extended-command-history . 30) (file-name-history . 100) (grep-history . 30) (compile-history . 30) (minibuffer-history . 50) (query-replace-history . 60) (read-expression-history . 60) (regexp-history . 60) (regexp-search-ring . 20) (search-ring . 20) (shell-command-history . 50) tags-file-name register-alist))
 desktop-save t
 recentf-max-menu-items 20
 desktop-path '("~/.emacs.d/")
 recentf-save-file "~/.emacs.d/.recentf")

(recentf-mode)
(desktop-save-mode)
(savehist-mode)

(use-package saveplace
  :init
  (progn
    (setq-default save-place t)))

(provide 'hij-history)
;;; hij-history ends here
