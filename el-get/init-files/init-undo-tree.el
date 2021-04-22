;;; undotree.el --- Undo-Tree
;;; Commentary:
;;; Code:
;; undo-hist ファイルを閉じても再度undo-treeを使える
(require 'undohist nil t)

;; undo-tree
(global-undo-tree-mode t)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)
(global-set-key (kbd "C-M-z") 'undo-tree-redo)
(setq undo-tree-auto-save-history nil)

;; mode name setting
(setcar (cdr (assq 'undo-tree-mode minor-mode-alist)) " UT")

;;; init-undo-tree.el ends here
