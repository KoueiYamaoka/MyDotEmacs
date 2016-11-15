;;; matlab.el --- matlab-mode
;;; Commentary:
;;; Code:

;; default settings
(autoload 'matlab-mode "matlab" "Matlab Editing mode" t)
(add-to-list
 'auto-mode-alist
 '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; settings for using matlab on emacs
(setq matlab-shell-command "~/MATLAB/R2015b/bin/matlab")
(setq matlab-shell-command-switches (lsit "-nodesktop"))

;;; init-matlab.el ends here
