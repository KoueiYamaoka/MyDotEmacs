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


;;; init-org-journal.el ends here
