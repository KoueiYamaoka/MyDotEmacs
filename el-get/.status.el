((anzu status "installed" recipe
       (:name anzu :after nil :website "https://github.com/syohex/emacs-anzu" :description "A minor mode which displays current match and total matches." :type "github" :branch "master" :pkgname "syohex/emacs-anzu"))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features auto-complete-config :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (ctable status "installed" recipe
	 (:name ctable :description "Table Component for elisp" :type github :pkgname "kiwanami/emacs-ctable"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (deferred status "installed" recipe
   (:name deferred :description "Simple asynchronous functions for emacs lisp." :type github :pkgname "kiwanami/emacs-deferred"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (epc status "installed" recipe
      (:name epc :description "An RPC stack for Emacs Lisp" :type github :pkgname "kiwanami/emacs-epc" :depends
	     (deferred ctable)))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (flycheck status "installed" recipe
	   (:name flycheck :type github :pkgname "flycheck/flycheck" :minimum-emacs-version "24.3" :description "On-the-fly syntax checking extension" :depends
		  (dash pkg-info let-alist seq)))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (google-translate status "installed" recipe
		   (:name google-translate :after nil :description "Emacs interface to Google Translate" :type github :pkgname "atykhonov/google-translate"))
 (helm status "installed" recipe
       (:name helm :after nil :features
	      ("helm-config")
	      :description "Emacs incremental completion and narrowing framework" :type github :pkgname "emacs-helm/helm" :autoloads "helm-autoloads" :build
	      (("make"))
	      :build/darwin
	      `(("make" ,(format "EMACS_COMMAND=%s" el-get-emacs)))
	      :build/windows-nt
	      (let
		  ((generated-autoload-file
		    (expand-file-name "helm-autoloads.el"))
		   \
		   (backup-inhibited t))
	      (update-directory-autoloads default-directory)
	      nil)
       :post-init
       (helm-mode)))
(helm-ag status "installed" recipe
(:name helm-ag :after nil :depends
(helm)
:description "The silver search with helm interface." :type github :pkgname "syohex/emacs-helm-ag"))
(helm-descbinds status "installed" recipe
(:name helm-descbinds :after nil :depends
(helm)
:type github :pkgname "emacs-helm/helm-descbinds" :description "Yet Another `describe-bindings' with `helm'." :prepare
(progn
(autoload 'helm-descbinds-install "helm-descbinds"))))
(jedi status "installed" recipe
(:name jedi :after nil :depends
(python-environment auto-complete epc)
:description "An awesome Python auto-completion for Emacs" :type github :pkgname "tkf/emacs-jedi" :submodule nil))
(let-alist status "installed" recipe
(:name let-alist :description "Easily let-bind values of an assoc-list by their names." :builtin "25.0.50" :type elpa :url "https://elpa.gnu.org/packages/let-alist.html"))
(matlab-mode status "installed" recipe
(:name matlab-mode :description "Major mode for MATLAB(R) dot-m files" :website "http://matlab-emacs.sourceforge.net/" :type git :url "http://git.code.sf.net/p/matlab-emacs/src" :build
`(("touch" "Makefile")
("make" ,(format "EMACS=%s" el-get-emacs)))
:load-path
(".")
:features matlab-load))
(package status "installed" recipe
(:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "https://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :features package :post-init
(progn
(let
((old-package-user-dir
(expand-file-name
(convert-standard-filename
(concat
(file-name-as-directory default-directory)
"elpa")))))
(when
(file-directory-p old-package-user-dir)
(add-to-list 'package-directory-list old-package-user-dir)))
(setq package-archives
(bound-and-true-p package-archives))
(let
((protocol
(if
(and
(fboundp 'gnutls-available-p)
(gnutls-available-p))
"https://"
(lwarn
'(el-get tls)
:warning "Your Emacs doesn't support HTTPS (TLS)%s"
(if
(eq system-type 'windows-nt)
",\n  see https://github.com/dimitri/el-get/wiki/Installation-on-Windows." "."))
"http://"))
(archives
'(("melpa" . "melpa.org/packages/")
("gnu" . "elpa.gnu.org/packages/")
("marmalade" . "marmalade-repo.org/packages/"))))
(dolist
(archive archives)
(add-to-list 'package-archives
(cons
(car archive)
(concat protocol
(cdr archive)))))))))
(pkg-info status "installed" recipe
(:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
(dash epl)))
(popup status "installed" recipe
(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :depends cl-lib :pkgname "auto-complete/popup-el"))
(popwin status "installed" recipe
(:name popwin :after nil :description "Popup Window Manager." :website "https://github.com/m2ym/popwin-el" :type github :pkgname "m2ym/popwin-el" :load-path
("." "misc")))
(py-yapf status "installed" recipe
(:name py-yapf :type elpa :after nil))
(python-environment status "installed" recipe
(:name python-environment :description "Python virtualenv API for Emacs Lisp" :type github :pkgname "tkf/emacs-python-environment" :depends
(deferred)))
(python-mode status "installed" recipe
(:name python-mode :after nil :description "Major mode for editing Python programs" :type bzr :url "lp:python-mode" :load-path
("." "test")
:compile nil :prepare
(progn
(autoload 'python-mode "python-mode" "Python editing mode." t)
(autoload 'doctest-mode "doctest-mode" "Doctest unittest editing mode." t)
(setq py-install-directory
(el-get-package-directory "python-mode"))
(add-to-list 'auto-mode-alist
'("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist
'("python" . python-mode)))))
(quickrun status "installed" recipe
(:name quickrun :type github :pkgname "syohex/emacs-quickrun" :after nil :features
("quickrun")))
(seq status "installed" recipe
(:name seq :description "Sequence manipulation library for Emacs" :builtin "25" :type github :pkgname "NicolasPetton/seq.el"))
(undo-tree status "installed" recipe
(:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
(undohist status "installed" recipe
(:name undohist :after nil :type github :pkgname "m2ym/undohist-el" :description "Record and recover undo history" :website "http://d.hatena.ne.jp/m2ym/20090707/1246933894"))
(yasnippet status "installed" recipe
(:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
(("git" "submodule" "update" "--init" "--" "snippets"))))
(yatex status "installed" recipe
(:name yatex :after
(progn
(el-get-bundle-load-init "/home/yamaoka/.emacs.d/init/bundle-init/_home_yamaoka_.emacs.d_init-1_yatex.el"))
:website "http://www.yatex.org/" :description "Yet Another TeX mode for Emacs" :type hg :url "http://www.yatex.org/hgrepos/yatex" :build
(("sed" "-i" "s/ from yatex.el//" "yatexmth.el"))
:build/berkeley-unix
(("sed" "-i" "" "s/ from yatex.el//" "yatexmth.el"))
:build/darwin
(("env" "LANG=C" "LC_ALL=C" "sed" "-i" "" "s/ from yatex.el//" "yatexmth.el")))))
