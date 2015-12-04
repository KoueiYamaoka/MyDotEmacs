;; emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path (locate-user-emacs-file "init/"))


;; el-get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
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


;; download packages
;; auto-complete
(el-get-bundle auto-complete)


