;;;; hij-webdev --- Hijarian settings for web development

;;; Commentary:
;;; We install some modes which help in web development.

;;; Code:

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

(provide 'hij-webdev)
;;; hij-webdev.el ends here
