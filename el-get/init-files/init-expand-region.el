;;; expand-region.el --- expand-region
;;; Commentary:
;;; Code:
(require 'expand-region)
;; 真っ先に入れておかないとすぐに括弧に対応してくれないらしい
(push 'er/mark-outside-pairs er/try-expand-list)
;(add-hook 'python-mode 'expand-region)
(global-set-key (kbd "C-c ,") 'er/expand-region)
(global-set-key (kbd "C-M-,") 'er/contract-region)
(transient-mark-mode t)
;;; init-expand-region.el ends here
