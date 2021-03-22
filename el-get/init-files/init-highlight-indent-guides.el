;;; highlight-indent-guides.el --- highlight-indent-guides for Emacs
;;; Commentary:
;;; Code:

(require 'highlight-indent-guides)
(setq highlight-indent-guides-method 'character)
(setq highlight-indent-guides-character ?|)
(setq highlight-indent-guides-auto-enabled nil)
(set-face-foreground 'highlight-indent-guides-character-face "blue")



(add-hook 'python-mode-hook 'highlight-indent-guides-mode)


;;; highlight-indent-guides.el ends here
