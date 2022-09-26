;;; openwith.el --- open files with external apps
;;; Commentary:
;;; Code:

(when (require 'openwith nil 'noerror)
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("png" "gif" "jpg"))
               "eog"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf" "dvi"))
               "evince"
               '(file))
         ))
  (openwith-mode 1))

;;; init-anzu.el ends here
