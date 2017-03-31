;;; init-python-mode.el --- auto complete mode for python
;;; Commentary:
;;; Code:

(autoload 'python-mode "python-mode" "Python editing mode." t)
(custom-set-variables
 '(py-indent-offset 4)
 )
(add-hook 'python-mode-hook
	  '(lambda ()
	     (setq tab-width 4)
	     (setq indent-tabs-mode nil)
	     )
	  )

;; use python3
(custom-set-variables
 '(py-force-py-shell-name-p t)
 '(py-shell-name "python3"))

;; jedi for python auto-complete
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; py-yapf for python auto shaping
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)

;;; init-python-mode.el ends here
