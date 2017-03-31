;;; jedi.el --- jedi - python auto-complete
;;; Commentary:
;;; Code:
;(add-hook 'jedi-mode-hook
;	  '(lambda ()
;	  (define-key jedi-mode-map "\C-c t" 'jedi:goto-definition)
;	  (define-key jedi-mode-map "\C-c b" 'jedi:goto-definition-pop-marker)
;	  ))
(eval-after-load "jedi"
  '(progn
     (define-key jedi-mode-map (kbd "C-c ,")nil)
     (define-key jedi-mode-map (kbd "C-c .")nil)
     ))

;;; init-jedi.el ends here
