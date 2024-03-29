;;;;; init.el -- emacs init file
;;;;; Commentary:
;;;;; Code:

;; global settings
(setq user-full-name "Kouei Yamaoka")

;; mozc settings
(add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-mozc")
(require 'mozc)
(setq default-input-method "japanese-mozc")
(prefer-coding-system 'utf-8)

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
(setq el-get-recipe-path (list (locate-user-emacs-file "el-get/my-recipes")
                               (locate-user-emacs-file "el-get/el-get/recipes/")
                               ))
;; put init files into el-get/init-files
;; file name is init-*.el
(setq el-get-user-package-directory (locate-user-emacs-file "el-get/init-files"))
(require 'el-get)
;; (el-get 'sync) % if write installing packages in init.el, dont write this setting
;;;; el-get setting ends here

;;;; emacs directory
(setq user-init-directory (concat user-emacs-directory "user-init-files/"))
(byte-recompile-directory user-init-directory 0)

;;;; download packages via el-get
;; cmigego
(el-get-bundle migemo)
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
;; shackle; an alternative of popwin
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
;; enable org-mode-like outline in everywhere
(el-get-bundle outline-magic)
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
;; jinja2
(el-get-bundle paradoxxxzero/jinja2-mode)
;; smart minor mode for dealing with pairs
(el-get-bundle smartparens)
;; highlights delimiters according to their depth
(el-get-bundle rainbow-delimiters)
;; image viewer
(el-get-bundle image+)
;; Markdown-mode
(el-get-bundle markdown-mode)
(el-get-bundle markdown-preview-mode)
;; wakatime-mode
(el-get-bundle wakatime/wakatime-mode)
;; Highlight-Indentation-for-Emacs
(el-get-bundle DarthFennec/highlight-indent-guides)
;; keep scratch
(el-get-bundle Fanael/persistent-scratch)
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
;; open files with external apps
;; (el-get-bundle openwith)
;; emacs-libvterm
(el-get-bundle vterm)
;; pdf-tools
(el-get-bundle pdf-tools)
;; never lose your cursor again
(el-get-bundle beacon)
(beacon-mode 1)
;;;; enhance default commands
;; better zap-up-to-char
(el-get-bundle zop-to-char
  (global-set-key (kbd "M-z") 'zop-up-to-char))
;; better comment-dwim
(el-get-bundle comment-dwim-2
  (global-set-key (kbd "M-;") 'comment-dwim-2))
;; expand C-a and C-e
(el-get-bundle alezost/mwim.el
  :name mwim)
;;;; download packages ends here

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
;; use not tab but space
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
;;;; basic setting ends here


;;;; activate dafault modes
;; uniquify setting
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; uniquify setting ends here

;; fly spell setting
(setq-default ispell-program-name "aspell")
					; use spell check even if there are several japanese
(with-eval-after-load "ispell"
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
	     #'(lambda () (flyspell-mode 1))))
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

;; midnight-mode settings
;; with midnight-mode enabled, clean-buffer-list will kill buffers that haven't visited in three days
(add-hook 'emacs-startup-hook 'midnight-mode)
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
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)


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


;; load files in user-init-directory
(load (concat user-init-directory "init-org-modes"))
(load (concat user-init-directory "misc-functions"))
(load (concat user-init-directory "defaults-with-gui"))

;; keep scratch
(with-eval-after-load "persistent-scratch" '(persistent-scratch-setup-default))


;;; theme settings
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes/"))
(setq custom-theme-directory (concat user-emacs-directory "themes/"))
(defun ky/load-theme ()
  (load-theme 'my-dark-transparent t))
(ky/load-theme)
;; (add-hook 'org-mode-hook 'load-my-theme)

;; load external files
(load (concat user-emacs-directory "api_keys"))

;;;; manual settings end here

;; automatically added settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-ignore-case nil)
 '(ansi-color-names-vector
   ["#2f2f2e" "#e5786d" "#87cefa" "#e5c06d" "#7ec98f" "#ff877e" "#d8bfd8" "#757577"])
 '(anzu-deactive-region t)
 '(anzu-mode-lighter "")
 '(anzu-search-threshold 100)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#d8bfd8")
 '(cua-normal-cursor-color "#8e8e90")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#87cefa")
 '(custom-safe-themes
   '("5271efc2e5051ee6c7909f80f932067db01825dcfec00c7f89b427f887466a81" "ed4ce7697416583dc2c692bda7ed12b1945f9c4ad2475c97f569b3272ec77e66" "f9a95335a47113380263f48be77aa0b21827c5da8a4031879d9b247da79fa740" "c6fdf29db015ac32b52973b4d7c70661fd516783ec6b602b63162b0b2ffd7191" "52334a863212bfaf44f07fd430a25f3e3007aff9d37b781203c892bd56e65149" "9a8b228eeba5cd1ab52bfeadb5436311771b7721c295fc174251a24df17c3234" "8c6c97511e07f83e8ab78a81fee91a7171c999946d333836c07c6dea04a59386" "cd5205ea57bbc4d0af1d48aafeecd9ea68c64abf3c2dd4564ab410eca046d93f" "b0c003476a7f6160df9e5224828f5783ab5dbd8c74607506ca5f1e83ff7276a5" "f020f53edf48f5c1c4c9bc7da69f438fbf45326b880c41aeffc9f6690201007f" "9a0a214ee8dcbe6cb5f05dd5d5c90265e7519df817567ae881d02fc875256b2e" "d44e41b096a295ebefffc812eaba5f4fc20dccdda69a778906bb07ce75e6698b" "72d7155877673229319d55787193108968d962c36fbe797b560145a6467d28a1" "51a961d2b252802385a08f0d5b6e125199897580f59b8d7fa777da9a5dff4db5" "bb1cc2327d97cfca819a79f755c4b0806349a1a93c350f0b5d6741449698a728" "54386cccedb9ea8cdd41850da67969ceb7db3f83d7c9c29dceaecd79cde8daec" "782a2b2672675bf7ca4b0e1d4411f44293d8c799da919fd58661ae3664dc7c15" "6d970bd63d39b81388252f3fa0a73088ee3e7c574f40b406de53f42ba2d74dcd" "cfda4046c0027e824a0b468fcb3d3039a31997034928ad8b924fcd2cc86eeaf9" "fbcabb07748f586ae82631205774cff8f8cee3068f6621bcc325101ffb0048e6" "391f4cf819063a726c6b0ee916c4a75b787c17e9a73a5efe063e448259daf5bb" "b322802e7e66604e17dc6f5d91b44f3669231a0028cb4bb52487cb5c02e2e92e" "d86d73de98494cbbc1f94736c8291c5e61fd055cc974e3c353e824a88455adb0" "bc95c9dcd80cdb148cf31c4ad9df79c95640738951782aeaf76971f9f19f3bf7" "14f60578f9225996facf7d06745125c4d38737b45adc2c169f107efaac9a6d35" "68c45f9bdcbaca3458955538901aff532677b10bbee48ae516314dd979f4ca9e" "4748a1fad0b11cba3f18834236264fce190bb7e3d19ffc4960ecf120f4e9f9e8" "0af115e20c7376096e1723aeccf220d855136551fb02da304814693d605b0d17" "76eda859086e8869f0e77875d93bceab3185645b0c48dc414310aab1a35484c5" "913c0be793a1bb22ceb5199a791b0020e07ccc91a0fba663fd44faf89bda041a" "e2dfa4f99b23e4d49642ff6cfda7b2f5d8fa3437acdead2cd65828bbe4e8f861" "db1b13a60f5589e71f45b646d4de5edda71b6c5596290f541df5a5e7a2637243" "f77a217029295da4a303f72139220e03412f1673fdb8c2fe718173a5a67bff51" "b81f581b0ff3d9ec6850748d527c200178887479d2d07d0971177c7a7aeffc71" "b30b91fdfce4ad8ba73b354b2a89e37d2cf55c2c2b5e7dfe67915f9ce1d49e08" "9b583d19ab772765cb8b3dbfb40770ae815eba8e62bf455d0eeac4b1fe3f81b8" "661f761290218d0c932fa6db6efe1536f8e4cd2281449c5bf3c8c7c542b5acb0" "f771736d147ea3da5638755994f67add8727a422a819bba5d74408739d2dfb77" "177d09a0d085d3a67e0bdfe4aa37804a94b22477a3913fd7c5d98990c4eec55b" "5cfb4217aa8866f7e01b9778f4c4993c2c9ec7dbb7440e7adb288926a9cca73e" "e1719b92304133e6e35f08a670a80e091b4e2f7307749bf9ffaca8f553564de5" "bc1e6a0a9cfca173814bebe2408583c01328f14fafeb8ffe0a4d45b30e6ff412" "1f95981c55501d71c8538a414e1e6a4e075caa0ec1a41435511e8cd3796e972a" "d11852d825af9ae4d36ff6d7d744e764a549520f77bac3c79e183abf48a846be" "714d716ce25094591983edc942c13bebad4f081e40d5dc1d5e5e101dc4d9011e" "fa8218b22e3c98d09d84a3473c921534e8c96748759ac95b45b28f60eeb13d2e" "b77bc24606bca89128f77ce2dc068d5654989207b2ad6d9dc8ae6b17273200a5" "9d171eeb68b91d46cb38a6b26a2f37fb68612262e15aa4780b0e08c297046ebc" "6fc9c7d85bb1516a274b2a386de2532f23d91a216c801dd848d57c91ef42ee18" "6b3a82cd7b770cbca8ecada626974a3cbc0dd16b4936ba7ef7145bbe401de7d1" "6d70a130f54c5d0f3ca6b388105574cf3864696eee4b58b5176a4b4e3a64cefb" "32ea637a2d32d3e57bd4b727ca31e131991565ad90765dc312d50920f539b63f" "3cb3fe1d1da964ab823c70d9315183a33e476db4362decb5d065b6f0643f5759" "58d0d60757cbd0b7ae88341ca2944385fe8ebed2898c43af655f2853221c1e52" "6e6236354c56e5ba87249f44ec9f4ec9ab8d877a1eb0c751324fe756c308377e" "460187d80c0010bbb40658dd8c0f3cc3301a93a0279de77eb70f62d531739ebe" "6374c4068cb46145cd25b72f83764bc0c452c460bb6148dd4d3198649fb39f09" "9eb7591355354522e7496ba6b8521936c176cec62b0f5753af3dd2ca1dc022e4" "e18d18dfaf6675634ce3f765564d1377d8acb26665babdc2ca94ee94ecc15454" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "66a0938f8c8ec290f00c872513c5a0455d7d3eb2bdef5458900d0afcc1f3b6fc" "efcecf09905ff85a7c80025551c657299a4d18c5fcfedd3b2f2b6287e4edd659" "d89e15a34261019eec9072575d8a924185c27d3da64899905f8548cbd9491a36" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "f5b6be56c9de9fd8bdd42e0c05fecb002dedb8f48a5f00e769370e4517dde0e8" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "833ddce3314a4e28411edf3c6efde468f6f2616fc31e17a62587d6a9255f4633" "3e200d49451ec4b8baa068c989e7fba2a97646091fd555eca0ee5a1386d56077" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "fee7287586b17efbfda432f05539b58e86e059e78006ce9237b8732fde991b4c" "7d937147c6dcb7b7693b98cb34af3fa024083c97167e6909c611ddc05b578034" "ed92c27d2d086496b232617213a4e4a28110bdc0730a9457edf74f81b782c5cf" "99cd014c6c9baae3dbd46e0762c0c13f1be3f27ab2bbdbaf7a4f0963e7adf311" "58feee2fa2a723800986d34028b14e193fb78218a0d33b3799894ffe49965c60" default))
 '(fci-rule-color "#2b2b2b")
 '(highlight-changes-colors '("#ff877e" "#834c98"))
 '(highlight-symbol-foreground-color "#9a9a9e")
 '(highlight-tail-colors
   '(("#2b2b2b" . 0)
     ("#3a454c" . 20)
     ("#3f3e45" . 30)
     ("#394538" . 50)
     ("#463e32" . 60)
     ("#3f3e45" . 70)
     ("#4d3938" . 85)
     ("#2b2b2b" . 100)))
 '(hl-bg-colors
   '("#463e32" "#3f3e45" "#473831" "#4d3938" "#383138" "#394538" "#3f3e45" "#3a454c"))
 '(hl-fg-colors
   '("#262626" "#262626" "#262626" "#262626" "#262626" "#262626" "#262626" "#262626"))
 '(hl-paren-colors '("#a4b5e6" "#e5c06d" "#7ec98f" "#834c98" "#8ac6f2"))
 '(lsp-ui-doc-border "#939393")
 '(nrepl-message-colors
   '("#e5786d" "#a4b5e6" "#e5c06d" "#3a454c" "#dce9f2" "#394538" "#a4b5e6" "#ff877e" "#834c98"))
 '(package-selected-packages
   '(csv-mode seq py-yapf pkg-info matlab-mode let-alist flymake-easy))
 '(pos-tip-background-color "#2b2b2b")
 '(pos-tip-foreground-color "#939393")
 '(py-force-py-shell-name-p t)
 '(py-indent-offset 4)
 '(py-outline-mode-keywords
   '("class" "def" "except" "for" "while" "finally" "try" "with" "match" "case"))
 '(py-python-command "python3")
 '(py-shell-name "python3" t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#2b2b2b" 0.2))
 '(term-default-bg-color "#2a2a29")
 '(term-default-fg-color "#8e8e90")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#e5786d")
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
     (360 . "#7ec98f")))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "85eaadaa-66c6-482c-bc3f-764f1457d9ed")
 '(wakatime-cli-path "/home/kouei/miniconda3/bin/wakatime")
 '(wakatime-python-bin nil)
 '(weechat-color-list
   '(unspecified "#262626" "#2b2b2b" "#473831" "#e5786d" "#3a454c" "#8ac6f2" "#463e32" "#e5c06d" "#394538" "#7ec98f" "#4d3938" "#ff877e" "#3f3e45" "#a4b5e6" "#878787" "#6f6f6f"))
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

