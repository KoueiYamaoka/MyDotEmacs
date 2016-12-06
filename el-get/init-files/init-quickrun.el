;;; init-quickrun.el --- Emacs Quickrun
;;; Commentary:
;;; Code:
(global-set-key (kbd "C-c c") 'quickrun)
;;; Quickrun with argument
;(global-set-key (kbd "C-c a c") 'quickrun-with-arg)
;; use python3
(quickrun-add-command "python"
		      '((:command . "python3"))
		      :override t)

;;; init-quickrun.el ends here
