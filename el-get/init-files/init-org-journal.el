;;; org-journal.el --- org for diary
;;; Commentary:
;;; Code:

(defun get-next-sunday ()
  "Get date of next Sunday"
  (format-time-string "%d" (time-add
                            (current-time)
                            (* 86400 (- 7 (string-to-number (format-time-string "%u"))))
                            ))
  )


(defun org-journal-file-header-func (time)
  "Custom function to create journal header."
  (concat "#+TITLE: Weekly Journal\n#+STARTUP: indent hidestars showall")
  )

(setq org-journal-file-header 'org-journal-file-header-func)

; for org-capture
(defun org-journal-find-location ()
  ;; Open today's journal, but specify a non-nil prefix argument in order to
  ;; inhibit inserting the heading; org-capture will insert the heading.
  (org-journal-new-entry t)
  (unless (eq org-journal-file-type 'daily)
    (org-narrow-to-subtree))
  (goto-char (point-max)))

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

(setq org-journal-dir "~/drive/org/diary")
(setq org-journal-file-type 'weekly)
(setq org-journal-file-format (concat "%Y/%m/%d-" (get-next-sunday) ".org"))
(setq org-journal-date-format "%x %A")
(setq org-journal-hide-entries-p nil)



;;; init-org-journal.el ends here
