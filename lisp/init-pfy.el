;;; pfy.el --- pfy  -*- lexical-binding: t; -*-

;;; Code:
(use-package insert-translated-nme
  :straight '(insert-translated-nme
              :type git
              :host github
              :repo "manateelazycat/insert-translated-name")
  :commands (insert-translated-name-insert))

(provide 'init-pfy)
;;; pfy.el ends here
