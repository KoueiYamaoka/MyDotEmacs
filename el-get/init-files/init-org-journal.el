;;; org-journal.el --- org for diary
;;; Commentary:
;;; Code:

(setq org-journal-dir "~/Dropbox/share/org/diary")
(setq org-journal-file-format "%Y/%m/%d.org")
(setq org-journal-date-format "%x %A")

; for org-capture
(defun org-journal-find-location ()
  (org-journal-new-entry t)
  (goto-char (point-min)))

(defun org-journal-save-entry-and-exit()
  "Simple convenience function.
  Saves the buffer of the current day's entry and kills the window
  Similar to org-capture like behavior
  At org-journal github page, (By @dhruvparamhans)"
  (interactive)
  (save-buffer)
  (kill-buffer-and-window))

(with-eval-after-load 'org-journal
  (define-key org-journal-mode-map (kbd "C-c C-c") 'org-journal-save-entry-and-exit)
  )


;;; init-org-journal.el ends here
