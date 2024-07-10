(require 'solarized)
(deftheme my-dark-transparent "The my-dark-transparent colour theme of Solarized colour theme flavor.")
(solarized-with-color-variables 'dark 'my-dark-transparent
  '((base03 . "#2a2a29")
    (base02 . "#2f2f2e")
    (base01 . "#6b6b6c")
    (base00 . "#757577")
    (base0 . "#8e8e90")
    (base1 . "#9a9a9e")
    (base2 . "#eaeaf1")
    (base3 . "#f8f8ff")
    (yellow . "#e5c06d")
    (orange . "#a4b5e6")
    (red . "#e5786d")
    (magenta . "#ff877e")
    (violet . "#834c98")
    (blue . "#7ec98f")
    (cyan . "#d8bfd8")
    (green . "#87cefa")
    (yellow-d . "#4c4536")
    (yellow-l . "#f7ece1")
    (orange-d . "#41434a")
    (orange-l . "#e8eafa")
    (red-d . "#4d3936")
    (red-l . "#f8dee0")
    (magenta-d . "#513c39")
    (magenta-l . "#fee2e4")
    (violet-d . "#3b313d")
    (violet-l . "#e1d4ea")
    (blue-d . "#3b473c")
    (blue-l . "#e0efe8")
    (cyan-d . "#494548")
    (cyan-l . "#f2ecf7")
    (green-d . "#3d474e")
    (green-l . "#e4f0fe")
    (yellow-1bg . "#433e33")
    (orange-1bg . "#3b3d42")
    (red-1bg . "#443633")
    (magenta-1bg . "#473835")
    (blue-1bg . "#363f37")
    (cyan-1bg . "#413e40")
    (green-1bg . "#384044")
    (violet-1bg . "#373038")
    (yellow-1fg . "#eed099")
    (orange-1fg . "#bec9ee")
    (red-1fg . "#f09f97")
    (magenta-1fg . "#ffaaa3")
    (violet-1fg . "#a77eb6")
    (blue-1fg . "#a4d8b0")
    (cyan-1fg . "#e2d0e4")
    (green-1fg . "#addafc")
    (yellow-2bg . "#706144")
    (orange-2bg . "#585d6e")
    (red-2bg . "#714943")
    (magenta-2bg . "#7a4e49")
    (violet-2bg . "#4d3853")
    (blue-2bg . "#4b654f")
    (cyan-2bg . "#6a6169")
    (green-2bg . "#506675")
    (yellow-2fg . "#f1d9ae")
    (orange-2fg . "#cad3f1")
    (red-2fg . "#f4b2ac")
    (magenta-2fg . "#ffbbb6")
    (violet-2fg . "#b897c6")
    (blue-2fg . "#b6dfc0")
    (cyan-2fg . "#e6d8e9")
    (green-2fg . "#bee1fc"))
  '((custom-theme-set-faces theme-name
                            `(default
                               ((,class
                                 (:foreground ,"#dde2dd" :background ,"#26292c"))))
                            `(font-lock-builtin-face
                              ((,class
                                (:weight ,'bold :slant ,'normal :foreground ,"#b0c4de"))))
                            `(font-lock-comment-delimiter-face
                              ((,class
                                (:slant ,'normal :foreground ,"#ff7f24"))))
                            `(font-lock-comment-face
                              ((,class
                                (:foreground ,"#ff7f24"))))
                            `(YaTeX-font-lock-declaration-face
                              ((,class
                                (:weight ,'bold :foreground ,"#87cefa"))))
                            `(YaTeX-font-lock-include-face
                              ((,class
                                (:foreground ,"#87cefa"))))
                            `(YaTeX-font-lock-formula-face
                              ((,class
                                (:weight ,'normal :foreground ,"#bbffff"))))
                            `(YaTeX-font-lock-crossref-face
                              ((,class
                                (:underline ,t :foreground ,"#e5c06d"))))
                            `(markdown-pre-face
                              ((,class
                                (:foreground ,"#bbffff"))))
                            `(markdown-markup-face
                              ((,class
                                (:foreground ,"#bbffff"))))
                            `(org-hide
                              ((,class
                                (:foreground ,"#333333")))))))
(provide-theme 'my-dark-transparent)
(provide 'my-dark-transparent-theme)
