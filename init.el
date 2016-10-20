;;; init.el -- emacs init file
;;; Commentary:
;;; Code:
;; emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "init/"))


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
(el-get 'sync)

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
;;matlab-mode
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
;;;; download packages ends here


;;;; basic setting
;; undo
(define-key global-map (kbd "C-z") 'undo)
;; indent
(define-key global-map (kbd "C-c i") 'indent-region)
;; comment out
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
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; query-replace
(global-set-key (kbd "C-c q") 'query-replace)
;; replace-string
(global-set-key (kbd "C-c r") 'replace-string)
;; カーソルのあるウィンドウを閉じる
(define-key global-map (kbd "M-0") 'delete-window)
;; 他のウィンドウをすべて閉じる
(define-key global-map (kbd "M-1") 'delete-other-windows)
;; ウィンドウを上下に分割
(define-key global-map (kbd "M-2") 'split-window-vertically)
;; ウィンドウを左右に分割
(define-key global-map (kbd "M-3") 'split-window-horizontally)
;; ファイル名補完 大文字小文字の区別をしない
(setq completion-ignore-case t)
;; show the line number by F6
(global-set-key [f6] 'linum-mode)
(setq linum-format "%2d ")
;; 同名ファイルバッファ名識別文字列の変更
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; use zsh
(setq shell-file-name "/bin/zsh")
;; add 1 line at last line
(setq require-final-newline t)
;; 自動で色付け
(global-font-lock-mode t)
;; scroll up
(global-set-key (kbd "C-down") 'scroll-up)
;; scroll down
(global-set-key (kbd "C-<up>") 'scroll-down)
;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)
;; uniquify setting
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; sh-mode
(add-to-list 'auto-mode-alist '("\\zshrc" . sh-mode))
;; インデントをTabでなく半角スペースに
;(setq-default tab-width 8 indent-tabs-mode nil)
;; basec setting ends here


;;; init.el ends here
