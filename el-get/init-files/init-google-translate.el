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

;; fix error of "Failed to search TKK"
(defun google-translate--get-b-d1 ()
  (list 427110 1469889687))

;;; init-google-translate.el ends here
