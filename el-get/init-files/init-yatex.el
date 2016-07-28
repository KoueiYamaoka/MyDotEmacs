;;; 13-yatex.el -- YaTeX for Emacs LaTeX Mode
;;; Commentary:
;;; Code:
;; YaTeX mode
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq tex-command "platex")
(setq dviprint-command-format "dvipdfmx %s")
(setq dvi2-command "open")
(setq bibtex-command "pbibtex")
(setq YaTeX-dvi2-command-ext-alist
  '(("[agx]dvi\\|dviout\\|emacsclient" . ".dvi")
    ("ghostview\\|gv" . ".ps")
    ("acroread\\|pdf\\|Preview\\|TeXShop\\|Skim\\|evince\\|apvlv\\|open" . ".pdf")))

(add-hook 'yatex-mode-hook 'turn-on-reftex)
;;; YaTeX の文字コード
;;; 0 = no-converion  Emacs内部で使用されている文字コードで保存
;;; 1 = Shift JIS
;;; 2 = JIS (ISO-2022-JP)
;;; 3 = EUC (EUC-JP)
;;; 4 = UTF-8
(setq YaTeX-kanji-code 4)
;;; 13-yatex.el ends here
