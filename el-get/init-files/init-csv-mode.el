;;; csv-mode.el --- major mode for dealing with csv files
;;; Commentary:
;;; Code:

(progn
  (require 'csv-mode)
  (define-key csv-mode-map (kbd "\C-c\C-f") 'forward-sexp)
  (define-key csv-mode-map (kbd "\C-c\C-b") 'backward-sexp)
  (define-key csv-mode-map (kbd "\C-c\C-k") 'kill-sexp)
  )

;;; init-csv-mode.el ends here
