;;;;; init.el -- emacs init file
;;;;; Commentary:
;;;;; Code:

;;; load-pathを追加する関数を定義
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
(add-to-load-path "init/")


;; el-get setting
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

;; el-get setting ends here

;;;; download packages
;; auto-complete
(el-get-bundle auto-complete)
;; yasnippet
(el-get-bundle capitaomorte/yasnippet)
;; flycheck
(el-get-bundle flycheck/flycheck)
;; undotree
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
;; popwin
(el-get-bundle popwin)
;; anzu
(el-get-bundle anzu)
;; google-translate
(el-get-bundle google-translate)
;; python-mode
(el-get-bundle python-mode)
;; jedi for python auto-complete
(el-get-bundle jedi)
;; py-autopep8 for python auto-modify wrong coding
(el-get-bundle py-yapf)
;; highlight symbol
(el-get-bundle highlight-symbol)
;; expand-region
(el-get-bundle expand-region)
;; smartrep
(el-get-bundle smartrep)
;; multiple-cursors
(el-get-bundle multiple-cursors)
;; region-bindings-mode
(el-get-bundle region-bindings-mode)
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
;;Auto-completion of the brackets
(electric-pair-mode 1)
;; stop the cursor blinking
(blink-cursor-mode 0)
;; make the correspond brackets on light
(show-paren-mode 1)
;; ウィンドウに収まらない時だけ括弧内を光らせる
(setq show-paren-style 'mixed)
;; dont make backup files
(setq backup-inhibited t)
;; delete auto save file when exit emacs
(setq delete-auto-save-files t)
;; query-replace
(global-set-key (kbd "C-c q") 'query-replace)
;; replace-string
(global-set-key (kbd "C-c r") 'replace-string)
;; カーソルのあるウィンドウを閉じる
(define-key global-map (kbd "M-0") 'delete-window)
;; 他のウィンドウをすべて閉じる
(define-key global-map (kbd "M-1") 'delete-other-windows)
;; split window vertically
(define-key global-map (kbd "M-2") 'split-window-vertically)
;; split window horizontally
(define-key global-map (kbd "M-3") 'split-window-horizontally)
;; auto complete file name and case sensitive
(setq completion-ignore-case t)
;; show the line and number by F6
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
;;C-x o to C-o
(global-set-key (kbd "C-o") 'other-window)
;; Emphasize the useless space of the end of line
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")
;; delete useless space of the end of line
(global-set-key (kbd "C-c C-c d") 'delete-trailing-whitespace)
;; show row and column number on mode-line
(line-number-mode t)
(column-number-mode t)
;; default fill column set to 80
(setq-default fill-column 80)
;;;; basic setting ends here


;;;; dafault mode activate settings
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

;;;;; init.el ends here
