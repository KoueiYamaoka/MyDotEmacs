;;; smartparents.el --- smart minor mode for dealing with pairs
;;; Commentary:
;;; Code:

(require 'smartparens-config)

(add-hook 'prog-mode-hook #'smartparens-mode)
(add-hook 'yatex-mode-hook #'smartparens-mode)
(sp-pair "<" ">")

;;; init-jedi.el ends here
