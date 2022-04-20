;;; init-org-modes.el --- org mode relevant settings
;;; Commentary: this file loaded in init.el via (load)
;;; Code:

;; general settings
(setq org-directory "~/drive/org/")
(setq org-default-notes-file "notes.org")
(setq org-indent-indentation-per-level 4)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-startup-folded 'showall)
(setq org-log-done 'time)
(setq org-enforce-todo-dependencies t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

;; file paths
(setq notes-path (concat org-directory "notes.org"))

;; org-capture
(define-key global-map (kbd "C-c v") 'org-capture)
(setq org-capture-templates
      '(
        ; notes
        ("n" "Note" entry (file+headline notes-path "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ; org-journal
        ("j" "Journal entry" plain (function org-journal-find-location)
         "** %^{Title}\n%i\n%?"
         :jump-to-captured t :immediate-finish t :empty-lines-before 1)
        )
      )
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat org-directory file))))
(global-set-key (kbd "C-M-o") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))
;; org-refine
(setq org-agenda-files org-directory)
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))


;;; init-org-modes.el ends here
