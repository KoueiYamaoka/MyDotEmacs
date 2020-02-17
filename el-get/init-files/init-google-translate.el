;;; google-translate.el -- google translate
;;; commentary:
;;; Code:

(require 'google-translate-default-ui)

;; auto set source lang and target lang
(defun google-translate-enja-or-jaen (&optional string)
  (interactive)
  (setq string
	(cond ((stringp string) string)
	      (current-prefix-arg
	       (read-string "Google Translate: "))
	      ((use-region-p)
	       (buffer-substring (region-beginning) (region-end)))
	      (t
	       (thing-at-point 'word))))
  (let* ((asciip (string-match
		  "[a-zA-Z]"
		  string)))
    (run-at-time 0.1 nil 'deactivate-mark)
    (google-translate-translate
     (if asciip "en" "ja")
     (if asciip "ja" "en")
     string)))

(global-set-key "\C-xt" 'google-translate-enja-or-jaen)
(global-set-key "\C-x\C-t" 'google-translate-query-translate)

;; to avoid args-out-of-range [] 1
(defun google-translate-json-suggestion (json)
  (let ((info (aref json 7)))
    (if (and info (> (length info) 0))
	(aref info 1)
      nil))
  )

;;; init-google-translate.el ends here
