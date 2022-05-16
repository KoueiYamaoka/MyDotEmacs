;;; init-org-modes.el --- org mode relevant settings
;;; Commentary: this file loaded in init.el via (load)
;;; Code:

(require 'org)
(require 'reftex)
(require 'reftex-cite)
(require 'ox-latex)
(add-hook 'org-mode-hook 'reftex-mode)

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
(setq system-time-locale "C")
(define-key org-mode-map (kbd "C-c s") 'org-show-subtree)

;; file paths
(setq notes-path (concat org-directory "notes.org"))
(setq papers-directory "~/Documents/org/papers/")
(setq tde-papers (concat papers-directory "tde.org"))

;; reftex
(setq reftex-default-bibliography '("/home/kouei/latex/bib/articles"
                                    "/home/kouei/latex/bib/publications"
                                    "/home/kouei/latex/bib/read_papers"))

(defun get-cite-info-by-reftex ()

  ;; copied from do-reftex-citation from reftex-cite.el
  ;; *from here to
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
    ;; *here

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


;; org-capture templates
(setq paper-reading-format (concat "- [[pdf:][PDF]]\n\n"
                                   "** Abstract\n- %?\n\n"
                                   "** Difference\n- \n\n"
                                   "** Core\n- \n\n"
                                   "** Results\n- \n\n"
                                   "** Discussion\n- \n\n"
                                   "** Next [/]\n*** TODO \n")
      )

(defun paper-with-title-template ()
  (setq bib_title (read-string "Title: "))
  (print (concat "\n\n* " bib_title "\n"
                 ":PROPERTIES:\n"
                 ":CREATED: %<%Y-%m-%d>\n"
                 ":Key:\n"
                 ":Title: " bib_title "\n"
                 ":Authors:\n"
                 ":Journal:\n"
                 ":Year:\n"
                 ":Volume:\n"
                 ":Number:\n"
                 ":Pages:\n"
                 ":END:\n\n"
                 paper-reading-format))
  )

(defun paper-with-cite-template ()
  (get-cite-info-by-reftex)
  (reftex-kill-temporary-buffers)
  (print (concat "\n\n* " bib_title "\n"
                 ":PROPERTIES:\n"
                 ":CREATED: %<%Y-%m-%d>\n"
                 ":Key: " bib_key "\n"
                 ":Title: " bib_title "\n"
                 ":Authors: " bib_author "\n"
                 ":Journal: " bib_journal "\n"
                 ":Year: " bib_year "\n"
                 ":Volume: " bib_volume "\n"
                 ":Number: " bib_number "\n"
                 ":Pages: " bib_pages "\n"
                 ":END:\n\n"
                 paper-reading-format))
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
         :jump-to-captured t :immediate-finish t :empty-lines-before 2)
        ;; papers
        ("T" "📄 TDE papers (title)" entry (file tde-papers)
         (function paper-with-title-template)
         :jump-to-captured t :immediate-finish t :empty-lines-before 2
         )
        ("t" "📄 TDE papers (cite)" entry (file tde-papers)
         (function paper-with-cite-template)
         :jump-to-captured t :immediate-finish t :empty-lines-before 2
         )
        ))

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

;; latex
;; \\setmainfont{IPAexMincho}
;; \\setsansfont{IPAexGothic}
;; \\setmainjfont[BoldFont=IPAexGothic]{IPAexMincho}
;; \\setsansjfont{IPAexGothic}
;; \\newjfontfamily\\jisninety[CJKShape=JIS1990]{IPAexMincho}
(setq org-latex-pdf-process
      '("lualatex --draftmode %f"
        "lualatex %f"))
(add-to-list 'org-latex-classes
             '("paper"
               "
\\documentclass[10pt,a4paper,oneside]{ltjsarticle}
\\usepackage{luatexja-fontspec}
[NO-DEFAULT-PACKAGES]
\\usepackage{graphicx}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{bm}
\\usepackage{siunitx}
\\usepackage{booktabs}
\\usepackage{multirow}
\\usepackage{longtable}
\\usepackage[unicode,hidelinks]{hyperref}
"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-default-class "paper")

;; table
(defun org-table-kill-cell ()
  (interactive)
  (when (org-at-table-p)
    (kill-new
     (string-trim (substring-no-properties
                   (org-table-get-field (org-table-current-column) "")))))
  )
(define-key org-mode-map (kbd "C-c w") 'org-table-kill-cell)

;;; init-org-modes.el ends here
