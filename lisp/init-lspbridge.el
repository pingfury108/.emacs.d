;; init-lspbridge.el --- Initialize lsp-bridge configurations.	-*- lexical-binding: t -*-

;; Copyright (C) 2018-2022 Vincent Zhang

;; Author: Pingfury <pingfury108@gmail.com>
;; URL: https://github.com/pingfury108/.emacs.d

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
;; Golang configurations.
;;

;;; Code:
(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
                         :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
                         :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  (setq lsp-bridge-python-command "python3")
  :config
  (setq lsp-bridge-enable-hover-diagnostic t))

(provide 'init-lspbridge)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-lspbridge.el ends here
