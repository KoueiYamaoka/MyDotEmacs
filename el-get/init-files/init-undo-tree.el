;;; undotree.el --- UndoTree
;;; Commentary:
;;; Code:
;; undo-hist ファイルを閉じても再度undo-treeを使える
(require 'undohist nil t)
(undohist-initialize)
;; undo-tree
(global-undo-tree-mode +1)
(global-set-key (kbd "C-x u") 'undo-tree-visualize)

;;; undotree.el ends here
