;;; highlight-indent-guides.el --- highlight-indent-guides for Emacs
;;; Commentary:
;;; Code:

(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?|)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-foreground 'highlight-indent-guides-character-face "blue")

(add-hook 'python-mode-hook 'highlight-indent-guides-mode)
(add-hook 'html-mode-hook 'highlight-indent-guides-mode)

(defun my-highlighter (level responsive display)
  (if (> 1 level)
      nil
    (highlight-indent-guides--highlighter-default level responsive display)))

(setq highlight-indent-guides-highlighter-function 'my-highlighter)

;;; highlight-indent-guides.el ends here
