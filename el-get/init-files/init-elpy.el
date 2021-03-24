;;; elpy.el -- python IDE for Emacs
;;; commentary:
;;; Code:

(require 'elpy)
(setq elpy-rpc-virtualenv-path 'current)

;;Hideshow
(global-set-key (kbd "C-c '") 'elpy-folding-toggle-at-point)

;; other customization
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;;; init-elpy.el ends here
