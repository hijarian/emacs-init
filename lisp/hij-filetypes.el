;;;; hij-filetypes --- Hijarian additions for several other file formats

;;; Commentary:
;;; Stuff like JSON, Markdown, Asciidoc etc

;;; Code:

(use-package adoc-mode
  :ensure adoc-mode
  :mode "\\.adoc\\'")

(use-package markdown-mode
  :ensure markdown-mode
  :mode "\\.md\\'"
  :mode "\\.markdown\\'")

(use-package json-mode
  :ensure json-mode
  :mode "\\.json\\'")

(provide 'hij-filetypes)
;;; hij-filetypes.el ends here
