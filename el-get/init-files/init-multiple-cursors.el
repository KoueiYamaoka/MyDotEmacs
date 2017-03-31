;;; mltiple-cursors.el --- mltiple-cursors
;;; Commentary:
;;; Code:
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-c *") 'mc/mark-all-in-region)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
		     '(("C-t"      . 'mc/mark-next-like-this)
		       ("n"        . 'mc/mark-next-like-this)
		       ("p"        . 'mc/mark-previous-like-this)
		       ("u"        . 'mc/unmark-next-like-this)
		       ("U"        . 'mc/unmark-previous-like-this)
		       ("s"        . 'mc/skip-to-next-like-this)
		       ("S"        . 'mc/skip-to-previous-like-this)
		       ("*"        . 'mc/mark-all-like-this)
		       ))
;;; init-mltiple-cursors.el ends here
