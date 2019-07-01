;;; web-mode.el --- web-mode
;;; Commentary:
;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."

  ;; indent
  (setq web-mode-html-offset   2)
  (setq web-mode-style-padding 2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2)

  ;; auto tag closing
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-tag-auto-close-style 2)
)

(add-hook 'web-mode-hook 'web-mode-hook)

;;; init-web-mode.el ends here
