;;; outline-magic.el --- make outline-mode better
;;; Commentary:
;;; Code:

(require 'outline-magic)
(add-hook 'outline-mode-hook
          (lambda ()
            (require 'outline-cycle)))

(add-hook 'outline-minor-mode-hook
          (lambda ()
            (require 'outline-magic)
            (define-key outline-minor-mode-map (kbd "C-c TAB") 'outline-cycle)))

(add-hook 'prog-mode-hook 'outline-minor-mode)
(add-hook 'yatex-mode-hook 'outline-minor-mode)

(with-eval-after-load 'python-mode
  (custom-set-variables '(py-outline-mode-keywords
                          '("class"    "def"    "except"
                            "for"      "while"   "finally" "try"
                            "with"     "match"  "case")
                          )))

(add-hook 'python-mode-hook
          (lambda ()
            (setq outline-promotion-headings
                  '("class" "def" "except" "for"
                    "while" "finally" "try" "with" "match" "case"))))


(add-hook 'yatex-mode-hook
          (function
           (lambda ()
             (setq outline-regexp
                   (concat "[ \t]*\\\\\\(documentstyle\\|documentclass\\|"
                           "chapter\\|section\\|subsection\\|subsubsection\\|\\begin{frame}\\)"
                           "\\*?[ \t]*[[{]")))))

(add-hook 'yatex-mode-hook
          (lambda ()
            (setq outline-promotion-headings
                  '("\\chapter" "\\section" "\\subsection" "\\subsubsection"
                    "\\paragraph" "\\subparagraph" "\\begin{frame}"))))


;;; init-outline-magic.el ends here
