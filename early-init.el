;;; early-init.el --- load before init.el and GUI initialization
;;; Commentary:
;;; Code:

; remove menu and tool bars
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)

; stop GC; enable this at the end of init.el
(setq gc-cons-threshold most-positive-fixnum)

;;; early-init.el ends here
