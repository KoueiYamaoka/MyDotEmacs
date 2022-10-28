;;; pdf-tools.el --- pdf viewer for emacs
;;; Commentary:
;;; Code:

(add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
(add-hook 'pdf-view-mode-hook 'pdf-tools-install)
(add-hook 'pdf-view-mode-hook 'pdf-tools-enable-minor-modes)

;;; init-pdf-tools.el ends here
