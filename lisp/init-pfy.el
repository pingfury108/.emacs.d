;;; pfy.el --- pfy  -*- lexical-binding: t; -*-

;;; Code:
(use-package insert-translated-name
  :straight '(insert-translated-name
              :type git
              :host github
              :repo "manateelazycat/insert-translated-name")
  :commands (insert-translated-name-insert))

(use-package gptel
  :straight '(gptel
              :type git
              :host github
              :repo "karthink/gptel")
  :init
  ;; OPTIONAL configuration
  (setq gptel-model   'deepseek-reasoner
        gptel-backend (gptel-make-deepseek "DeepSeek"
                                           :stream t
                                           :key gptel-deepseek-api-key))
  )

(defun get-selected-text ()
  (interactive)
  (if (use-region-p)
      (let ((region-text (buffer-substring (mark) (point))))
        (message region-text))
    (message "没有选中任何文本")))

(provide 'init-pfy)
;;; pfy.el ends here
