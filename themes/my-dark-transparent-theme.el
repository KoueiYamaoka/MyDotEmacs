(require 'solarized)
(deftheme my-dark-transparent "The my-dark-transparent colour theme of Solarized colour theme flavor.")
(solarized-with-color-variables 'dark 'my-dark-transparent
  '((base03 . "#262626")
    (base02 . "#2b2b2b")
    (base01 . "#6a6a6a")
    (base00 . "#757575")
    (base0 . "#8f8f8f")
    (base1 . "#9c9c9c")
    (base2 . "#f0f0f0")
    (base3 . "#ffffff")
    (yellow . "#e5c06d")
    (orange . "#a4b5e6")
    (red . "#e5786d")
    (magenta . "#ff877e")
    (violet . "#834c98")
    (blue . "#7ec98f")
    (cyan . "#d8bfd8")
    (green . "#87cefa")
    (yellow-d . "#463e32")
    (yellow-l . "#f9eede")
    (orange-d . "#3f3e45")
    (orange-l . "#efeff7")
    (red-d . "#473831")
    (red-l . "#fae6dd")
    (magenta-d . "#4d3938")
    (magenta-l . "#ffe7e6")
    (violet-d . "#383138")
    (violet-l . "#e6dde6")
    (blue-d . "#394538")
    (blue-l . "#e8f7e7")
    (cyan-d . "#453f45")
    (cyan-l . "#f7eff7")
    (green-d . "#3a454c")
    (green-l . "#eaf7ff")
    (yellow-1bg . "#3e382f")
    (orange-1bg . "#38383d")
    (red-1bg . "#3f332e")
    (magenta-1bg . "#433433")
    (blue-1bg . "#343d33")
    (cyan-1bg . "#3d383d")
    (green-1bg . "#353d42")
    (violet-1bg . "#332e33")
    (yellow-1fg . "#e6c68e")
    (orange-1fg . "#c7c6e3")
    (red-1fg . "#e7aa8d")
    (magenta-1fg . "#ffacaa")
    (violet-1fg . "#aa8daa")
    (blue-1fg . "#ade4aa")
    (cyan-1fg . "#e3c7e3")
    (green-1fg . "#b0e3ff")
    (yellow-2bg . "#68593d")
    (orange-2bg . "#595967")
    (red-2bg . "#694b3c")
    (magenta-2bg . "#774c4a")
    (violet-2bg . "#4b3c4a")
    (blue-2bg . "#4c674b")
    (cyan-2bg . "#675967")
    (green-2bg . "#4d6775")
    (yellow-2fg . "#edd2a6")
    (orange-2fg . "#d3d2e9")
    (red-2fg . "#eebca4")
    (magenta-2fg . "#ffbebb")
    (violet-2fg . "#bca4bb")
    (blue-2fg . "#bfeabc")
    (cyan-2fg . "#e9d3e9")
    (green-2fg . "#c2e9ff"))
  '((custom-theme-set-faces theme-name
			    `(default
			       ((,class
				 (:foreground ,"#dde2dd" :background ,"undefined"))))
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
				(:underline ,t :foreground ,"#e5c06d")))))))
(provide-theme 'my-dark-transparent)
(provide 'my-dark-transparent-theme)
