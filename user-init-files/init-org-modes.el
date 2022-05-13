;;; init-org-modes.el --- org mode relevant settings
;;; Commentary: this file loaded in init.el via (load)
;;; Code:

;; (eval-after-load 'reftex (test-citation))

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
(setq papers-directory "~/org-test/papers/")
(setq tde-papers (concat papers-directory "tde.org"))

;; org-capture
(defun get-cite-info-by-reftex (&optional no-insert format-key)
  ;; check for recursive edit
  (reftex-check-recursive-edit)

  ;; This function may also be called outside reftex-mode.
  ;; Thus look for the scanning info only if in reftex-mode.

  (when reftex-mode
    (reftex-access-scan-info nil))

  ;; Call do-get-cite-info-by-reftex, but protected
  (unwind-protect
      (do-get-cite-info-by-reftex current-prefix-arg no-insert format-key)
    (reftex-kill-temporary-buffers)))

(defun do-get-cite-info-by-reftex (&optional arg no-insert format-key)
  ;; (let* ((format (reftex-figure-out-cite-format arg no-insert format-key))
  ;;        (docstruct-symbol reftex-docstruct-symbol)
  ;;        (selected-entries (reftex-offer-bib-menu))
  ;;        (insert-entries selected-entries)
  ;;        entry string cite-view)

  (let* ((selected-entries (reftex-offer-bib-menu))
         (insert-entries selected-entries)
         entry string cite-view)

    (unless selected-entries (error "Quit"))

    (if (stringp selected-entries)
        ;; Nonexistent entry
        (setq insert-entries (list (list selected-entries
                                         (cons "&key" selected-entries)))
              selected-entries nil)
      ;; It makes sense to compute the cite-view strings.
      (setq cite-view t))


    (when (eq (car selected-entries) 'concat)
      ;; All keys go into a single command - we need to trick a little
      ;; FIXME: Unfortunately, this means that commenting does not work right.
      (pop selected-entries)
      (let ((concat-keys (mapconcat #'car selected-entries
                                    reftex-cite-key-separator)))
        (setq insert-entries
              (list (list concat-keys (cons "&key" concat-keys))))))

    (let ((entry (pop insert-entries)))

      (setq bib_title (reftex-get-bib-field "title" entry)
            bib_author (reftex-get-bib-field "author" entry)
            bib_year (reftex-get-bib-field "year" entry)
            bib_month (reftex-get-bib-field "month" entry)
            bib_journal (reftex-get-bib-field "journal" entry)
            bib_volume (reftex-get-bib-field "volume" entry)
            bib_number (reftex-get-bib-field "number" entry)
            bib_pages (reftex-get-bib-field "pages" entry)
            bib_key (reftex-get-bib-field "&key" entry))
      ))
  )


(defun test-citation ()
  (interactive)
  (get-cite-info-by-reftex)
  (print (concat "* " bib_title "%?\n"
                 ":PROPERTIES:\n"
                 ":CREATED: %<%Y%m%d>\n"
                 ":Key: " bib_key "\n"
                 ":Title: " bib_title "\n"
                 ":Authors: " bib_author "\n"
                 ":Journal: " bib_journal "\n"
                 ":Year: " bib_year "\n"
                 ":Volume: " bib_volume "\n"
                 ":Number: " bib_number "\n"
                 ":Pages: " bib_pages "\n"
                 ":END:\n\n"
                 "** Abstract\n- \n\n"
                 "** Results\n- "))
  )


(defun paper-with-title-template ()
  (setq title (read-string "Title: "))
  (print (concat "* " title "%?\n"
                 ":PROPERTIES:\n"
                 ":CREATED: %<%Y%m%d>\n"
                 ":Key:\n"
                 ":Title: " title "\n"
                 ":Authors:\n"
                 ":Journal:\n"
                 ":Year:\n"
                 ":Volume:\n"
                 ":Number:\n"
                 ":Pages:\n"
                 ":END:\n\n"
                 "** Abstract\n- \n\n"
                 "** Results\n- "))
  )

(defun paper-with-cite-template ()
  (get-cite-info-by-reftex)
  (print (concat "* " bib_title "%?\n"
                 ":PROPERTIES:\n"
                 ":CREATED: %<%Y%m%d>\n"
                 ":Key: " bib_key "\n"
                 ":Title: " bib_title "\n"
                 ":Authors: " bib_author "\n"
                 ":Journal: " bib_journal "\n"
                 ":Year: " bib_year "\n"
                 ":Volume: " bib_volume "\n"
                 ":Number: " bib_number "\n"
                 ":Pages: " bib_pages "\n"
                 ":END:\n\n"
                 "** Abstract\n- \n\n"
                 "** Results\n- "))
  )



;; org-capture
(define-key global-map (kbd "C-c v") 'org-capture)
(setq org-capture-templates
      '(
        ; notes
        ("n" "📝 Note" entry (file+headline notes-path "Notes")
         "* %?\nEntered on %U\n %i\n %a")
        ; org-journal
        ("j" "📔 Journal entry" plain (function org-journal-find-location)
         "** %?"
         :jump-to-captured t :immediate-finish t :empty-lines-before 1)
        ;; papers
        ("t" "📄 TDE papers (title)" entry (file tde-papers)
         (function paper-with-title-template)
         :jump-to-captured t
         )
        ("T" "📄 TDE papers (cite)" entry (file tde-papers)
         (function paper-with-cite-template)
         :jump-to-captured t
         )
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

;; table
(defun org-table-kill-cell ()
  (interactive)
  (when (org-at-table-p)
    (kill-new
     (string-trim (substring-no-properties
                   (org-table-get-field (org-table-current-column) "")))))
  )
(require 'org)
(define-key org-mode-map (kbd "C-c w") 'org-table-kill-cell)




;;; init-org-modes.el ends here
