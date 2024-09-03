;;; pfy.el --- pfy  -*- lexical-binding: t; -*-

;;; Code:
(use-package insert-translated-name
  :straight '(insert-translated-name
              :type git
              :host github
              :repo "manateelazycat/insert-translated-name")
  :commands (insert-translated-name-insert))

(use-package gptel
  :straight 'gptel)

(provide 'init-pfy)
;;; pfy.el ends here
