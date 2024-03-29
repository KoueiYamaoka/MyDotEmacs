;;; init-flycheck.el --- Flycheck Config
;;; Commentary:
;;; Code:

;; Flycheck
;; (global-flycheck-mode)
;; (add-hook 'after-init-hook #'global-flycheck-mode)
;; (setq flycheck-check-syntax-automatically '(save mode-enabled))

;; hooks
(add-hook 'text-mode-hook 'flycheck-mode)
(add-hook 'org-mode-hook 'flycheck-mode)
(add-hook 'yatex-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'matlab-mode-hook 'flycheck-mode)
(add-hook 'web-mode-hook 'flycheck-mode)

;; keybind
(global-set-key (kbd "C-c p") 'flycheck-previous-error)
(global-set-key (kbd "C-c n") 'flycheck-next-error)

;; python flake8
(setq-default flycheck-flake8-maximum-line-length 88)

;;; init-flycheck.el ends here















