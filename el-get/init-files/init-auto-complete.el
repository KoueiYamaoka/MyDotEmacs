;;; init-auto-complete.el --- Emacs Auto Complete Mode
;;; Commentary:
;;; Code:
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
;(define-key ac-menu-map "C-n" 'ac-next)
;(define-key ac-menu-map "C-p" 'ac-previous)

;; case sensitive
(custom-set-variables '(ac-ignore-case nil))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'matlab-mode)
(ac-set-trigger-key "TAB")

;;; init-auto-complete.el ends here
