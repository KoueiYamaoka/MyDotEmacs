;;; init-autocomplete.el --- Emacs Auto Complete Mode
;;; Commentary:
;;; Code:
(ac-config-default)
(setq ac-use-menu-map t)
(setq ac-use-fuzzy t)
;(define-key ac-menu-map "C-n" 'ac-next)
;(define-key ac-menu-map "C-p" 'ac-previous)

;; 大文字と小文字を区別
(custom-set-variables '(ac-ignore-case nil))
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(add-to-list 'ac-modes 'text-mode)         ;; text-modeでも自動的に有効にする
(add-to-list 'ac-modes 'fundamental-mode)  ;; fundamental-mode
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'matlab-mode)
(ac-set-trigger-key "TAB")

;;; 10-autocomplete.el ends here
