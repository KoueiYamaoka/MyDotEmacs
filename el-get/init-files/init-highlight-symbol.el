;;; highlight-symbol.el --- highlight-symbol
;;; Commentary:
;;; Code:

;;; ソースコードにおいてM-p/M-nでシンボル間を移動
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
;;; シンボル置換
(global-set-key (kbd "C-c C-c r") 'highlight-symbol-query-replace)
(setq highlight-symbol-colors '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1"))
(global-set-key (kbd "C-c C-l") 'highlight-symbol-at-point)
;;; init-highlight-symbol.el ends here
