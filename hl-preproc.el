;;; hl-preproc.el --- Unhighlight invalid preprocessor region  -*- lexical-binding: t; -*-

;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-07-03 17:07:11

;; Author: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: Unhighlight invalid preprocessor region
;; Keyword: preprocessor
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3") (meta-net "1.0.0"))
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

(require 'cl-lib)
(require 'meta-net)

(defgroup hl-preproc nil
  "Unhighlight invalid preprocessor region."
  :prefix "hl-preproc-"
  :group 'tool
  :link '(url-link :tag "Repository" "https://github.com/emacs-vs/hl-preproc"))

(defcustom hl-preproc-delay 0.4
  "Delay to highlight invalid preprocessor region."
  :type 'float
  :group 'hl-preproc)

(defcustom hl-preproc-priority 150
  "The priority of the overlay used to indicate matches."
  :type 'integer
  :group 'hl-preproc)

(defcustom hl-preproc-extra-constants
  '("true" "TRUE")
  "List of string, extra define constants."
  :type 'list
  :group 'hl-preproc)

(defvar hl-preproc--supported-modes
  '(csharp-mode csharp-tree-sitter-mode)
  "List of current supported major modes.")

(defvar-local hl-preproc--overlays '()
  "List of invalid region overlays.")

(defvar-local hl-preproc--idle-timer nil
  "Delay timer to do unhighlighting.")

(defvar-local hl-preproc--define-constants nil
  "Cache that records all define constants.")

;;
;; (@* "Faces" )
;;

(defface hl-preproc-face
  '((((background light)) :foreground "#808080")
    (t :foreground "#9B9B9B"))
  "The face that overlays the invalid preprocessor area."
  :group 'hl-preproc)

;;
;; (@* "Constants" )
;;

(defun hl-preproc--get-constants ()
  "Return a list of constants from current project."
  (let (lst)
    (dolist (path (meta-net-csporj-files))
      (dolist (constants (meta-net-define-constants path))
        (setq lst (append lst path))))
    lst))

(defun hl-preproc-all-constants (&optional refresh)
  "Return all define constants.

If REFRESH is non-nil, refresh cache once."
  (when (or refresh (null hl-preproc--define-constants))
    (setq hl-preproc--define-constants
          (append hl-preproc-extra-constants (hl-preproc--get-constants)))
    (cl-delete-duplicates hl-preproc--define-constants))
  hl-preproc--define-constants)

;;
;; (@* "Core" )
;;

(defun hl-preproc--overlay (beg end)
  "Place invalid overlay from BEG to END."
  (let ((ov (make-overlay beg end)))
    (overlay-put ov 'face 'hl-preproc-face)
    (overlay-put ov 'priority hl-preproc-priority)
    (push ov hl-preproc--overlays)))

(defun hl-preproc--do-highlight (buffer)
  "Highlight BUFFER with overlays."
  (unless meta-net-csproj-current (meta-net-read-project))  ; read define constants
  (mapc #'delete-overlay hl-preproc--overlays)
  (with-current-buffer buffer
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward "#[ \t]*if" nil t)
        )
      )))

(defun hl-preproc--after-cahnge (&rest _)
  "Unhighlight after change."
  (when (timerp hl-preproc--idle-timer) (cancel-timer hl-preproc--idle-timer))
  (setq hl-preproc--idle-timer
        (run-with-idle-timer hl-preproc-delay nil
                             #'hl-preproc--do-highlight (current-buffer))))

(defun hl-preproc--enable ()
  "Start `hl-preproc-mode'."
  (if (memq major-mode hl-preproc--supported-modes)
      (progn
        (hl-preproc--do-highlight)  ; highlight once kimmediately after activation
        (add-hook 'after-change-functions #'hl-preproc--after-cahnge nil t))
    (hl-preproc-mode -1)))

(defun hl-preproc--disable ()
  "Stop `hl-preproc-mode'."
  (remove-hook 'after-change-functions #'hl-preproc--after-cahnge t))

;;;###autoload
(define-minor-mode hl-preproc-mode
  "Minor mode 'hl-preproc-mode'."
  :lighter " HL-PREPROC"
  :group hl-preproc
  (if hl-preproc-mode (hl-preproc--enable) (hl-preproc--disable)))

(provide 'hl-preproc)
;;; hl-preproc.el ends here
