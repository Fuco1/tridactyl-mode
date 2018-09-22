;;; tridactyl-mode.el --- Major mode for tridactyl configuration file -*- lexical-binding: t -*-

;; Copyright (C) 2018 Matúš Goljer

;; Author: Matúš Goljer <matus.goljer@gmail.com>
;; Maintainer: Matúš Goljer <matus.goljer@gmail.com>
;; Version: 0.0.1
;; Created: 22nd September 2018
;; Package-requires: ((dash "2.14.0"))
;; Keywords: languages

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Major mode for editing tridactyl configuration, an extension for
;; Firefox web browser.  See https://github.com/tridactyl/tridactyl

;;; Code:

(require 'conf-mode)

(defconst tridactyl-syntax-propertize-function
  (syntax-propertize-rules
   ("^\\\"" (0 "<"))))

;;;###autoload
(define-derived-mode tridactyl-mode conf-space-mode "Tridactyl"
  "Major mode for editing tridactylrc file."
  (conf-mode-initialize "\"")
  (modify-syntax-entry ?\; ".")
  (set (make-local-variable 'conf-space-keywords)
       (rx (or
            "autocmd"
            "bind"
            "js"
            "jsb"
            "quickmark"
            "set"
            "unbind"
            )))
  (set (make-local-variable 'parse-sexp-lookup-properties) t)
  (set (make-local-variable 'syntax-propertize-function)
       tridactyl-syntax-propertize-function))

;;;###autoload
(add-to-list 'auto-mode-alist '("tridactylrc\\'" . tridactyl-mode))

(provide 'tridactyl-mode)
;;; tridactyl-mode.el ends here
