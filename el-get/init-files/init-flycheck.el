;;; init-flycheck.el --- Flycheck Config
;;; Commentary:
;;; Code:
;; Flycheck
(global-flycheck-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-check-syntax-automatically '(save mode-enabled))

;; keybind
(global-set-key (kbd "C-c C-p") 'flycheck-previous-error)
(global-set-key (kbd "C-c C-n") 'flycheck-next-error)

;;; init-flycheck.el ends here
