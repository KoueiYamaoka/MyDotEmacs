;;; migemo.el --- cmigemo for emacs
;;; Commentary:
;;; Code:

(require 'migemo)
(setq migemo-command "cmigemo")
(setq migemo-options '("-q" "--emacs"))

(setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(migemo-init)

;;; init-mwim.el ends here
