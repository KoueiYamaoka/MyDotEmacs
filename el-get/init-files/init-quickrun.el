;;; init-quickrun.el --- Emacs Quickrun
;;; Commentary:
;;; Code:
(require 'quickrun)
(global-set-key (kbd "C-c c") 'quickrun)
;;; quickrun with argument
(global-set-key (kbd "C-c a c") 'quickrun-with-arg)


;;; init-quickrun.el ends here
