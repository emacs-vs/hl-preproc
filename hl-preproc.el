;;; hl-preproc.el --- Unhighlight invalid preprocessor region  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-07-03 17:07:11

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Unhighlight invalid preprocessor region
;; Keyword: preprocessor
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/jcs090218/hl-preproc

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Unhighlight invalid preprocessor region
;;

;;; Code:

(defgroup hl-preproc nil
  "Unhighlight invalid preprocessor region."
  :prefix "hl-preproc-"
  :group 'tool
  :link '(url-link :tag "Repository" "https://github.com/emacs-vs/hl-preproc"))

(provide 'hl-preproc)
;;; hl-preproc.el ends here
