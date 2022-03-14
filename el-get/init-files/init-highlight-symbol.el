;;; highlight-symbol.el --- highlight-symbol
;;; Commentary:
;;; Code:

; auto-highlighting
(add-hook 'prog-mode-hook 'highlight-symbol-mode)
; highlight immediately
(setq highlight-symbol-idle-delay 0.2)
; enable M-p/M-n to go to the p/n symbol
(add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
; replace current symbol
(global-set-key (kbd "C-c C-c r") 'highlight-symbol-query-replace)
(setq highlight-symbol-colors '("LightSeaGreen" "HotPink" "SlateBlue1" "DarkOrange" "SpringGreen1" "tan" "DodgerBlue1"))

;;; init-highlight-symbol.el ends here
