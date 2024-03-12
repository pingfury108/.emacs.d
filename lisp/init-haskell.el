;; init-haskell.el --- Initialize Haskell configurations.	-*- lexical-binding: t -*-

;;; Code:

(use-package lsp-mode)

(use-package lsp-haskell
  :init
  (add-hook 'haskell-mode-hook #'lsp)
  (add-hook 'haskell-literate-mode-hook #'lsp))

(provide 'init-haskell)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-haskell.el ends here
