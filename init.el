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
;; インデント
(define-key global-map (kbd "C-c i") 'indent-region)
;; コメントアウト
(global-set-key (kbd "C-c ;") 'comment-or-uncomment-region)
;; 指定行にジャンプする
(global-set-key (kbd "C-x j") 'goto-line)
;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)
;;括弧の自動補完
(electric-pair-mode 1)
;; カーソル点滅の停止
(blink-cursor-mode 0)
;; 対応するカッコを光らせる
(show-paren-mode 1)
;; ウィンドウに収まらない時だけ括弧内を光らせる
(setq show-paren-style 'mixed)
;; バックアップファイルを作らない
(setq backup-inhibited t)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; 置換 (対話型) query-replace
(global-set-key (kbd "C-c q") 'query-replace)
;; 置換 (非対話) replace-string
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
;; 行番号設定
;;(global-linum-mode t)
;; F6で行番号を表示
(global-set-key [f6] 'linum-mode)
(setq linum-format "%2d ")
;; 同名ファイルバッファ名識別文字列の変更
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; zshを使う
(setq shell-file-name "/bin/zsh")
;;最後に1行追加する
(setq require-final-newline t)
;; 自動で色付け
(global-font-lock-mode t)
;;scroll up
(global-set-key (kbd "C-<down>") 'scroll-up)
;;scroll down
(global-set-key (kbd "C-<up>") 'scroll-down)
;; avoid "Symbolic link to SVN-controlled source file; follow link? (yes or no)"
(setq vc-follow-symlinks t)
;; uniquify setting
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; basec setting ends here


;;; init.el ends here
