;;; flycheck.el --- Flycheck Config
;;; Commentary:
;;; Code:
;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
;;; keybind
(global-set-key (kbd "C-c C-p") 'flycheck-previous-error)
(global-set-key (kbd "C-c C-n") 'flycheck-next-error)


;;; flycheck.el ends here
