;;; init-python-mode.el --- auto complete mode for python
;;; Commentary:
;;; Code:

(require 'python-mode)
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

;; disable auto-fill-mode
(add-hook ' python-mode-hook
	    '(lambda () (auto-fill-mode -1)))

;; disable python-shell-send-buffer, which is defined in init-elpy.el instead
(define-key python-mode-map (kbd "C-c C-c") nil)


;;; init-python-mode.el ends here
