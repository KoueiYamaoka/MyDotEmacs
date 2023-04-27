;;;;; init.el -- emacs init file
;;;;; Commentary:
;;;;; Code:

;; coding system setting; maybe unnecessary
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
(set-default 'buffer-file-coding-system 'utf-8)

;; mozc
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-mozc")
(require 'mozc)
(setq default-input-method "japanese-mozc")

;; load local_custom, including api keys
(load "~/.emacs.d/local_custom")

;; font
(custom-set-faces
 '(default ((t (:family "HackGen" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))

;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
        :ensure t
        :init
        ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
        (leaf hydra :ensure t)
        (leaf el-get :ensure t)
        (leaf blackout :ensure t)

        :config
        ;; initialize leaf-keywords.el
        (leaf-keywords-init))
  )
;; </leaf-install-code>

;; Avoid custom adding configs to init.el automatically
(leaf *builtins
  :config
  (leaf cus-edit
    :doc "tools for customizing Emacs and Lisp packages"
    :tag "builtin" "faces" "help"
    :custom `((custom-file . ,(locate-user-emacs-file "custom.el")))
    )

  (leaf cus-start
    :doc "define customization properties of builtins"
    :tag "builtin" "internal"
    :custom ((user-full-name . "Kouei Yamaoka")
             (user-mail-address . "kouei525@gmail.com")
             (shell-file-name . "/bin/zsh")
             (debug-on-error . nil)
             (delete-auto-save-files . t)
             (backup-inhibited . t)
             (blink-cursor-mode . 0)
             (enable-recursive-minibuffers . t)
             (kill-whole-line . t)
             (indent-tabs-mode . nil)
             (tab-width . 4)
             (vc-follow-symlinks . t)
             (show-trailing-whitespace . t)
             (show-paren-style . 'mixed)
             (line-number-mode . t)
             (column-number-mode . t)
             (fill-column . 120)
             (require-final-newline . t)
             (scroll-preserve-screen-position . t)
             (scroll-error-top-bottom . t)
             (menu-bar-mode . nil)
             (tool-bar-mode . nil)
             (scroll-bar-mode . nil)
             (completion-ignore-case . t)
             )
    :config
    (defalias 'yes-or-no-p 'y-or-n-p) ; "yes or no" to "y or n"
    (set-face-background 'trailing-whitespace "#b14770")
    )

  (leaf files
    :doc "file input and output commands"
    :tag "builtin"
    :custom ((auto-save-timeout . 15)
             (auto-save-interval . 50))
    )

  (leaf delsel
    :doc "delete selected region if you insert"
    :tag "builtin"
    :global-minor-mode delete-selection-mode)

  (leaf uniquify
    :doc "unique buffer names dependent on file name"
    :tag "builtin" "files"
    :added "2023-01-18"
    :custom ((uniquify-buffer-name-style . 'post-forward-angle-brackets))
    )

  (leaf elec-pair
    :doc "Automatic parenthesis pairing"
    :tag "builtin"
    :added "2023-01-26"
    :custom (electric-pair-mode . t)
    )

  (leaf midnight
    :doc "run something every midnight, e.g., kill old buffers"
    :tag "builtin"
    :added "2023-01-19"
    :hook (emacs-startup-hook . midnight-mode)
    )

  (leaf cua-base
    :doc "emulate CUA key bindings"
    :tag "builtin"
    :added "2023-01-19"
    :global-minor-mode cua-mode
    :custom ((cua-enable-cua-keys . nil))
    :bind ("C-x 2" . cua-set-rectangle-mark)
    :config
    (leaf-keys ((:cua-global-keymap ("C-<return>" . newline)))
               )
    )

  (leaf linum
    :doc "display line numbers in the left margin"
    :tag "builtin"
    :added "2023-01-19"
    :custom (linum-format . "%3d")
    :config
    (global-set-key [f6] 'linum-mode) ; How do I get assigned it to [f6] using :bind?
    )

  (leaf *spellcheck
    :config
    (leaf ispell
      :doc "interface to spell checkers"
      :tag "builtin"
      :added "2023-01-20"
      :custom (ispell-program-name . "aspell")
      :config
                                        ; use spell check even if there are several japanese
      (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
      )

    (leaf flyspell
      :doc "On-the-fly spell checker"
      :tag "builtin"
      :added "2023-01-20"
      :hook ((emacs-lisp-mode-hook . flyspell-prog-mode)
             (python-mode-hook . flyspell-prog-mode)
             (yatex-mode-hook . flyspell-mode )
             (text-mode-hook . flyspell-mode ))
      )
    )

  (leaf *clipboard
    :doc "share the clipboard with OS X window"
    :custom ((x-select-enable-clipboard . t)
             (interprogram-paste-function . 'x-cut-buffer-or-selection-value))
    )
  )

(leaf leaf
  :config
  (leaf leaf-tree :ensure t)
  (leaf leaf-convert :ensure t)
  )

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))

(leaf *keybindings
  :config
  (defun delete-word (arg)
    (interactive "p")
    (delete-region (point) (progn (forward-word arg) (point))))
  (leaf-keys (("C-d" . delete-word)
              ("C-z" . undo)
              ("C-c ;" . comment-or-uncomment-region)
              ("C-c q" . query-replace)
              ("C-c r" . replace-string)
              ("M-0" . delete-window)
              ("M-1" . delete-other-windows)
              ("M-2" . split-window-vertically)
              ("M-3" . split-window-horizontally)
              ("C-o" . other-window)
              ("M-$" . ispell-buffer)
              )
             )
  (define-key key-translation-map [?\C-h] [?\C-?])
  )

;;;; packages
;; system
(leaf *undo-tools
  :config
  (leaf undo-tree
    :doc "Treat undo history as a tree"
    :req "queue-0.2" "emacs-24.3"
    :tag "tree" "history" "redo" "undo" "files" "convenience" "emacs>=24.3"
    :url "https://www.dr-qubit.org/undo-tree.html"
    :added "2023-01-18"
    :ensure t
    :bind (("C-x u" . undo-tree-visualize))
    :custom ((undo-tree-history-directory-alist . '(("." . "~/.emacs.d/undotree"))))
    ;; :hook (find-file-hook . undo-tree-load-history)
    :config
    (global-undo-tree-mode)
    )

  (leaf undohist
    :disabled t
    :doc "Persistent undo history for GNU Emacs"
    :req "cl-lib-1.0"
    :tag "convenience"
    :added "2023-01-18"
    :ensure t
    :config (undohist-initialize)
    )
  )

(leaf vterm
  :doc "Fully-featured terminal emulator"
  :req "emacs-25.1"
  :tag "terminals" "emacs>=25.1"
  :url "https://github.com/akermu/emacs-libvterm"
  :added "2023-01-27"
  :ensure t
  :require t
  :hook (vterm-mode-hook . (lambda() (setq show-trailing-whitespace nil)))
  :bind ((:vterm-mode-map("C-h" . backward-delete-char-untabify)
                         ("C-d" . delete-word)
                         ("C-o" . other-window)
                         ("C-y" . vterm-yank)))
  :config
  (add-to-list 'vterm-eval-cmds '("switch-to-prev-buffer" switch-to-prev-buffer))
  (leaf *vterm-on-emacs
    :after vterm
    :preface
    (defun command-to-exit-emacs ()
      (interactive)
      (if (display-graphic-p)
          (vterm)
        (save-buffers-kill-terminal)))
    :config
    (global-set-key (kbd "C-x C-c") 'command-to-exit-emacs)
    )
  )

(leaf *hydra-system
  :config
  (leaf *hydra-font
    :hydra (hydra-zoom ()
                       "Zoom"
                       ("g" text-scale-increase "in")
                       ("l" text-scale-decrease "out")
                       ("r" (text-scale-set 0) "reset")
                       ("0" (text-scale-set 0) :bind nil :exit t)
                       )
    :bind ("<f2>" . hydra-zoom/body)
    )

  (leaf *hydra-pinky
    :hydra (hydra-pinky ()
                        "pinky"
                        ("n" next-line)
                        ("p" previous-line)
                        ("f" forward-char)
                        ("b" backward-char)
                        ("a" beginning-of-line)
                        ("e" move-end-of-line)
                        ("l" recenter-top-bottom)
                        ("SPC" set-mark-command)
                        ("g" keyboard-quit)
                        )
    :bind ("C-c p" . hydra-pinky/body)
    )
  )

;; Completion
(leaf vertico
  :doc "VERTical Interactive COmpletion"
  :req "emacs-27.1"
  :tag "emacs>=27.1"
  :url "https://github.com/minad/vertico"
  :added "2023-01-18"
  :ensure t
  :global-minor-mode vertico-mode
  :config
  (leaf savehist
    :doc "Save minibuffer history"
    :tag "builtin"
    :added "2023-01-18"
    :init (savehist-mode)
    )

  (leaf vertico-directory
    :doc "Ido-like directory navigation for Vertico"
    :req "emacs-27.1" "vertico-1.0"
    :tag "out-of-MELPA" "emacs>=27.1"
    :url "https://github.com/minad/vertico"
    :added "2023-01-19"
    :ensure nil
    :after vertico
    :require t
    :bind ((vertico-map
            ("RET" . vertico-directory-enter)
            ("C-l" . vertico-directory-up)))
    )

  (leaf orderless
    :doc "Completion style for matching regexps in any order"
    :req "emacs-26.1"
    :tag "extensions" "emacs>=26.1"
    :url "https://github.com/oantolin/orderless"
    :added "2023-01-18"
    :ensure t
    :custom ((completion-styles . '(orderless)))
    )

  (leaf marginalia
    :doc "Enrich existing commands with completion annotations"
    :req "emacs-27.1" "compat-29.1.1.1"
    :url "https://github.com/minad/marginalia"
    :added "2023-01-18"
    :ensure t
    :global-minor-mode marginalia-mode
    )

  (leaf consult
    :doc "Consulting completing-read"
    :req "emacs-27.1" "compat-29.1.1.1"
    :url "https://github.com/minad/consult"
    :added "2023-01-18"
    :ensure t
    :bind (("C-x j" . consult-goto-line))
    )
  )

(leaf company
  :doc "Modular text completion framework"
  :req "emacs-25.1"
  :tag "matching" "convenience" "abbrev" "emacs>=25.1"
  :url "http://company-mode.github.io/"
  :added "2023-01-19"
  :ensure t
  :global-minor-mode global-company-mode
  :preface
  (defun company--insert-candidate2 (candidate)
    (when (> (length candidate) 0)
      (setq candidate (substring-no-properties candidate))
      (if (eq (company-call-backend 'ignore-case) 'keep-prefix)
          (insert (company-strip-prefix candidate))
        (if (equal company-prefix candidate)
            (company-select-next)
          (delete-region (- (point) (length company-prefix)) (point))
          (insert candidate))
        )))
  (defun company-complete-common2 ()
    (interactive)
    (when (company-manual-begin)
      (if (and (not (cdr company-candidates))
               (equal company-common (car company-candidates)))
          (company-complete-selection)
        (company--insert-candidate2 company-common))))

  :bind ((company-active-map
          ("M-n" . nil)
          ("M-p" . nil)
          ("C-h" . nil)
          ("C-s" . company-filter-candidates)
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)
          ("C-i" . company-complete-common2))
         (company-search-map
          ("C-n" . company-select-next)
          ("C-p" . company-select-previous)))

  :custom ((company-idle-delay . 0)
           (company-minimum-prefix-length . 1)
           (company-transformers . '(company-sort-by-occurrence))
           (company-selection-wrap-around . t))

  :config
  (leaf company-quickhelp
    :doc "Popup documentation for completion candidates"
    :req "emacs-24.3" "company-0.8.9" "pos-tip-0.4.6"
    :tag "quickhelp" "documentation" "popup" "company" "emacs>=24.3"
    :url "https://www.github.com/expez/company-quickhelp"
    :added "2023-01-19"
    :ensure t
    :after company pos-tip
    :global-minor-mode company-quickhelp-mode
    :config
    (leaf company-quickhelp-terminal
      :doc "Terminal support for company-quickhelp"
      :req "emacs-24.4" "company-quickhelp-2.2.0" "popup-0.5.3"
      :tag "help" "tip" "support" "extends" "terminal" "convenience" "emacs>=24.4"
      :url "https://github.com/jcs-elpa/company-quickhelp-terminal"
      :added "2023-01-19"
      :ensure t
      :after company-quickhelp)
    )

  (leaf company-wordfreq
    :doc "Company backend for human language texts"
    :req "emacs-27.1" "company-0.9"
    :tag "matching" "convenience" "company" "emacs>=27.1"
    :url "https://github.com/johannes-mueller/company-wordfreq.el"
    :added "2023-01-26"
    :el-get johannes-mueller/company-wordfreq.el
    :config
    (add-hook 'text-mode-hook (lambda ()
                                (setq-local company-backends
                                            '(company-wordfreq
                                              company-dabbrev
                                              company-capf))
                                (setq-local company-transformers nil)))
    )
  )

;; search
(leaf migemo
  :doc "Japanese incremental search through dynamic pattern expansion"
  :req "cl-lib-0.5"
  :url "https://github.com/emacs-jp/migemo"
  :added "2023-01-18"
  :if (executable-find "cmigemo")
  :ensure t
  :custom ((migemo-command . "cmigemo")
           (migemo-options . '("-q" "--emacs"))
           (migemo-dictionary . user-migemo-dictionary)
           (migemo-user-dictionary . nil)
           (migemo-regex-dictionary . nil)
           (migemo-coding-system  . 'utf-8-unix)
           (migemo-isearch-min-length . 2))
  :hook (emacs-startup-hook . migemo-init)
  )

(leaf anzu
  :doc "Show number of matches in mode-line while searching"
  :req "emacs-25.1"
  :tag "emacs>=25.1"
  :url "https://github.com/emacsorphanage/anzu"
  :added "2023-01-18"
  :ensure t
  ;; :after migemo
  :init (global-anzu-mode)
  :custom ((anzu-deactivate-region . t)
           (anzu-search-threshold . 100)
           (auzu-minimum-input-length . 2)
           (anzu-use-migemo . t))
  )

;; infra
(leaf shackle
  :doc "Enforce rules for popups"
  :req "emacs-24.3" "cl-lib-0.5"
  :tag "convenience" "emacs>=24.3"
  :url "https://depp.brause.cc/shackle"
  :added "2023-01-19"
  :ensure t
  :custom ((shackle-rules . '((compilation-mode :align below :ratio 0.2)
	                         ("*Help*" :align right)
	                         ("*Google Translate*" :align below :ratio 0.3)
	                         ("*Python*" :align right :ratio 0.5)
	                         ("*Python3*" :align right :ratio 0.5)
	                         ("*quickrun*" :align right :ratio 0.4)
	                         (YaTeX-typeset-buffer :align right :ratio 0.2)))
           (shackle-lighter . ""))
  :global-minor-mode shackle-mode
  )

(leaf *AI-tools
  :config
  (leaf google-translate
    :doc "Emacs interface to Google Translate"
    :req "emacs-24.3" "popup-0.5.8"
    :tag "convenience" "emacs>=24.3"
    :url "https://github.com/atykhonov/google-translate"
    :added "2023-01-19"
    :ensure t
    :require t
    :bind (("C-x t" . google-translate-enja-or-jaen)
           ("C-x C-t" . google-translate-query-translate))
    :preface
    ;; auto set source lang and target lang
    (defun google-translate-enja-or-jaen (&optional string)
      (interactive)
      (setq string
	        (cond ((stringp string) string)
	              (current-prefix-arg
	               (read-string "Google Translate: "))
	              ((use-region-p)
	               (buffer-substring (region-beginning) (region-end)))
	              (t
	               (thing-at-point 'word))))
      (let* ((asciip (string-match
		              "[a-zA-Z]"
		              string)))
        (run-at-time 0.1 nil 'deactivate-mark)
        (google-translate-translate
         (if asciip "en" "ja")
         (if asciip "ja" "en")
         string)))

    ;; for avoiding args-out-of-range [] 1
    (defun google-translate-json-suggestion (json)
      (let ((info (aref json 7)))
        (if (and info (> (length info) 0))
	        (aref info 1)
          nil))
      )

    ;; for avoiding Error: search-failed ",tkk:'".
    (defun google-translate--search-tkk ()
      (list 430675 2721866130)
      )
    )
  )

;; programming
(leaf *programming
  :config
  (leaf quickrun
    :doc "Run commands quickly"
    :req "emacs-26.1" "ht-2.0"
    :tag "tools" "emacs>=26.1"
    :url "https://github.com/emacsorphanage/quickrun"
    :added "2023-01-19"
    :ensure t
    :bind (("C-c c" . quickrun)
           ("C-c a c" . quickrun-with-arg))
    )

  (leaf highlight-symbol
    :doc "automatic and manual symbol highlighting"
    :tag "matching" "faces"
    :url "http://nschum.de/src/emacs/highlight-symbol/"
    :added "2023-01-19"
    :ensure t
    :custom ((highlight-symbol-idle-delay . 0.2)
             (highlight-symbol-colors . '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1")))
    :hook ((prog-mode-hook . highlight-symbol-mode)
           (html-mode-hook . highlight-symbol-mode)
           (prog-mode-hook . highlight-symbol-nav-mode)
           )
    )

  (leaf highlight-indent-guides
    :doc "Minor mode to highlight indentation"
    :req "emacs-24.1"
    :tag "emacs>=24.1"
    :url "https://github.com/DarthFennec/highlight-indent-guides"
    :added "2023-01-19"
    :ensure t
    :require t
    :preface
    (defun my-highlighter (level responsive display)
      (if (> 1 level)
          nil
        (highlight-indent-guides--highlighter-default level responsive display)))

    :custom ((highlight-indent-guides-method . 'character)
             (highlight-indent-guides-character . ?|)
             (highlight-indent-guides-auto-enabled . nil)
             (highlight-indent-guides-highlighter-function . 'my-highlighter))

    :hook ((python-mode-hook . highlight-indent-guides-mode)
           (html-mode-hook . highlight-indent-guides-mode))

    :config (set-face-foreground 'highlight-indent-guides-character-face "blue")
    )

  (leaf comment-dwim-2
    :doc "An all-in-one comment command to rule them all"
    :req "emacs-24.4"
    :tag "convenience" "emacs>=24.4"
    :url "https://github.com/remyferre/comment-dwim-2"
    :added "2023-01-19"
    :bind (("M-;" . comment-dwim-2))
    :ensure t
    :after org
    )
  )

;; lsp
(leaf eglot
  :doc "The Emacs Client for LSP servers"
  :req "emacs-26.3" "jsonrpc-1.0.14" "flymake-1.2.1" "project-0.3.0" "xref-1.0.1" "eldoc-1.11.0" "seq-2.23"
  :tag "languages" "convenience" "emacs>=26.3"
  :url "https://github.com/joaotavora/eglot"
  :added "2023-01-24"
  :ensure t
  :after jsonrpc flymake project xref eldoc
  :hook ((python-mode-hook . eglot-ensure)
         )
  :custom (eldoc-echo-area-use-multiline-p . nil)
  :config
  (add-hook 'python-mode-hook (lambda () (add-hook 'before-save-hook 'eglot-format-buffer))) ; don't work
  )

;; python
(leaf python
  :doc "Python's flying circus support for Emacs"
  :tag "builtin"
  :added "2023-01-19"
  :custom (python-indent-guess-indent-offset-verbose . nil)
  :config
  (leaf blacken
    :doc "Reformat python buffers using the black formatter"
    :req "emacs-25.2"
    :tag "emacs>=25.2"
    :url "https://github.com/proofit404/blacken"
    :added "2023-01-19"
    :ensure t
    :custom ((blacken-line-length . 119))
    :hook (python-mode-hook . blacken-mode)
    )

  (leaf poetry
    :doc "Interface to Poetry"
    :req "transient-0.2.0" "pyvenv-1.2" "emacs-25.1"
    :tag "tools" "python" "emacs>=25.1"
    :url "https://github.com/galaunay/poetry.el"
    :added "2023-01-24"
    :ensure t
    :require t
    :custom (poetry-tracking-strategy . 'switch-buffer)
    :hook ((python-mode . poetry-tracking-mode)
           ;; (python-mode . (lambda () ((poetry-venv-workon)))) ; don't work
           )
    )
  )


;; tex
(leaf yatex
  :doc "Yet Another tex-mode for emacs //野鳥//"
  :added "2023-01-19"
  :ensure t
  :require t yatexprc
  :mode "\\.tex$" "\\.sty$" "\\.bbl$"
  :custom ((YaTeX-use-AMS-LaTeX . t)
           (YaTeX-inhibit-prefix-letter . t)
           (tex-command . "latexmk")
           (bibtex-command . "pbibtex")
           (tex-pdfview-command . "xdg-open")
           (YaTeX-electric-indent-mode . t)
           (YaTeX-latex-message-code . 'utf-8)
           (YaTeX-kanji-code . 4)
           (YaTeX-dvi2-command-ext-alist .
            '(("[agx]dvi\\|dviout\\|emacsclient" . ".dvi")
              ("ghostview\\|gv" . ".ps")
              ("acroread\\|pdf\\|Preview\\|TeXShop\\|Skim\\|evince\\|apvlv\\|open" . ".pdf")))
           (dvi2-command . "evince")
           )
  :hook (yatex-mode-hook . turn-on-reftex)
  :preface
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
  )

;; text edit
(leaf *textedit
  :config
  (leaf yasnippet
    :doc "Yet another snippet extension for Emacs"
    :req "cl-lib-0.5"
    :tag "emulation" "convenience"
    :url "http://github.com/joaotavora/yasnippet"
    :added "2023-01-19"
    :ensure t
    :custom ((yas-snippet-dirs . '("~/.emacs.d/snippets"))
             (yas-trigger-key . "TAB"))
    :global-minor-mode yas-global-mode
    )

  (leaf smartparens
    :doc "Automatic insertion, wrapping and paredit-like navigation with user defined pairs."
    :req "dash-2.13.0" "cl-lib-0.3"
    :tag "editing" "convenience" "abbrev"
    :url "https://github.com/Fuco1/smartparens"
    :added "2023-01-19"
    :ensure t
    :require smartparens-config
    :hook (after-init-hook . smartparens-global-mode)
    :custom (electric-pair-mode . nil)
    )

  (leaf mwim
    :doc "Switch between the beginning/end of line or code"
    :tag "convenience"
    :url "https://github.com/alezost/mwim.el"
    :added "2023-01-19"
    :ensure t
    :bind (("C-a" . mwim-beginning)
           ("C-e" . mwim-end))
    )

  (leaf rainbow-delimiters
    :doc "Highlight brackets according to their depth"
    :tag "tools" "lisp" "convenience" "faces"
    :url "https://github.com/Fanael/rainbow-delimiters"
    :added "2023-01-19"
    :ensure t
    :global-minor-mode rainbow-delimiters-mode
    )

  (leaf outline-magic
    :disabled t
    :doc "outline mode extensions for Emacs"
    :tag "outlines"
    :added "2023-01-20"
    :ensure t)

  )

(leaf markdown-mode
  :doc "Major mode for Markdown-formatted text"
  :req "emacs-26.1"
  :tag "itex" "github flavored markdown" "markdown" "emacs>=26.1"
  :url "https://jblevins.org/projects/markdown-mode/"
  :added "2023-01-19"
  :ensure t
  :config
  (leaf markdown-preview-mode
    :doc "markdown realtime preview minor mode."
    :req "emacs-24.4" "websocket-1.6" "markdown-mode-2.0" "cl-lib-0.5" "web-server-0.1.1"
    :tag "convenience" "gfm" "markdown" "emacs>=24.4"
    :url "https://github.com/ancane/markdown-preview-mode"
    :added "2023-01-19"
    :ensure t
    :after websocket markdown-mode web-server
    :custom (markdown-preview-stylesheets . '(list "github.css"))
    )
  )

;; orgmode
(leaf *org
  :config
  (leaf org
    :doc "Outline-based notes management and organizer"
    :tag "builtin"
    :added "2023-01-20"
    :require t reftex reftex-cite ox-latex

    :hook (org-mode-hook . reftex-mode)
    :preface
    (defun get-cite-info-by-reftex ()
      ;; copied from do-reftex-citation from reftex-cite.el
      ;; *from here to
      (let* ((selected-entries (reftex-offer-bib-menu))
             (insert-entries selected-entries)
             entry string cite-view)

        (unless selected-entries (error "Quit"))

        (if (stringp selected-entries)
            ;; Nonexistent entry
            (setq insert-entries (list (list selected-entries
                                             (cons "&key" selected-entries)))
                  selected-entries nil)
          ;; It makes sense to compute the cite-view strings.
          (setq cite-view t))

        (when (eq (car selected-entries) 'concat)
          ;; All keys go into a single command - we need to trick a little
          ;; FIXME: Unfortunately, this means that commenting does not work right.
          (pop selected-entries)
          (let ((concat-keys (mapconcat #'car selected-entries
                                        reftex-cite-key-separator)))
            (setq insert-entries
                  (list (list concat-keys (cons "&key" concat-keys))))))
        ;; *here

        (let ((entry (pop insert-entries)))

          (setq bib_title (reftex-get-bib-field "title" entry)
                bib_author (reftex-get-bib-field "author" entry)
                bib_year (reftex-get-bib-field "year" entry)
                bib_month (reftex-get-bib-field "month" entry)
                bib_journal (reftex-get-bib-field "journal" entry)
                bib_volume (reftex-get-bib-field "volume" entry)
                bib_number (reftex-get-bib-field "number" entry)
                bib_pages (reftex-get-bib-field "pages" entry)
                bib_key (reftex-get-bib-field "&key" entry))
          ))
      )

    (defun paper-with-title-template ()
      (setq bib_title (read-string "Title: "))
      (print (concat "\n\n* " bib_title "\n"
                     ":PROPERTIES:\n"
                     ":CREATED: %<%Y-%m-%d>\n"
                     ":Key:\n"
                     ":Title: " bib_title "\n"
                     ":Authors:\n"
                     ":Journal:\n"
                     ":Year:\n"
                     ":Volume:\n"
                     ":Number:\n"
                     ":Pages:\n"
                     ":END:\n\n"
                     paper-reading-format))
      )

    (defun paper-with-cite-template ()
      (get-cite-info-by-reftex)
      (reftex-kill-temporary-buffers)
      (print (concat "\n\n* " bib_title "\n"
                     ":PROPERTIES:\n"
                     ":CREATED: %<%Y-%m-%d>\n"
                     ":Key: " bib_key "\n"
                     ":Title: " bib_title "\n"
                     ":Authors: " bib_author "\n"
                     ":Journal: " bib_journal "\n"
                     ":Year: " bib_year "\n"
                     ":Volume: " bib_volume "\n"
                     ":Number: " bib_number "\n"
                     ":Pages: " bib_pages "\n"
                     ":END:\n\n"
                     paper-reading-format))
      )

    (defun show-org-buffer (file)
      "Show an org-file FILE on the current buffer."
      (interactive)
      (if (get-buffer file)
          (let ((buffer (get-buffer file)))
            (switch-to-buffer buffer)
            (message "%s" file))
        (find-file (concat org-directory file)))
      )

    (defun org-table-kill-cell ()
      (interactive)
      (when (org-at-table-p)
        (kill-new
         (string-trim (substring-no-properties
                       (org-table-get-field (org-table-current-column) "")))))
      )

    (defun org-scheduled-tomorrow ()
      (interactive)
      (org-schedule nil "+1d")
      )

    ;; paths
    (setq org-directory "~/Documents/org/")
    (setq notes-path (expand-file-name "notes/notes.org" org-directory))
    (setq papers-directory (expand-file-name "papers/" org-directory))
    (setq tde-papers (expand-file-name "tde.org" papers-directory))
    (setq done-list (expand-file-name "notes/done.org" org-directory))

    :custom (
             ;; main
             (org-default-notes-file . "notes.org")
             (org-indent-indentation-per-level . 2)
             (org-indent-mode-turns-on-hiding-stars . nil)
             (org-hide-leading-stars . t)
             (org-startup-indented . t)
             (org-startup-folded . 'showall)
             (org-log-done . 'time)
             (org-enforce-todo-dependencies . t)
             (org-todo-keywords
              . '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "SOMEDAY(s)")))
             (system-time-locale . "C")

             ;; reftex
             (reftex-default-bibliography
              . '("/home/kouei/latex/bib/articles"
                  "/home/kouei/latex/bib/publications"
                  "/home/kouei/latex/bib/read_papers"))

             ;; org-capture
             (org-capture-templates
              . '(
                  ; notes
                  ("n" "📝 Note" entry (file+headline notes-path "Notes")
                   "* %?\nEntered on %U\n %i\n %a")
                  ; org-journal
                  ("j" "📔 Journal entry" plain (function org-journal-find-location)
                   "** %?"
                   :jump-to-captured t :immediate-finish t :empty-lines-before 2)
                  ;; papers
                  ("T" "📄 TDE papers (title)" entry (file tde-papers)
                   (function paper-with-title-template)
                   :jump-to-captured t :immediate-finish t :empty-lines-before 2)
                  ("t" "📄 TDE papers (cite)" entry (file tde-papers)
                   (function paper-with-cite-template)
                   :jump-to-captured t :immediate-finish t :empty-lines-before 2)
                  ))

             ;; org-refile
             (org-refile-targets . '((done-list :maxlevel . 2)))
             )


    :bind (("C-c s" . org-show-subtree)
           ("C-c v" . org-capture)
           (:org-mode-map
            ("M-;" . org-comment-dwim-2)
            ("C-c w" . org-table-kill-cell)
            ("C-c n" . org-next-visible-heading)
            ("C-c C-n" . org-scheduled-tomorrow)
            )
           )
    :config
    (setq paper-reading-format
          (concat "- [[pdf:][PDF]]\n\n"
                  "** Abstract\n- %?\n\n"
                  "** Difference\n- \n\n"
                  "** Core\n- \n\n"
                  "** Results\n- \n\n"
                  "** Discussion\n- \n\n"
                  "** Next [/]\n*** TODO \n")
          )
    (setq org-latex-pdf-process
          '("lualatex --draftmode %f"
            "lualatex %f"))
    (add-to-list 'org-latex-classes
                 '("paper"
                   "
\\documentclass[10pt,a4paper,oneside]{ltjsarticle}
\\usepackage{luatexja-fontspec}
[NO-DEFAULT-PACKAGES]
\\usepackage{graphicx}
\\usepackage{amsmath}
\\usepackage{amsfonts}
\\usepackage{bm}
\\usepackage{siunitx}
\\usepackage{booktabs}
\\usepackage{multirow}
\\usepackage{longtable}
\\usepackage[unicode,hidelinks]{hyperref}
\\input{/home/kouei/latex/preamble/newcommands}
"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
                 )
    (setq org-latex-default-class "paper")
    )

  (leaf org-journal
    :doc "a simple org-mode based journaling mode"
    :req "emacs-25.1" "org-9.1"
    :tag "emacs>=25.1"
    :url "http://github.com/bastibe/org-journal"
    :added "2023-01-20"
    :ensure t
    :after org
    )
  )

;; pdf
(leaf pdf-tools
  :doc "Support library for PDF documents"
  :req "emacs-26.3" "tablist-1.0" "let-alist-1.0.4"
  :tag "multimedia" "files" "emacs>=26.3"
  :url "http://github.com/vedang/pdf-tools/"
  :added "2023-01-31"
  :emacs>= 26.3
  :ensure t
  :after tablist
  :hook ((pdf-view-mode-hook . pdf-tools-enable-minor-modes)
         (pdf-view-mode-hook . auto-revert-mode))
  :config
  (pdf-loader-install)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
  )


;; theme
(leaf *theme
  :init
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
  (setq custom-theme-directory (concat user-emacs-directory "themes/"))
  :config
  (leaf solarized-theme
    :doc "The Solarized color theme"
    :req "emacs-24.1"
    :tag "solarized" "themes" "convenience" "emacs>=24.1"
    :url "http://github.com/bbatsov/solarized-emacs"
    :added "2023-01-19"
    :ensure t
    :require t
    )

  (leaf *load-theme
    :after solarized-theme
    :config
    (load-theme 'my-dark-transparent t)
    )
  )

;; misc
(leaf *misc
  :config
  (leaf beacon
    :doc "Highlight the cursor whenever the window scrolls; never lose your cursor again"
    :req "emacs-25.1"
    :tag "convenience" "emacs>=25.1"
    :url "https://github.com/Malabarba/beacon"
    :added "2023-01-18"
    :ensure t
    :global-minor-mode beacon-mode
    )

  (leaf rainbow-mode
    :doc "Colorize color names in buffers"
    :tag "faces"
    :url "https://elpa.gnu.org/packages/rainbow-mode.html"
    :added "2023-01-19"
    :ensure t)

  (leaf *show-startup-time
    :hook
    (emacs-startup-hook
     . (lambda ()
         (message "init time: %.3f sec"
                  (float-time (time-subtract after-init-time before-init-time)))))
    )

  (leaf wakatime-mode
    :doc "Automatic time tracking extension for WakaTime"
    :tag "comm" "calendar"
    :added "2023-02-07"
    :ensure t
    :config
    (global-wakatime-mode)
    )
  )

(leaf image+
  :doc "Image manipulate extensions for Emacs"
  :req "cl-lib-0.3"
  :tag "extensions" "multimedia"
  :url "https://github.com/mhayashi1120/Emacs-imagex"
  :added "2023-01-19"
  :ensure t)


(leaf csv-mode
  :doc "Major mode for editing comma/char separated values"
  :req "emacs-27.1" "cl-lib-0.5"
  :tag "convenience" "emacs>=27.1"
  :url "https://elpa.gnu.org/packages/csv-mode.html"
  :added "2023-01-19"
  :ensure t
  :bind (("C-c C-f" . forward-sexp)
         ("C-c C-b" . backward-sexp)
         ("C-c C-k" . kill-sexp))
  )

(leaf yaml-mode
  :doc "Major mode for editing YAML files"
  :req "emacs-24.1"
  :tag "yaml" "data" "emacs>=24.1"
  :url "https://github.com/yoshiki/yaml-mode"
  :added "2023-01-19"
  :ensure t)

(leaf *web
  :config
  (leaf web-mode
    :doc "major mode for editing web templates"
    :req "emacs-23.1"
    :tag "languages" "emacs>=23.1"
    :url "https://web-mode.org"
    :added "2023-01-19"
    :ensure t
    :mode "\\.html$"
    :custom ((web-mode-markup-indent-offset . 2)
             (web-mode-style-padding . 2)
             (web-mode-css-indent-offset . 2)
             (web-mode-code-indent-offset . 2)
             (web-mode-enable-auto-closing . t)
             (web-mode-enable-auto-pairing . t)
             (web-mode-auto-close-style . 2))
    )

  (leaf jinja2-mode
    :doc "A major mode for jinja2"
    :added "2023-01-19"
    :ensure t)
  )

(leaf *misc-functions
  :config
  (leaf another-line
    :url "https://www.emacswiki.org/emacs/ReplaceCount"
    :preface
    (defun another-line (num-lines)
      "Copies line, preserving cursor column, and increments any numbers found.
       Copies a block of optional NUM-LINES lines.  If no optional argument is given,
       then only one line is copied."
      (interactive "p")
      (if (not num-lines) (setq num-lines 0) (setq num-lines (1- num-lines)))
      (let* ((col (current-column))
	         (bol (save-excursion (forward-line (- num-lines)) (beginning-of-line) (point)))
	         (eol (progn (end-of-line) (point)))
	         (line (buffer-substring bol eol)))
        (goto-char bol)
        (while (re-search-forward "[0-9]+" eol 1)
          (let ((num (string-to-number (buffer-substring
				                        (match-beginning 0) (match-end 0)))))
	        (replace-match (number-to-string (1+ num))))
          (setq eol (save-excursion (goto-char eol) (end-of-line) (point))))
        (goto-char bol)
        (insert line "\n")
        (move-to-column col)))
    :bind ("M-o" . another-line)
    )

  (leaf align-regexp-repeated
    (defun align-regexp-repeated (start stop regexp)
      "Like align-regexp, but repeated for multiple columns. See http://www.emacswiki.org/emacs/AlignCommands"
      (interactive "r\nsAlign regexp: ")
      (let ((spacing 1)
            (old-buffer-size (buffer-size)))
        ;; If our align regexp is just spaces, then we don't need any
        ;; extra spacing.
        (when (string-match regexp " ")
          (setq spacing 0))
        (align-regexp start stop
                      ;; add space at beginning of regexp
                      (concat "\\([[:space:]]*\\)" regexp)
                      1 spacing t)
        ;; modify stop because align-regexp will add/remove characters
        (align-regexp start (+ stop (- (buffer-size) old-buffer-size))
                      ;; add space at end of regexp
                      (concat regexp "\\([[:space:]]*\\)")
                      1 spacing t)))
    )

  (defun open-externally (filename)
    (interactive "fOpen externally: ")
    (let ((process-connection-type nil))
      (start-process-shell-command "open-externally" nil (concat "xdg-open " filename)))
    )

  (defun open-current-directory ()
    (interactive)
    (let ((process-connection-type nil))
      (start-process-shell-command "open-current-directory" nil (concat "xdg-open " default-directory)))
    )

  (leaf delete-file-if-no-content
    :preface
    (defun ky/delete-file-if-no-contents ()
      (when (and (buffer-file-name (current-buffer))
                 (= (point-min) (point-max)))
        (delete-file
         (buffer-file-name (current-buffer)))))
    :hook (after-save-hook . ky/delete-file-if-no-contents)
    )

  (leaf open-org-files
    :preface
    (defun memo ()
      (interactive)
      (find-file "~/Documents/org/notes/memo.org"))
    (defun notes ()
      (interactive)
      (find-file "~/Documents/org/notes/notes.org"))
    (defun todo ()
      (interactive)
      (find-file "~/Documents/org/notes/todo.org"))
    )
  )
