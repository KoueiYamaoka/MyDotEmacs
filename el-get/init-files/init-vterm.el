;;; vterm.el --- emacs-libvterm
;;; Commentary:
;;; Code:

(require 'vterm)

;; keybindings
(define-key vterm-mode-map [?\C-h] [?\C-?])
(define-key vterm-mode-map (kbd "C-d") 'delete-word)
(define-key vterm-mode-map (kbd "C-o") 'other-window)

;; commands that emacs is allowed to execute form vterm
(add-to-list 'vterm-eval-cmds '("switch-to-prev-buffer" switch-to-prev-buffer))

;; default settings
(setq show-trailing-whitespace nil)

;;; init-anzu.el ends here
