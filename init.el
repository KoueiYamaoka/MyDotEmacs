;;;;; init.el -- my emacs init file
;;; Commentary:
;;; Code:

;; byte compile
; (byte-compile-file (expand-file-name "~/.emacs.d/init.el") 0)

;; for faster loading
; temporary disabled Magic File Name
(defconst my-saved-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

;; native-comp
(with-eval-after-load 'comp
  (setq native-comp-async-jobs-number 8)
  (setq native-comp-speed 3)
  (setq native-comp-async-report-warnings-errors nil))
(native-compile-async "~/.emacs.d/init.el")
(native-compile-async "~/.emacs.d/early-init.el")
(native-compile-async "~/.emacs.d/el-get" 'recursively)
(native-compile-async "~/.emacs.d/elpa" 'recursively)

;; load local_custom, including api keys
(load "~/.emacs.d/local_custom")

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


;; ----------------------------
;;    Generic Configurations
;; ----------------------------

;; builtin functions
(leaf *builtins
  :config
  ;; Avoid custom adding configs to init.el automatically
  (leaf cus-edit
    :doc "tools for customizing Emacs and Lisp packages"
    :tag "builtin" "faces" "help"
    :custom `((custom-file . ,(locate-user-emacs-file "custom.el")))
    )

  (leaf cus-start
    :doc "define customization properties of builtins"
    :tag "builtin" "internal"
    :custom ((shell-file-name . "/bin/zsh")
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
    :custom ((uniquify-buffer-name-style . 'post-forward-angle-brackets))
    )

  (leaf elec-pair
    :doc "Automatic parenthesis pairing"
    :tag "builtin"
    :custom (electric-pair-mode . t)
    )

  (leaf midnight
    :doc "run something every midnight, e.g., kill old buffers"
    :tag "builtin"
    :hook (emacs-startup-hook)
    )

  (leaf cua-base
    :doc "emulate CUA key bindings"
    :tag "builtin"
    :require t
    :commands cua-mode
    :custom ((cua-enable-cua-keys . nil))
    :bind ("C-x 2" . cua-set-rectangle-mark)
    :config
    (cua-mode 1)
    (leaf-keys ((:cua-global-keymap ("C-<return>" . nil))))
    )

  (leaf linum
    :doc "display line numbers in the left margin"
    :tag "builtin"
    :bind ([f6] . display-line-numbers-mode)
    :custom (linum-format . "%3d")
    )

  (leaf *spellcheck
    :config
    (leaf ispell
      :doc "interface to spell checkers"
      :tag "builtin"
      :custom (ispell-program-name . "aspell")
      :config
      ; use spell check even if there are several Japanese
      (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
      )

    (leaf flyspell
      :doc "On-the-fly spell checker"
      :tag "builtin"
      :hook ((emacs-lisp-mode-hook . flyspell-prog-mode)
             (python-mode-hook . flyspell-prog-mode)
             yatex-mode-hook text-mode-hook))
    )

  (leaf *clipboard
    :doc "share the clipboard with OS X window"
    :custom ((x-select-enable-clipboard . t))
             ;; (interprogram-paste-function . 'x-get-selection-value))
    )
  )

(leaf leaf
  :config
  (leaf leaf-tree :ensure t)
  (leaf leaf-convert :ensure t)
  )

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand))
  )

(leaf *keybindings
  :preface
  (defun delete-word (arg)
    (interactive "p")
    (delete-region (point) (progn (forward-word arg) (point)))
    )

  :bind (("C-d" . delete-word)
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
         ("C-h" . delete-backward-char)
         ("C-x C-j"))

  ;; :config
  ;; (define-key key-translation-map [?\C-h] [?\C-?])
  )

(leaf *coding-system
  :doc "Use UTF-8"
  :config
  (set-language-environment "Japanese")
  (prefer-coding-system          'utf-8-unix)
  (set-default-coding-systems    'utf-8-unix)
  (set-selection-coding-system   'utf-8-unix)
  (set-buffer-file-coding-system 'utf-8-unix)
  )

(leaf mozc
  :doc "minor mode to input Japanese with Mozc"
  :req "emacs-24.3"
  :emacs>= 24.3
  :ensure t
  :require t
  :config
  (add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-mozc")
  (setq default-input-method "japanese-mozc")
  (setq mozc-candidate-style 'echo-area)
  )

(leaf font
  :doc "Font settings"
  :config
  (custom-set-faces
   '(default ((t (:family "HackGen" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))
  ;; Font Size checker
  ;;
  ;; |∞≤≥ ∏∑∫ ×±⊆⊇|
  ;; |αβγ δεζ ηθικλu|
  ;; |abcdef ghijkl|
  ;; |ABCDEF GHIJKL|
  ;; |'";:-+ =/\~`?|
  ;; |日本語 の美観|
  ;; |あいう えおか|
  ;; |アイウ エオカ|
  ;; |ｱｲｳｴｵｶ ｷｸｹｺｻｼ|
)

;;;; packages
;; system
(leaf no-littering
  :doc "Help keeping ~/.config/emacs clean"
  :url "https://github.com/emacscollective/no-littering"
  :emacs>= 25.1
  :ensure t
  :after compat
  )


(leaf *undo-tools
  :config
  (leaf undo-tree
    :doc "Treat undo history as a tree"
    :req "queue-0.2" "emacs-24.3"
    :url "https://www.dr-qubit.org/undo-tree.html"
    :ensure t
    :bind (("C-x u" . undo-tree-visualize))
    :custom ((undo-tree-history-directory-alist . '(("." . "~/.emacs.d/undotree")))
             (undo-tree-visualizer-diff . t)
             (undo-tree-auto-save-history . t)
             )
    :config
    (global-undo-tree-mode)
    )
  )

(leaf vterm
  :doc "Fully-featured terminal emulator"
  :req "emacs-25.1"
  :url "https://github.com/akermu/emacs-libvterm"
  :ensure t
  :require t
  :hook (vterm-mode-hook . (lambda() (setq show-trailing-whitespace nil)))
  :preface
  (defun ky/vterm-send-kill-line ()
    "Send `C-k' to libvterm."
    (interactive)
    (kill-ring-save (point) (vterm-end-of-line))
    (vterm-send-key "k" nil nil t))

  :bind ((:vterm-mode-map("C-h" . vterm-send-backspace)
                         ("C-d" . delete-word)
                         ("C-o" . other-window)
                         ("C-y" . vterm-yank)
                         ("C-k" . ky/vterm-send-kill-line)))
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
  :url "https://github.com/minad/vertico"
  :ensure t
  :global-minor-mode vertico-mode
  :config
  (leaf savehist
    :doc "Save minibuffer history"
    :tag "builtin"
    :init (savehist-mode)
    )

  (leaf vertico-directory
    :doc "Ido-like directory navigation for Vertico"
    :req "emacs-27.1" "vertico-1.0"
    :tag "out-of-MELPA"
    :url "https://github.com/minad/vertico"
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
    :tag "extensions"
    :url "https://github.com/oantolin/orderless"
    :ensure t
    :custom ((completion-styles . '(orderless)))
    )

  (leaf marginalia
    :doc "Enrich existing commands with completion annotations"
    :req "emacs-27.1" "compat-29.1.1.1"
    :url "https://github.com/minad/marginalia"
    :ensure t
    :global-minor-mode marginalia-mode
    )

  (leaf consult
    :doc "Consulting completing-read"
    :req "emacs-27.1" "compat-29.1.1.1"
    :url "https://github.com/minad/consult"
    :ensure t
    :bind (("C-x j" . consult-goto-line))
    )
  )

(leaf company
  :doc "Modular text completion framework"
  :req "emacs-25.1"
  :tag "matching" "convenience" "abbrev"
  :url "http://company-mode.github.io/"
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
    :tag "quickhelp" "documentation" "popup" "company"
    :url "https://www.github.com/expez/company-quickhelp"
    :ensure t
    :after company pos-tip
    :global-minor-mode company-quickhelp-mode
    :config
    (leaf company-quickhelp-terminal
      :doc "Terminal support for company-quickhelp"
      :req "emacs-24.4" "company-quickhelp-2.2.0" "popup-0.5.3"
      :tag "help" "tip" "support" "extends" "terminal" "convenience"
      :url "https://github.com/jcs-elpa/company-quickhelp-terminal"
      :ensure t
      :after company-quickhelp)
    )

  (leaf company-wordfreq
    :doc "Company backend for human language texts"
    :req "emacs-27.1" "company-0.9"
    :tag "matching" "convenience" "company"
    :url "https://github.com/johannes-mueller/company-wordfreq.el"
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
  :if (executable-find "cmigemo")
  :ensure t
  :custom ((migemo-command . "cmigemo")
           (migemo-options . '("-q" "--emacs"))
           (migemo-dictionary . user-migemo-dictionary)
           (migemo-user-dictionary . nil)
           (migemo-regex-dictionary . nil)
           (migemo-coding-system  . 'utf-8-unix)
           (migemo-isearch-min-length . 2))
  :preface
  (defun my-toggle-migemo-isearch-enable ()
    (cond
     ((eq (length isearch-string) 0) 'ignore)
     ((< (length isearch-string) migemo-isearch-min-length) (setq migemo-isearch-enable-p nil))
     ((eq (length isearch-string) migemo-isearch-min-length) (setq migemo-isearch-enable-p t)))
    )

  :hook ((emacs-startup-hook . migemo-init)
         (isearch-update-post-hook . my-toggle-migemo-isearch-enable))
  )

(leaf anzu
  :doc "Show number of matches in mode-line while searching"
  :req "emacs-25.1"
  :url "https://github.com/emacsorphanage/anzu"
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
  :tag "convenience"
  :url "https://depp.brause.cc/shackle"
  :ensure t
  :custom ((shackle-rules . '((compilation-mode :align below :ratio 0.2)
	                         ("*Help*" :align right)
	                         ("*Warnings*" :align below :ratio 0.2)
	                         ("*Google Translate*" :align below :ratio 0.3)
	                         ("*Python*" :align right :ratio 0.5)
	                         ("*Python3*" :align right :ratio 0.5)
	                         ("*quickrun*" :align right :ratio 0.4)
	                         (YaTeX-typeset-buffer :align below :ratio 0.2)))
           (shackle-lighter . ""))
  :config (shackle-mode 1)
  )

(leaf *AI-tools
  :config
  (leaf google-translate
    :doc "Emacs interface to Google Translate"
    :req "emacs-24.3" "popup-0.5.8"
    :tag "convenience"
    :url "https://github.com/atykhonov/google-translate"
    :ensure t
    :commands google-translate-translate
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
    :tag "tools"
    :url "https://github.com/emacsorphanage/quickrun"
    :ensure t
    :bind (("C-c c" . quickrun)
           ("C-c a c" . quickrun-with-arg))
    )

  (leaf highlight-symbol
    :doc "automatic and manual symbol highlighting"
    :tag "matching" "faces"
    :url "http://nschum.de/src/emacs/highlight-symbol/"
    :ensure t
    :custom ((highlight-symbol-idle-delay . 0.2)
             (highlight-symbol-colors . '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1")))
    :hook ((prog-mode-hook . highlight-symbol-nav-mode)
           prog-mode-hook html-mode-hook)
    )

  (leaf highlight-indent-guides
    :doc "Minor mode to highlight indentation"
    :req "emacs-24.1"
    :url "https://github.com/DarthFennec/highlight-indent-guides"
    :disabled t
    :ensure t
    :commands highlight-indent-guides--highlighter-default
    :hook (python-mode-hook python-ts-mode-hook html-mode-hook)
    :preface
    (defun my-highlighter (level responsive display)
      (if (> 1 level)
          nil
        (highlight-indent-guides--highlighter-default level responsive display)))

    :custom ((highlight-indent-guides-method . 'character)
             (highlight-indent-guides-character . ?|)
             (highlight-indent-guides-auto-enabled . nil)
             (highlight-indent-guides-highlighter-function . 'my-highlighter)
             (highlight-indent-guides-responsive . 'stack))

    :config
    (set-face-foreground 'highlight-indent-guides-character-face "#bbffff")
    (set-face-foreground 'highlight-indent-guides-top-character-face "green")
    (set-face-foreground 'highlight-indent-guides-stack-character-face "DeepSkyBlue")
    )


  (leaf treesit
    :doc "tree-sitter utilities"
    :tag "builtin" "languages" "tree-sitter" "treesit"
    :emacs>= 29.0
    :custom (treesit-font-lock-level . 3)
    :config
    (leaf treesit-auto
      :doc "Automatically use tree-sitter enhanced major modes"
      :req "emacs-29.0"
      :tag "convenience" "fallback" "mode" "major" "automatic" "auto" "treesitter"
      :url "https://github.com/renzmann/treesit-auto.git"
      :ensure t
      :require t
      :custom (treesit-auto-install . 'prompt)
      :config (global-treesit-auto-mode)
      )
    )

  (leaf comment-dwim-2
    :doc "An all-in-one comment command to rule them all"
    :req "emacs-24.4"
    :tag "convenience"
    :url "https://github.com/remyferre/comment-dwim-2"
    :bind (("M-;" . comment-dwim-2))
    :ensure t
    :after org
    )

  (leaf flymake
    :doc "A universal on-the-fly syntax checker"
    :tag "builtin"
    :added "2024-05-30"
    :config
    (setq flymake-max-parallel-syntax-checks nil)
    (setq temporary-file-directory "~/.emacs.d/tmp/")
    (setq flymake-number-of-errors-to-display 4)
    )

  (leaf flymake-ruff
    :doc "A flymake plugin for python files using ruff"
    :req "emacs-26.1" "project-0.3.0"
    :url "https://github.com/erickgnavar/flymake-ruff"
    :ensure t
    :after project
    :hook (eglot-managed-mode-hook . (lambda ()
                                       (when (derived-mode-p 'python-mode 'python-ts-mode)
                                         (flymake-ruff-load)))
                                   )
    :config
    (setq flymake-ruff--default-configs '("ruff.toml" ".ruff.toml"))
    )

  (leaf reformatter
    :doc "Define commands which run reformatters on the current buffer"
    :req "emacs-24.3"
    :tag "tools" "convenience" "emacs>=24.3"
    :url "https://github.com/purcell/emacs-reformatter"
    :ensure t
    :hook ((python-ts-mode-hook . ruff-format-on-save-mode)
           (python-ts-mode-hook . isort-format-on-save-mode))
    :config
    ;; ruff
    (reformatter-define ruff-format
      :program "ruff"
      :args (list "format" "--stdin-filename" (or (buffer-file-name) input-file))
      )
    ;; isort
    (reformatter-define isort-format
      :program "isort"
      :args '("--stdout" "--atomic" "-"))
    )
  )

;; lsp
(leaf eglot
  :doc "The Emacs Client for LSP servers"
  :req "emacs-26.3" "jsonrpc-1.0.14" "flymake-1.2.1" "project-0.3.0" "xref-1.0.1" "eldoc-1.11.0" "seq-2.23"
  :tag "languages" "convenience"
  :url "https://github.com/joaotavora/eglot"
  :ensure t
  :commands eglot-ensure
  :after jsonrpc flymake project xref eldoc
  :hook ((python-base-mode-hook . eglot-ensure))
  :custom (eldoc-echo-area-use-multiline-p . nil)
  :config
  (add-to-list 'eglot-server-programs '(python-base-mode "pylsp"))
  ;; (add-hook 'python-mode-hook (lambda () (add-hook 'before-save-hook 'eglot-format-buffer))) ; don't work
  )

;; python
(leaf python
  :doc "Python's flying circus support for Emacs"
  :tag "builtin"
  :custom (python-indent-guess-indent-offset-verbose . nil)
  :config
  (leaf blacken
    :doc "Reformat python buffers using the black formatter"
    :req "emacs-25.2"
    :url "https://github.com/proofit404/blacken"
    :ensure t
    :custom ((blacken-line-length . 119)
             (blacken-executable . "/home/kouei/.pyenv/shims/black"))
    :hook (python-mode-hook)
    )

  (leaf poetry
    :doc "Interface to Poetry"
    :req "transient-0.2.0" "pyvenv-1.2" "emacs-25.1"
    :tag "tools" "python"
    :url "https://github.com/galaunay/poetry.el"
    :ensure t
    ;; :commands poetry-tracking-mode
    :custom (poetry-tracking-strategy . 'switch-buffer)
    :hook ((python-mode-hook . poetry-tracking-mode)
           (python-ts-mode-hook . poetry-tracking-mode))
    )
  )

;; tex
(leaf *latex
  (leaf bibtex
    :doc "BibTeX mode for GNU Emacs"
    :tag "builtin"
    :config
    (add-hook 'TeX-mode-hook
          #'(lambda ()
              (setq bibtex-comment-start "%")
              )
          )
    )

  :config
  (leaf yatex
    :doc "Yet Another tex-mode for emacs //野鳥//"
    :el-get KoueiYamaoka/yatex
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
             (YaTeX-use-hilit19 . nil)
             )
    :hook ((yatex-mode-hook . turn-on-reftex)
           (yatex-mode-hook . set-my-yatex-font-locks)
           )
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

    ;; font-lock
    (defun set-my-yatex-font-locks ()
      (font-lock-add-keywords 'yatex-mode
                              '(("\\\\plabel{.+?}" . YaTeX-font-lock-crossref-face)
                                ("\\\\plabel\\[.+?\\]{.+?}" . YaTeX-font-lock-crossref-face)
                                ("\\\\Ref{.+?}" . YaTeX-font-lock-crossref-face)
                                ("\\\\Cref{.+?}" . YaTeX-font-lock-crossref-face)
                                ("\\\\gls.*?{.+?}" . YaTeX-font-lock-label-face)
                                ("\\\\Gls.*?{.+?}" . YaTeX-font-lock-label-face)
                                ("\\\\\\(Hz\\|kHz\\|m\\|cm\\|h\\|mins\\|s\\|ms\\|dB\\|pct\\){.+?}" . YaTeX-font-lock-formula-face)
                                ("\\\\text.*?{.+?}" . YaTeX-font-lock-declaration-face)
                                ("\\\\ulbf.*?{.+?}" . YaTeX-font-lock-declaration-face)
                                ("\\\\etal" . YaTeX-font-lock-declaration-face)
                                ("\\\\ftn.*?( \\|\\.)" . YaTeX-font-lock-declaration-face)
                                ("\\\\mtdnm{.+?}" . font-lock-keyword-face)
                                ("``\\(.*?\\)''" . font-lock-string-face)

                                )
                              )
      )
    ) ; yatex-mode ends here

  (leaf reftex
    :doc "minor mode for doing \\label, \\ref, \\cite, \\index in LaTeX"
    :tag "builtin"
    :config
    (setq reftex-default-bibliography
          '("/home/kouei/latex/bib/articles"
            "/home/kouei/latex/bib/publications"
            "/home/kouei/latex/bib/read_papers")
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
    :ensure t
    :custom ((yas-snippet-dirs . '("~/.emacs.d/snippets"))
             (yas-trigger-key . "TAB"))
    :config
    (yas-global-mode 1)
    )

  (leaf smartparens
    :doc "Automatic insertion, wrapping and paredit-like navigation with user defined pairs."
    :req "dash-2.13.0" "cl-lib-0.3"
    :tag "editing" "convenience" "abbrev"
    :url "https://github.com/Fuco1/smartparens"
    :ensure t
    :require smartparens-config
    :hook (after-init-hook . smartparens-global-mode)
    :custom (electric-pair-mode . nil)
    )

  (leaf mwim
    :doc "Switch between the beginning/end of line or code"
    :tag "convenience"
    :url "https://github.com/alezost/mwim.el"
    :ensure t
    :bind (("C-a" . mwim-beginning)
           ("C-e" . mwim-end))
    )

  (leaf rainbow-delimiters
    :doc "Highlight brackets according to their depth"
    :tag "tools" "lisp" "convenience" "faces"
    :url "https://github.com/Fanael/rainbow-delimiters"
    :ensure t
    :hook (prog-mode-hook)
    )

  (leaf outline-magic
    :disabled t
    :doc "outline mode extensions for Emacs"
    :tag "outlines"
    :ensure t)

  )

(leaf *git
  :config
  (leaf magit
    :doc "A Git porcelain inside Emacs."
    :req "emacs-25.1" "compat-29.1.3.4" "dash-20221013" "git-commit-20230101" "magit-section-20230101" "transient-20230201" "with-editor-20230118"
    :tag "vc" "tools" "git"
    :url "https://github.com/magit/magit"
    :emacs>= 25.1
    :ensure t
    :after compat git-commit magit-section with-editor
    :bind ("C-x g" . magit-status)
    )
  )

(leaf markdown-mode
  :doc "Major mode for Markdown-formatted text"
  :req "emacs-26.1"
  :tag "itex" "github flavored markdown" "markdown"
  :url "https://jblevins.org/projects/markdown-mode/"
  :ensure t
  :config
  (leaf markdown-preview-mode
    :doc "markdown realtime preview minor mode."
    :req "emacs-24.4" "websocket-1.6" "markdown-mode-2.0" "cl-lib-0.5" "web-server-0.1.1"
    :tag "convenience" "gfm" "markdown"
    :url "https://github.com/ancane/markdown-preview-mode"
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
    :require t reftex reftex-cite ox-latex

    :hook (org-mode-hook . reftex-mode)
    :preface
    ;; variables
    (defvar ky/bib_title)
    (defvar ky/bib_author)
    (defvar ky/bib_year)
    (defvar ky/bib_month)
    (defvar ky/bib_journal)
    (defvar ky/bib_volume)
    (defvar ky/bib_number)
    (defvar ky/bib_pages)
    (defvar ky/bib_key)
    (defvar ky/review-local-file)

    ;; paths
    (defvar org-directory "~/Documents/org/")
    (defvar notes-directory "~/Documents/org/notes/")
    (defvar notes-path (expand-file-name "notes.org" notes-directory))
    (defvar todo-path (expand-file-name "todo.org" notes-directory))
    (defvar papers-directory (expand-file-name "papers/" org-directory))
    (defvar tde-papers (expand-file-name "tde.org" papers-directory))
    (defvar done-list (expand-file-name "done.org" notes-directory))

    ;; reftex
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

          (setq ky/bib_title (reftex-get-bib-field "title" entry)
                ky/bib_author (reftex-get-bib-field "author" entry)
                ky/bib_year (reftex-get-bib-field "year" entry)
                ky/bib_month (reftex-get-bib-field "month" entry)
                ky/bib_journal (reftex-get-bib-field "journal" entry)
                ky/bib_volume (reftex-get-bib-field "volume" entry)
                ky/bib_number (reftex-get-bib-field "number" entry)
                ky/bib_pages (reftex-get-bib-field "pages" entry)
                ky/bib_key (reftex-get-bib-field "&key" entry))
          ))
      )

    ;; org-capture
    (defvar paper-reading-format
          (concat "- [[pdf:][PDF]]\n\n"
                  "** Abstract\n- %?\n\n"
                  "** Difference\n- \n\n"
                  "** Core\n- \n\n"
                  "** Results\n- \n\n"
                  "** Discussion\n- \n\n"
                  "** Next [/]\n*** TODO \n")
          )

    (defun paper-with-title-template ()
      (setq ky/bib_title (read-string "Title: "))
      (print (concat "\n\n* " ky/bib_title "\n"
                     ":PROPERTIES:\n"
                     ":CREATED: %<%Y-%m-%d>\n"
                     ":Key:\n"
                     ":Title: " ky/bib_title "\n"
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
      (print (concat "\n\n* " ky/bib_title "\n"
                     ":PROPERTIES:\n"
                     ":CREATED: %<%Y-%m-%d>\n"
                     ":Key: " ky/bib_key "\n"
                     ":Title: " ky/bib_title "\n"
                     ":Authors: " ky/bib_author "\n"
                     ":Journal: " ky/bib_journal "\n"
                     ":Year: " ky/bib_year "\n"
                     ":Volume: " ky/bib_volume "\n"
                     ":Number: " ky/bib_number "\n"
                     ":Pages: " ky/bib_pages "\n"
                     ":END:\n\n"
                     paper-reading-format))
      )

    (defun review-template ()
      (setq ky/review-local-file (read-string "Path: "))
      (make-directory (concat org-directory "notes/review/" ky/review-local-file))
      (print (concat "*** TODO %?\n"
                     ":PROPERTIES:\n"
                     ":SOCIETY:\n"
                     ":TYPE:\n"
                     ":URL:\n"
                     ":LOCAL: ./review/" ky/review-local-file "\n"
                     ":FILE: [[./review/" ky/review-local-file "/paper.pdf]]\n"
                     ":END:"
                     ))
      )

    ;; others
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
             (org-startup-truncated . nil)
             (org-todo-keywords
              . '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)" "SOMEDAY(s)")))
             (system-time-locale . "C")

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
                  ("r" "Review" entry (file+headline todo-path "Review")
                   (function review-template)
                   :jump-to-captured t :empty-lines 3 :empty-lines-before 2)
                  ))

             ;; org-refile
             (org-refile-targets . '((done-list :maxlevel . 2)))
             )


    :bind (("C-c s" . org-fold-show-subtree)
           ("C-c v" . org-capture)
           (:org-mode-map
            ("M-;" . org-comment-dwim-2)
            ("C-<return>" . org-insert-heading)
            ("C-c w" . org-table-kill-cell)
            ("C-c n" . org-next-visible-heading)
            ("C-c C-n" . org-scheduled-tomorrow)
            )
           )
    :config
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

    (add-to-list 'org-latex-classes
                 '("beamer"
                   "\\documentclass[dvipdfmx,presentation]{beamer}
               [NO-DEFAULT-PACKAGES] [PACKAGES] [EXTRA]"
                   ("\\section\{%s\}" . "\\section*\{%s\}")
                   ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
                   ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}"))
                 )

    (setq org-latex-default-class "paper")
    )

  (leaf org-journal
    :doc "a simple org-mode based journaling mode"
    :req "emacs-25.1" "org-9.1"
    :url "http://github.com/bastibe/org-journal"
    :ensure t
    :after org
    )

  (leaf org-agenda
    :doc "Dynamic task and appointment lists for Org"
    :tag "builtin" "wp" "calendar" "hypermedia" "outlines"
    :url "https://orgmode.org"
    :custom (org-agenda-restore-windows-after-quit . t)
    :config
    ;; (custom-set-variables '(org-agenda-files (list org-directory)))
    (custom-set-variables '(org-agenda-files (list notes-directory)))
    (custom-set-variables '(org-agenda-custom-commands
                            '(("c" "Custom agenda, ignore DONE tag"
                               ((agenda ""))
                               ((org-agenda-tag-filter-preset '("-DONE"))))))
                          )
    (leaf-keys (("C-c C-a" . org-agenda)))
    )

  (leaf ox-gfm
    :doc "Github Flavored Markdown Back-End for Org Export Engine"
    :tag "github" "markdown" "wp" "org"
    :ensure t
    :after org)
  ) ; org-mode ends here

;; pdf
(leaf pdf-tools
  :doc "Support library for PDF documents"
  :req "emacs-26.3" "tablist-1.0" "let-alist-1.0.4"
  :tag "multimedia" "files"
  :url "http://github.com/vedang/pdf-tools/"
  :emacs>= 26.3
  :ensure t
  :disabled t
  :after tablist
  :hook ((pdf-view-mode-hook . pdf-tools-enable-minor-modes)
         (pdf-view-mode-hook . auto-revert-mode))
  :config
  (pdf-loader-install)
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode))
  )

;; secretary
(leaf *secretary
  :config
  (leaf *myreminder
    :bind ("C-c m" . ky/set-reminder-from-text)
    :preface
    (defun ky/notify (title msg time)
      (interactive)
      (shell-command-to-string
       (concat
        "echo \"notify-send '"
        (mapconcat #'shell-quote-argument
                   (list title msg)
                   "' '")
        "' -i "
        (concat (car image-load-path) "icons/hicolor/128x128/apps/emacs.png")
        "\" | at "
        (shell-quote-argument time)
        )
       )
      (message (concat "Set reminder " (string-trim msg) " at " (string-trim time)))
      )

    (defun ky/reminder (msg time)
      (interactive)
      (ky/notify "Reminder" msg time)
      )

    (defun ky/set-reminder-from-text ()
      "usage: title@time-of-remind"
      (interactive)
      (if (region-active-p)
          (let* ((instring (buffer-substring (region-beginning) (region-end)))
                 (msg (car (split-string instring "@")))
                 (time (car (cdr (split-string instring "@"))))
                 )
            (ky/reminder msg (compute-time-subtraction time 5))
            (ky/reminder msg (compute-time-subtraction time 10))
            )
        (message "Empty region")))

    )
  )


;; theme
(leaf *theme
  :config
  (add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
  (setq custom-theme-directory (concat user-emacs-directory "themes/"))

  (leaf solarized-theme
    :doc "The Solarized color theme"
    :req "emacs-24.1"
    :tag "solarized" "themes" "convenience"
    :url "http://github.com/bbatsov/solarized-emacs"
    :ensure t
    :require t ; need
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
    :tag "convenience"
    :url "https://github.com/Malabarba/beacon"
    :ensure t
    :config (beacon-mode 1)
    )

  (leaf rainbow-mode
    :doc "Colorize color names in buffers"
    :tag "faces"
    :url "https://elpa.gnu.org/packages/rainbow-mode.html"
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
  :ensure t)


(leaf csv-mode
  :doc "Major mode for editing comma/char separated values"
  :req "emacs-27.1" "cl-lib-0.5"
  :tag "convenience"
  :url "https://elpa.gnu.org/packages/csv-mode.html"
  :ensure t
  :bind (("C-c C-f" . forward-sexp)
         ("C-c C-b" . backward-sexp)
         ("C-c C-k" . kill-sexp))
  )

(leaf yaml-mode
  :doc "Major mode for editing YAML files"
  :req "emacs-24.1"
  :tag "yaml" "data"
  :url "https://github.com/yoshiki/yaml-mode"
  :ensure t)

(leaf *web
  :config
  (leaf web-mode
    :doc "major mode for editing web templates"
    :req "emacs-23.1"
    :tag "languages"
    :url "https://web-mode.org"
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
    :preface
    (defun align-regexp-repeated (start stop regexp)
      "Like align-regexp, but repeated for multiple columns. See http://www.emacswiki.org/emacs/AlignCommands"
      (interactive "r\nsAlign regexp: ")
      (let ((spacing 1)
            (old-buffer-size (buffer-size)))
        ;; If our align regexp is just spaces, then we don't need any extra spacing.
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

  ;; https://www.emacswiki.org/emacs/InsertFileName
  (defun insert-filename (filename &optional args)
    (interactive "*fInsert file name: \nP")
    (cond ((eq '- args)
           (insert (expand-file-name filename)))
          ((not (null args))
           (insert filename))
          (t
           (insert (file-relative-name filename))))
    )

  ;; 選択範囲を計算してバッファに出力
  ;; gist-id: b967d6a7441f85aa541d
  ;; gist-name: calculate-region-and-insert.el
  (defun add-number-grouping (number &optional separator)
    "Add commas to NUMBER and return it as a string.
     Optional SEPARATOR is the string to use to separate groups.
     It defaults to a comma."
    (let ((num (number-to-string number))
          (op (or separator ",")))
      (while (string-match "\\(.*[0-9]\\)\\([0-9][0-9][0-9].*\\)" num)
        (setq num (concat
                   (match-string 1 num) op
                   (match-string 2 num))))
      num)
    )
  (defun calculate-region-and-insert (beg end)
    "Calculate natural text of region and insert to current buffer.  BEG, END."
    (interactive "r")
    (let* ((strings (if mark-active
                        (buffer-substring-no-properties beg end)
                      (read-string " Expression: " "")))
           (is_num_format (string-match "," (buffer-substring-no-properties beg end)))
           result)
      (when mark-active
        (with-temp-buffer
          (insert strings)
          (perform-replace "[\t,　 ]+" "" nil t nil nil nil (point-min) (point-max))
          (perform-replace "\n" "+" nil t nil nil nil (point-min) (point-max))
          (perform-replace "[^0-9\\+\\*/\\(\\)^\\.-]" "+" nil t nil nil nil (point-min) (point-max))
          (perform-replace "\\++" "+" nil t nil nil nil (point-min) (point-max))
          (perform-replace "\\+$" "" nil t nil nil nil (point-min) (point-max))
          (perform-replace "^\\++" "" nil t nil nil nil (point-min) (point-max))
          (setq strings (buffer-substring-no-properties (point-min) (point-max))))
        (goto-char end)
        (end-of-line)
        (newline))
      (setq result (calc-eval strings))
      (when is_num_format (setq result (add-number-grouping (string-to-number result) ",")))
      (when (string-match "\\.$" result)
        (setq result (substring result 0 (match-beginning 0))))
      (insert result))
    )

  (defun compute-time-subtraction (time sep)
    "Compute hh:mm - m min, e.g., 15:00 - 5 -> 14:55"
    (let* ((hour-min (split-string time ":"))
           (hour (string-to-number (car hour-min)))
           (min (string-to-number (car (cdr hour-min))))
           (total-min (- (+ (* hour 60) min) (if (stringp sep) (string-to-number sep) sep)))
           (ret-hour (format "%02d" (/ total-min 60)))
           (ret-min (format "%02d" (mod total-min 60)))
           )
      (concat ret-hour ":" ret-min)
      )
    )
  )

;; postprocessing
(setq file-name-handler-alist my-saved-file-name-handler-alist)
(setq gc-cons-threshold 16777216) ; 16mb

;; init.el ends here
