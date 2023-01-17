;;; pdf-tools.el --- pdf viewer for emacs
;;; Commentary:
;;; Code:

(pdf-loader-install)
(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
(add-hook 'pdf-view-mode-hook 'pdf-tools-enable-minor-modes)
(add-hook 'pdf-view-mode-hook 'auto-revert-mode)

;;; init-pdf-tools.el ends here
