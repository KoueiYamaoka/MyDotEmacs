;; Codes for generating original themes using solarized-emacs functions
;; Eval each solarized-create-theme-file-with-palette to generate a theme file in .emacs.d/theme


;; theme for emacs on the terminal with transparent background
(solarized-create-theme-file-with-palette 'dark 'my-dark-transparent
  '("#2a2a29" "#f8f8ff"
    "#e5c06d" "#a4b5e6" "#e5786d" "#ff877e" "#834c98" "#7ec98f" "#d8bfd8" "#87cefa")
  '((custom-theme-set-faces
     theme-name
     ;; Default
     `(default ((,class (:foreground ,"#dde2dd" :background ,"undefined"))))
     `(font-lock-builtin-face ((,class (:weight ,'bold :slant ,'normal :foreground ,"#b0c4de"))))
     `(font-lock-comment-delimiter-face ((,class (:slant ,'normal :foreground ,"#ff7f24"))))
     `(font-lock-comment-face ((,class (:foreground ,"#ff7f24"))))

     ;; For YaTeX
     `(YaTeX-font-lock-declaration-face ((,class (:weight ,'bold :foreground ,"#87cefa"))))
     `(YaTeX-font-lock-include-face ((,class (:foreground ,"#87cefa"))))
     `(YaTeX-font-lock-formula-face ((,class (:weight ,'normal :foreground ,"#bbffff"))))
     `(YaTeX-font-lock-crossref-face ((,class (:underline ,t :foreground ,"#e5c06d"))))

     ;; For Markdown
     `(markdown-pre-face ((,class (:foreground ,"#bbffff"))))
     `(markdown-markup-face ((,class (:foreground ,"#bbffff"))))
     ))
  )

