;;; init-yatex.el -- Yet Another LaTeX mode for Emacs
;;; Commentary:
;;; Code:
;; YaTeX mode

(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
		("\\.sty$" . yatex-mode)
		("\\.cls$" . yatex-mode)
		("\\.bbl$" . yatex-mode))
	      auto-mode-alist))

(setq YaTeX-use-AMS-LaTeX t)
(setq tex-command "lualatex -synctex=1")
(setq bibtex-command "pbibtex")

(add-hook 'yatex-mode-hook 'turn-on-reftex)
;;; Character code of YaTeX
;;; 0 = no-converion  use character code using in Emacs
;;; 1 = Shift JIS
;;; 2 = JIS (ISO-2022-JP)
;;; 3 = EUC (EUC-JP)
;;; 4 = UTF-8
(setq YaTeX-kanji-code 4)

;; mode name setting
;(setcar (cdr (assq 'yatex-mode minor-mode-alist)) "yatex")
(add-hook 'yatex-mode-hook '(lambda () (setq mode-name "yatex")))

;;; init-yatex.el ends here
