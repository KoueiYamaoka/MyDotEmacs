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
(setq tex-command "latexmk")
(setq bibtex-command "pbibtex")
(setq YaTeX-dvi2-command-ext-alist
  '(("[agx]dvi\\|dviout\\|emacsclient" . ".dvi")
    ("ghostview\\|gv" . ".ps")
    ("acroread\\|pdf\\|Preview\\|TeXShop\\|Skim\\|evince\\|apvlv\\|open" . ".pdf")))
(setq dvi2-command "evince") ; call by C-c t p
(setq tex-pdfview-command "xdg-open")

(add-hook 'yatex-mode-hook 'turn-on-reftex)
;;; Character code of YaTeX
;;; 0 = no-converion  use character code using in Emacs
;;; 1 = Shift JIS
;;; 2 = JIS (ISO-2022-JP)
;;; 3 = EUC (EUC-JP)
;;; 4 = UTF-8
(setq YaTeX-kanji-code 4)
(setq YaTeX-latex-message-code 'utf-8)

;; mode name setting
;(setcar (cdr (assq 'yatex-mode minor-mode-alist)) "yatex")
(add-hook 'yatex-mode-hook '(lambda () (setq mode-name "yatex")))

;; misc
(setq YaTeX-electric-indent-mode t)


;; set tex command
(defun set-tex-command-for-yatex(latex-type)
  (interactive "slatex-type:")
  (cond
   ((equal latex-type "platex")
    (setq tex-command "platex"))
   ((equal latex-type "lualatex")
    (setq tex-command "lualatex -synctex=1"))
   (t
    (setq tex-command "latexmk")) ; default
   )
  )

;;; init-yatex.el ends here
