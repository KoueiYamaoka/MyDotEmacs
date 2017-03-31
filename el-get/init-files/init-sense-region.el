;;; sense-region.el --- sense-region
;;; Commentary:
;;; Code:
;;Warning: `mapcar' called for effect; use `mapc' or `dolist' instead を防ぐ
(setq byte-compile-warnings '(free-vars unresolved callargs redefine obsolete noruntime cl-functions interactive-only make-local))
(autoload 'sense-region-on "sense-region"
    "System to toggle region and rectangle." t nil)
(sense-region-on)

;;; init-sense-region.el ends here
