;;;markdown-mode.el --- markdown-mode for Emacs
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))


;;; init-markdown-mode.el ends here
