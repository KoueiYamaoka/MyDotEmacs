;;; popwin.el --- popwin
;;; Commentary:
;;; Code:
;;;
(setq display-buffer-alist 'popwin:display-buffer)
(setq popwin:popup-buffer-position 'bottom)

;; helm setting
(when (require 'popwin)
  (setq helm-samewindow nil)
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:special-display-config '(("*compilatoin*"  :noselect t)
					("helm" :regexp t :height 0.4)
					)))
;; google translate setting
(push '("*Google Translate*") popwin:special-display-config)

;;; init-popwin.el ends here
