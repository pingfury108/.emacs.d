;; init-python.el --- Initialize python configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2010-2022 Vincent Zhang

;; Author: Vincent Zhang <seagle0128@gmail.com>
;; URL: https://github.com/seagle0128/.emacs.d

;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.
;;

;;; Commentary:
;;
;; Python configurations.
;;

;;; Code:

;; Python Mode
;; Install: pip install pyflakes autopep8
(use-package python
  :ensure nil
  :hook
  (inferior-python-mode . (lambda ()
                            (process-query-on-exit-flag
                             (get-process "Python3"))))
  ;;(python-ts-mode . (lambda ()
  ;;                    (setq tab-width 4)
  ;;                    (setq standard-indent 4)))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  :config
  ;; Default to Python 3. Prefer the versioned Python binaries since some
  ;; systems stupidly make the unversioned one point at Python 2.
  (when (and (executable-find "python3")
             (string= python-shell-interpreter "python"))
    (setq python-shell-interpreter "python3"))

  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))


  ;; Live Coding in Python
  (use-package live-py-mode))

;; Python
(use-package lsp-pyright
  :ensure t
  :after lsp-mode
  :preface
  (defun ruff-format-buffer ()
    (interactive)
    (when (and (executable-find "ruff") buffer-file-name)
      (call-process "ruff" nil nil nil "format" "--quiet" buffer-file-name)))

  :hook (((python-mode python-ts-mode) . (lambda ()
                                           (require 'lsp-pyright)
                                           (add-hook 'after-save-hook #'ruff-format-buffer t t)
                                           )))
  :init (when (executable-find "python3")
          (setq lsp-pyright-python-executable-cmd "python3"))
  :config
  (setq lsp-pyright-typechecking-mode "basic"
        lsp-pyright-auto-import-completions t
        lsp-pyright-auto-search-paths t
        lsp-pyright-use-library-code-for-types t
        lsp-pyright-diagnostic-mode "workspace")
  )





;; (add-hook 'python-mode-hook 'eglot-ensure)
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '(python-mode . ("ruff" "server")))
;;   (add-hook 'after-save-hook 'eglot-format))

(provide 'init-python)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-python.el ends here
