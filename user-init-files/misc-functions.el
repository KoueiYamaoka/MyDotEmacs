;;; misc-functions.el --- miscellaneous functions
;;; Commentary: this file loaded in init.el via (load)
;;; Code:

;; https://www.emacswiki.org/emacs/ReplaceCount
(defun another-line (num-lines)
  "Copies line, preserving cursor column, and increments any numbers found.
  Copies a block of optional NUM-LINES lines.  If no optional argument is given,
  then only one line is copied."
  (interactive "p")
  (if (not num-lines) (setq num-lines 0) (setq num-lines (1- num-lines)))
  (let* ((col (current-column))
	 (bol (save-excursion (forward-line (- num-lines)) (beginning-of-line) (point)))
	 (eol (progn (end-of-line) (point)))
	 (line (buffer-substring bol eol)))
    (goto-char bol)
    (while (re-search-forward "[0-9]+" eol 1)
      (let ((num (string-to-number (buffer-substring
				 (match-beginning 0) (match-end 0)))))
	(replace-match (number-to-string (1+ num))))
      (setq eol (save-excursion (goto-char eol) (end-of-line) (point))))
    (goto-char bol)
    (insert line "\n")
    (move-to-column col)))
(define-key global-map (kbd "M-o") 'another-line)

;;; misc-functions.el ends here
