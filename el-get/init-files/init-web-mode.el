;;; web-mode.el --- web-mode
;;; Commentary:
;;; Code:

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsp$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))

(defun web-mode-hook ()
  "Hooks for Web mode."

  ;; indentation
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

  ;; auto tag closing
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-auto-close-style 2)
  )

(add-hook 'web-mode-hook 'web-mode-hook)


;; web-mode colors
(set-face-attribute 'web-mode-doctype-face nil :foreground "#4A8ACA")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "#4A8ACA")
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "#4A8ACA")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "#87CEEB")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "#FFFFFF")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "#D78181")
(set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")

 ;;; web-mode css colors
(set-face-attribute 'web-mode-css-at-rule-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-comment-face nil :foreground "#587F35")
(set-face-attribute 'web-mode-css-selector-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-css-pseudo-class-face nil :foreground "#DFCF44")
(set-face-attribute 'web-mode-css-property-name-face nil :foreground "#87CEEB")
(set-face-attribute 'web-mode-css-string-face nil :foreground "#D78181")

;;; init-web-mode.el ends here
