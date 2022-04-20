;;; jedi.el --- jedi - python auto-complete
;;; Commentary:
;;; Code:

(add-hook 'python-mode-hook 'jedi:setup)
;; automatically start completion after inserting a dot
(setq jedi:complete-on-dot t)

(eval-after-load "jedi"
  '(progn
     (define-key jedi-mode-map (kbd "C-c ,") nil)
     (define-key jedi-mode-map (kbd "C-c .") nil)
     ))

(eval-after-load "flyspell"
  '(progn
     (ac-flyspell-workaround)
     ))

;;; init-jedi.el ends here
