;;; elpy.el -- python IDE for Emacs
;;; commentary:
;;; Code:

(require 'elpy)
(elpy-enable)
(setq elpy-rpc-virtualenv-path 'current)

;;Hideshow
(define-key elpy-mode-map (kbd "C-c '") 'elpy-folding-toggle-at-point)

;; python interpreter
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(add-hook 'elpy-mode-hook 'run-python)
(define-key elpy-mode-map (kbd "C-c C-c") (lambda ()
					    (interactive)
					    (display-buffer (get-buffer-create "*Python*"))
					    (let ((current-prefix-arg '(4)))
					      (call-interactively #'python-shell-send-buffer))))

;; other customization
(when (load "flycheck" t t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))


;;; init-elpy.el ends here
