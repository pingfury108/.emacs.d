;;; pfy.el --- pfy  -*- lexical-binding: t; -*-

;;; Code:
(use-package insert-translated-name
  :straight '(insert-translated-name
              :type git
              :host github
              :repo "manateelazycat/insert-translated-name")
  :commands (insert-translated-name-insert))

(use-package gptel
  :straight 'gptel
  :init
  (setq
   gptel-model "gemini-pro"
   gptel-backend (gptel-make-gemini "Gemini"
                   :key gptel-gemini-api-key)))


(defun get-selected-text ()
  (interactive)
  (if (use-region-p)
      (let ((region-text (buffer-substring (mark) (point))))
        (message region-text))
    (message "没有选中任何文本")))

(provide 'init-pfy)
;;; pfy.el ends here
