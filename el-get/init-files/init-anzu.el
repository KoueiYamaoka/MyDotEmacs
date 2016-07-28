;;; anzu.el --- anzu
;;; Commentary:
;;; Code:
(global-anzu-mode +1)

(custom-set-variables
 '(anzu-mode-lighter "")       ;; モードラインに表示されるマイナーモード名
 '(anzu-deactive-region t)     ;; 置換ハイライト
 '(anzu-search-threshold 100)  ;; 検索数上限値
)
;;; init-anzu.el ends here
