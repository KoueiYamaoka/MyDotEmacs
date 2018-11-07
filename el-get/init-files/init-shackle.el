;;; shackle.el --- simple version of popwin
;;; Commentary:
;;; Code:

;; default settings
(require 'shackle)
(setq shackle-rules
      '(
	(compilation-mode :align below :ratio 0.2)
	("*Help*" :align right)
	)
      )

;;; init-shackle.el ends here
