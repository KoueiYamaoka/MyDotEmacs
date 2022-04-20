;;;;; init.el -- emacs init file
;;;;; Commentary:
;;;;; Code:

;;; Define a function adding a load-path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
	(add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))

;; emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(defun mkdir (dirname)
  (if (not (file-directory-p dirname))
      (make-directory dirname)
    )
  )
(mkdir "~/.emacs.d/init/")
(add-to-load-path "init/")
(setq load-prefer-newer t)


;;;; el-get setting
(add-to-list 'load-path (locate-user-emacs-file "el-get/"))
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
;; el-get init setting
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
;; put .el files into init/
(setq el-get-dir (locate-user-emacs-file "init/"))
;; put recipes into el-get/my-recipes
(setq el-get-recipe-path (list (locate-user-emacs-file "el-get/el-get/recipes/")
			       (locate-user-emacs-file "el-get/my-recipes")))
;; put init files into el-get/init-files
;; file name is init-*.el
(setq el-get-user-package-directory (locate-user-emacs-file "el-get/init-files"))
(require 'el-get)
;; (el-get 'sync) % if write installing packages in init.el, dont write this setting
;;;; el-get setting ends here


;;;; download packages via el-get
;; auto-complete
(el-get-bundle auto-complete)
;; yasnippet
(el-get-bundle capitaomorte/yasnippet)
;; flycheck
(el-get-bundle flycheck/flycheck)
;; undotree
(el-get-bundle queue)
(el-get-bundle undo-tree)
;; undohist
(el-get-bundle undohist)
;; quickrun
(el-get-bundle syohex/emacs-quickrun
  :name quickrun)
;; yatex
(el-get-bundle yatex
  (setq bibtex-command "pbibtex"))
;; matlab-mode
(el-get-bundle elpa:matlab-mode)
;; helm
(el-get-bundle helm)
(el-get-bundle helm-ag)
(el-get-bundle helm-descbinds)
;; shackle instead of popwin
(el-get-bundle wasamasa/shackle)
;; anzu
(el-get-bundle anzu)
;; google-translate
(el-get-bundle atykhonov/google-translate)
;; python-mode
(el-get-bundle python-mode)
;; jedi for python auto-complete
(el-get-bundle jedi)
;; python black: an auto-formatter
(el-get-bundle proofit404/blacken)
;; isort for emacs
(el-get-bundle paetzke/py-isort.el
  :name py-isort)
;; ein: jupyter for emacs
(el-get-bundle ein)
(el-get-bundle anaphora)
;; highlight symbol
(el-get-bundle highlight-symbol)
;; expand-region
(el-get-bundle expand-region)
;; smartrep
(el-get-bundle smartrep)
;; region-bindings-mode
(el-get-bundle region-bindings-mode)
;; check Japanese
(el-get-bundle yama-natuki/yspel)
;; html
(el-get-bundle fxbois/web-mode)
;; smart minor mode for dealing with pairs
(el-get-bundle Fuco1/smartparens)
;; highlights delimiters according to their depth
(el-get-bundle Fanael/rainbow-delimiters)
;; csv-mode
(el-get-bundle csv-mode)
;; image viewer
(el-get-bundle image+)
;; Markdown-mode
(el-get-bundle markdown-mode)
(el-get-bundle markdown-preview-mode)
;; wakatime-mode
(el-get-bundle wakatime/wakatime-mode)
;; Highlight-Indentation-for-Emacs
(el-get-bundle DarthFennec/highlight-indent-guides)
;; expand C-a and C-e
(el-get-bundle alezost/mwim.el
  :name mwim)
;; keep scratch
(el-get-bundle persistent-scratch)
;; yaml-mode
(el-get-bundle yaml-mode)
;; org-journal
(el-get-bundle bastibe/org-journal)
;; Atomic Chrome for Emacs
(el-get-bundle atomic-chrome)
;; display colors
(el-get-bundle rainbow-mode)
;; solarized for Emacs theme
(el-get-bundle solarized-emacs)
;;;; download packages ends here
(package-initialize)


;;;; basic setting
;; undo
(define-key global-map (kbd "C-z") 'undo)
;; indent
(define-key global-map (kbd "C-c i") 'indent-region)
;; comment out and un comment out
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
;; jamp to the specified line
(global-set-key (kbd "C-x j") 'goto-line)
;; "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)
;; Auto-completion of the brackets
(electric-pair-mode 1)
;; stop the cursor blinking
(blink-cursor-mode 0)
;; make the correspond brackets on light
(show-paren-mode 1)
;; Blink the inside of the brackets only when it does not fit in the window
(setq show-paren-style 'mixed)
;; do not make backup files
(setq backup-inhibited t)
;; delete auto save file when exit emacs
(setq delete-auto-save-files t)
;; query-replace
(global-set-key (kbd "C-c q") 'query-replace)
;; replace-string
(global-set-key (kbd "C-c r") 'replace-string)
;; Close the focused window
(define-key global-map (kbd "M-0") 'delete-window)
;; Close the other windows
(define-key global-map (kbd "M-1") 'delete-other-windows)
;; split window vertically
(define-key global-map (kbd "M-2") 'split-window-vertically)
;; split window horizontally
(define-key global-map (kbd "M-3") 'split-window-horizontally)
;; auto complete file name and case sensitive
(setq completion-ignore-case t)
;; show the line number by F6
(global-set-key [f6] 'linum-mode)
(setq linum-format "%2d ")
;; use zsh
(setq shell-file-name "/bin/zsh")
;; add 1 line at last line
(setq require-final-newline t)
;; auto coloring
(global-font-lock-mode t)
;; scroll up
(global-set-key (kbd "C-<down>") 'scroll-up)
;; scroll down
(global-set-key (kbd "C-<up>") 'scroll-down)
;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)
;; sh-mode
(add-to-list 'auto-mode-alist '("\\zshrc" . sh-mode))
;; auto indent when go to new line
(global-set-key (kbd "C-m") 'newline-and-indent)
;; C-k also delete new line in the end of line
(setq kill-whole-line t)
;; C-x o to C-o
(global-set-key (kbd "C-o") 'other-window)
;; Emphasize the useless space on the end of line
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")
;; delete useless space of the end of line
(global-set-key (kbd "C-c C-c d") 'delete-trailing-whitespace)
;; show row and column number on mode-line
(line-number-mode t)
(column-number-mode t)
;; default fill column set to 120
(setq-default fill-column 120)
;; use C-h as backspace
(define-key key-translation-map [?\C-h] [?\C-?])
;; delete-word by C-d
(defun delete-word (arg)
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))
(global-set-key (kbd "C-d") 'delete-word)
;;;; basic setting ends here


;;;; activate dafault modes
;; uniquify setting
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; uniquify setting ends here

;; fly spell setting
(setq-default ispell-program-name "aspell")
					; use spell check even if there are several japanese
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
					; auto load fly spell
(mapc
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '( ;; activate fly spell in these modes' comment region
   emacs-lisp-mode-hook
   python-mode-hook
   matlab-mode-hook
   ))
(mapc
 (lambda (hook)
   (add-hook hook
	     '(lambda () (flyspell-mode 1))))
 '( ;; activate fly spell in these modes
   yatex-mode-hook
   )
 )
(global-set-key (kbd "M-$") 'ispell-buffer)

;; cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-x @") 'cua-set-rectangle-mark)

;; hideshow
(load-library "hideshow")
(add-hook 'python-mode-hook 'hs-minor-mode)
;;;; end dafault mode activate settings

;;;; other elisp
(defun region-to-single-quote ()
  (interactive)
  (quote-formater "'%s'" "^\\(\"\\).*" ".*\\(\"\\)$"))
(defun region-to-double-quote ()
  (interactive)
  (quote-formater "\"%s\"" "^\\('\\).*" ".*\\('\\)$"))
(defun region-to-bracket ()
  (interactive)
  (quote-formater "\(%s\)" "^\\(\\[\\).*" ".*\\(\\]\\)$"))
(defun region-to-square-bracket ()
  (interactive)
  (quote-formater "\[%s\]" "^\\(\(\\).*" ".*\\(\)\\)$"))
(defun quote-formater (quote-format re-prefix re-suffix)
  (if mark-active
      (let* ((region-text (buffer-substring-no-properties (region-beginning) (region-end)))
	     (replace-func (lambda (re target-text)(replace-regexp-in-string re "" target-text nil nil 1)))
	     (text (funcall replace-func re-suffix (funcall replace-func re-prefix region-text))))
	(delete-region (region-beginning) (region-end))
	(insert (format quote-format text)))
    (error "Not Region selection")))

(require 'region-bindings-mode)
(region-bindings-mode-enable)
(define-key region-bindings-mode-map (kbd "M-'") 'region-to-single-quote)
(define-key region-bindings-mode-map (kbd "M-\"") 'region-to-double-quote)
(define-key region-bindings-mode-map (kbd "M-9") 'region-to-bracket)
(define-key region-bindings-mode-map (kbd "M-]") 'region-to-square-bracket)


;; share the clipboard with OS X window
(defun copy-from-osx ()
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbpaste" "*Messages*" "xsel" "--clipboard" "--output")))
      )))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "xsel" "--clipboard" "--input")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


(require 'yspel)

(defun my-insert-file-name (filename &optional args)
  "Insert name of file FILENAME into buffer after point.

  Prefixed with \\[universal-argument], expand the file name to
  its fully canocalized path.  See `expand-file-name'.

  Prefixed with \\[negative-argument], use relative path to file
  name from current directory, `default-directory'.  See
  `file-relative-name'.

  The default with no prefix is to insert the file name exactly as
  it appears in the minibuffer prompt."
  ;; Based on insert-file in Emacs -- ashawley 20080926
  (interactive "*fInsert file name: \nP")
  (cond ((eq '- args)
         (insert (expand-file-name filename)))
        ((not (null args))
         (insert filename))
        (t
         (insert (file-relative-name filename)))))
(global-set-key "\C-c\C-i" 'my-insert-file-name)


;;;; org-mode settings
(setq org-directory "~/Dropbox/share/org/")
(setq org-default-notes-file "notes.org")
(setq org-startup-folded 'showall)
(setq org-log-done 'time)
(setq org-enforce-todo-dependencies t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))

;; org-capture
(define-key global-map (kbd "C-c v") 'org-capture)
(setq org-capture-templates
      '(
	; notes
	("n" "Note" entry (file+headline "~/Dropbox/share/org/notes.org" "Notes")
         "* %?\nEntered on %U\n %i\n %a")
	; org-journal
	("j" "Journal entry" entry (function org-journal-find-location)
	 "* %^{Title}\n%i%?")
;	 "* %(format-time-string org-journal-time-format)%^{Title}\n%i%?")
        )
      )
(defun show-org-buffer (file)
  "Show an org-file FILE on the current buffer."
  (interactive)
  (if (get-buffer file)
      (let ((buffer (get-buffer file)))
        (switch-to-buffer buffer)
        (message "%s" file))
    (find-file (concat org-directory file))))
(global-set-key (kbd "C-M-o") '(lambda () (interactive)
                                 (show-org-buffer "notes.org")))
;; org-refine
(setq org-agenda-files '("~/Dropbox/share/org"))
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

;;;; org-mode settings end here

;; reftex
(setq reftex-default-bibliography '("/home/kouei/latex/articles" "/home/kouei/latex/publications"))

;; keep scratch
(eval-after-load "persistent-scratch" '(persistent-scratch-setup-default))

;;;; misc functions
;; https://www.emacswiki.org/emacs/ReplaceCount
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
(define-key global-map (kbd "M-o") 'another-line)


;;; theme settings
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq custom-theme-directory "~/.emacs.d/themes/")
(load-theme 'my-dark-transparent t)

;; load external files
(load (concat user-emacs-directory "api_keys"))


;; automatically added settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ignore-case nil)
 '(ansi-color-names-vector
   ["#2b2b2b" "#e5786d" "#8ac6f2" "#e5c06d" "#7ec98f" "#ff877e" "#a4b5e6" "#6f6f6f"])
 '(anzu-deactive-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 100)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#a4b5e6")
 '(cua-normal-cursor-color "#8f8f8f")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(custom-safe-themes
   (quote
    ("51a961d2b252802385a08f0d5b6e125199897580f59b8d7fa777da9a5dff4db5" "bb1cc2327d97cfca819a79f755c4b0806349a1a93c350f0b5d6741449698a728" "54386cccedb9ea8cdd41850da67969ceb7db3f83d7c9c29dceaecd79cde8daec" "782a2b2672675bf7ca4b0e1d4411f44293d8c799da919fd58661ae3664dc7c15" "6d970bd63d39b81388252f3fa0a73088ee3e7c574f40b406de53f42ba2d74dcd" "cfda4046c0027e824a0b468fcb3d3039a31997034928ad8b924fcd2cc86eeaf9" "fbcabb07748f586ae82631205774cff8f8cee3068f6621bcc325101ffb0048e6" "391f4cf819063a726c6b0ee916c4a75b787c17e9a73a5efe063e448259daf5bb" "b322802e7e66604e17dc6f5d91b44f3669231a0028cb4bb52487cb5c02e2e92e" "d86d73de98494cbbc1f94736c8291c5e61fd055cc974e3c353e824a88455adb0" "bc95c9dcd80cdb148cf31c4ad9df79c95640738951782aeaf76971f9f19f3bf7" "14f60578f9225996facf7d06745125c4d38737b45adc2c169f107efaac9a6d35" "68c45f9bdcbaca3458955538901aff532677b10bbee48ae516314dd979f4ca9e" "4748a1fad0b11cba3f18834236264fce190bb7e3d19ffc4960ecf120f4e9f9e8" "0af115e20c7376096e1723aeccf220d855136551fb02da304814693d605b0d17" "76eda859086e8869f0e77875d93bceab3185645b0c48dc414310aab1a35484c5" "913c0be793a1bb22ceb5199a791b0020e07ccc91a0fba663fd44faf89bda041a" "e2dfa4f99b23e4d49642ff6cfda7b2f5d8fa3437acdead2cd65828bbe4e8f861" "db1b13a60f5589e71f45b646d4de5edda71b6c5596290f541df5a5e7a2637243" "f77a217029295da4a303f72139220e03412f1673fdb8c2fe718173a5a67bff51" "b81f581b0ff3d9ec6850748d527c200178887479d2d07d0971177c7a7aeffc71" "b30b91fdfce4ad8ba73b354b2a89e37d2cf55c2c2b5e7dfe67915f9ce1d49e08" "9b583d19ab772765cb8b3dbfb40770ae815eba8e62bf455d0eeac4b1fe3f81b8" "661f761290218d0c932fa6db6efe1536f8e4cd2281449c5bf3c8c7c542b5acb0" "f771736d147ea3da5638755994f67add8727a422a819bba5d74408739d2dfb77" "177d09a0d085d3a67e0bdfe4aa37804a94b22477a3913fd7c5d98990c4eec55b" "5cfb4217aa8866f7e01b9778f4c4993c2c9ec7dbb7440e7adb288926a9cca73e" "e1719b92304133e6e35f08a670a80e091b4e2f7307749bf9ffaca8f553564de5" "bc1e6a0a9cfca173814bebe2408583c01328f14fafeb8ffe0a4d45b30e6ff412" "1f95981c55501d71c8538a414e1e6a4e075caa0ec1a41435511e8cd3796e972a" "d11852d825af9ae4d36ff6d7d744e764a549520f77bac3c79e183abf48a846be" "714d716ce25094591983edc942c13bebad4f081e40d5dc1d5e5e101dc4d9011e" "fa8218b22e3c98d09d84a3473c921534e8c96748759ac95b45b28f60eeb13d2e" "b77bc24606bca89128f77ce2dc068d5654989207b2ad6d9dc8ae6b17273200a5" "9d171eeb68b91d46cb38a6b26a2f37fb68612262e15aa4780b0e08c297046ebc" "6fc9c7d85bb1516a274b2a386de2532f23d91a216c801dd848d57c91ef42ee18" "6b3a82cd7b770cbca8ecada626974a3cbc0dd16b4936ba7ef7145bbe401de7d1" "6d70a130f54c5d0f3ca6b388105574cf3864696eee4b58b5176a4b4e3a64cefb" "32ea637a2d32d3e57bd4b727ca31e131991565ad90765dc312d50920f539b63f" "3cb3fe1d1da964ab823c70d9315183a33e476db4362decb5d065b6f0643f5759" "58d0d60757cbd0b7ae88341ca2944385fe8ebed2898c43af655f2853221c1e52" "6e6236354c56e5ba87249f44ec9f4ec9ab8d877a1eb0c751324fe756c308377e" "460187d80c0010bbb40658dd8c0f3cc3301a93a0279de77eb70f62d531739ebe" "6374c4068cb46145cd25b72f83764bc0c452c460bb6148dd4d3198649fb39f09" "9eb7591355354522e7496ba6b8521936c176cec62b0f5753af3dd2ca1dc022e4" "e18d18dfaf6675634ce3f765564d1377d8acb26665babdc2ca94ee94ecc15454" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "66a0938f8c8ec290f00c872513c5a0455d7d3eb2bdef5458900d0afcc1f3b6fc" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7d937147c6dcb7b7693b98cb34af3fa024083c97167e6909c611ddc05b578034" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "99cd014c6c9baae3dbd46e0762c0c13f1be3f27ab2bbdbaf7a4f0963e7adf311" "58feee2fa2a723800986d34028b14e193fb78218a0d33b3799894ffe49965c60" default)))
 '(fci-rule-color "#2b2b2b")
 '(highlight-changes-colors (quote ("#ff877e" "#834c98")))
 '(highlight-symbol-foreground-color "#939393")
 '(highlight-tail-colors
   (quote
    (("#2b2b2b" . 0)
     ("#3a454c" . 20)
     ("#3f3e45" . 30)
     ("#394538" . 50)
     ("#463e32" . 60)
     ("#3f3e45" . 70)
     ("#4d3938" . 85)
     ("#2b2b2b" . 100))))
 '(hl-bg-colors
   (quote
    ("#463e32" "#3f3e45" "#473831" "#4d3938" "#383138" "#394538" "#3f3e45" "#3a454c")))
 '(hl-fg-colors
   (quote
    ("#262626" "#262626" "#262626" "#262626" "#262626" "#262626" "#262626" "#262626")))
 '(hl-paren-colors (quote ("#a4b5e6" "#e5c06d" "#7ec98f" "#834c98" "#8ac6f2")))
 '(lsp-ui-doc-border "#939393")
 '(nrepl-message-colors
   (quote
    ("#e5786d" "#a4b5e6" "#e5c06d" "#3a454c" "#dce9f2" "#394538" "#a4b5e6" "#ff877e" "#834c98")))
 '(package-selected-packages
   (quote
    (csv-mode seq py-yapf pkg-info matlab-mode let-alist flymake-easy)))
 '(pos-tip-background-color "#2b2b2b")
 '(pos-tip-foreground-color "#939393")
 '(py-force-py-shell-name-p t)
 '(py-indent-offset 4)
 '(py-shell-name "python3")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#2b2b2b" 0.2))
 '(term-default-bg-color "#262626")
 '(term-default-fg-color "#878787")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#e5786d")
     (40 . "#d8479be95f8e")
     (60 . "#d82da5db5f83")
     (80 . "#e5c06d")
     (100 . "#ca74bcb7955e")
     (120 . "#c04cc35cafcc")
     (140 . "#b2dfca17ca4d")
     (160 . "#a0d8d0eae503")
     (180 . "#8ac6f2")
     (200 . "#9842ca92f276")
     (220 . "#9f27c3e7ebbf")
     (240 . "#a54abd33e512")
     (260 . "#aac6b677de70")
     (280 . "#a4b5e6")
     (300 . "#a3bbc074b899")
     (320 . "#9becc874a8ab")
     (340 . "#92a2d03d9860")
     (360 . "#7ec98f"))))
 '(vc-annotate-very-old-color nil)
 '(wakatime-cli-path "/home/kouei/miniconda3/bin/wakatime")
 '(wakatime-python-bin nil)
 '(weechat-color-list
   (quote
    (unspecified "#262626" "#2b2b2b" "#473831" "#e5786d" "#3a454c" "#8ac6f2" "#463e32" "#e5c06d" "#394538" "#7ec98f" "#4d3938" "#ff877e" "#3f3e45" "#a4b5e6" "#878787" "#6f6f6f")))
 '(xterm-color-names
   ["#2b2b2b" "#e5786d" "#8ac6f2" "#e5c06d" "#7ec98f" "#ff877e" "#a4b5e6" "#e1e1e1"])
 '(xterm-color-names-bright
   ["#262626" "#a4b5e6" "#656565" "#6f6f6f" "#878787" "#834c98" "#939393" "#eeeeee"])
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;;; init.el ends here
