;;; shackle.el --- simple version of popwin
;;; Commentary:
;;; Code:

;; default settings
(require 'shackle)
(setq shackle-rules
      '(
	(compilation-mode :align below :ratio 0.2)
	("*Help*" :align right)
	("*Google Translate*" :align below :ratio 0.3)
	)
      )
(shackle-mode 1)
(setq shackle-lighter "")

;;; init-shackle.el ends here
