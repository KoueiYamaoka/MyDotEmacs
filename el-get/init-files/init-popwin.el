;;; popwin.el --- popwin
;;; Commentary:
;;; Code:
;;;
(setq display-buffer-function 'popwin:display-buffer)
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

;; quickrun
(push '("*quickrun*") popwin:special-display-config)

;; python-mode
(push '("*python3*") popwin:special-display-config)

;; undo-tree
(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)

;; YaTex
(require 'popwin-yatex)
(push '("*YaTeX-typesetting*") popwin:special-display-config)

;;; init-popwin.el ends here
