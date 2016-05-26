;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (global-auto-complete-mode auto-complete-mode auto-complete)
;;;;;;  "../init/auto-complete/auto-complete" "../init/auto-complete/auto-complete.el"
;;;;;;  (22342 25156 683310 422000))
;;; Generated autoloads from ../init/auto-complete/auto-complete.el

(autoload 'auto-complete "../init/auto-complete/auto-complete" "\
Start auto-completion at current point.

\(fn &optional SOURCES)" t nil)

(autoload 'auto-complete-mode "../init/auto-complete/auto-complete" "\
AutoComplete mode

\(fn &optional ARG)" t nil)

(defvar global-auto-complete-mode nil "\
Non-nil if Global-Auto-Complete mode is enabled.
See the command `global-auto-complete-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-auto-complete-mode'.")

(custom-autoload 'global-auto-complete-mode "../init/auto-complete/auto-complete" nil)

(autoload 'global-auto-complete-mode "../init/auto-complete/auto-complete" "\
Toggle Auto-Complete mode in all buffers.
With prefix ARG, enable Global-Auto-Complete mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Auto-Complete mode is enabled in all buffers where
`auto-complete-mode-maybe' would do it.
See `auto-complete-mode' for more information on Auto-Complete mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (ac-config-default) "../init/auto-complete/auto-complete-config"
;;;;;;  "../init/auto-complete/auto-complete-config.el" (22342 25156
;;;;;;  683310 422000))
;;; Generated autoloads from ../init/auto-complete/auto-complete-config.el

(autoload 'ac-config-default "../init/auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (flycheck-def-option-var flycheck-def-config-file-var
;;;;;;  flycheck-define-command-checker flycheck-define-error-level
;;;;;;  global-flycheck-mode flycheck-mode flycheck-manual) "../init/flycheck/flycheck"
;;;;;;  "../init/flycheck/flycheck.el" (22342 25275 343316 417000))
;;; Generated autoloads from ../init/flycheck/flycheck.el

(autoload 'flycheck-manual "../init/flycheck/flycheck" "\
Open the Flycheck manual.

\(fn)" t nil)

(autoload 'flycheck-mode "../init/flycheck/flycheck" "\
Minor mode for on-the-fly syntax checking.

When called interactively, toggle `flycheck-mode'.  With prefix
ARG, enable `flycheck-mode' if ARG is positive, otherwise disable
it.

When called from Lisp, enable `flycheck-mode' if ARG is omitted,
nil or positive.  If ARG is `toggle', toggle `flycheck-mode'.
Otherwise behave as if called interactively.

In `flycheck-mode' the buffer is automatically syntax-checked
using the first suitable syntax checker from `flycheck-checkers'.
Use `flycheck-select-checker' to select a checker for the current
buffer manually.

\\{flycheck-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-flycheck-mode nil "\
Non-nil if Global-Flycheck mode is enabled.
See the command `global-flycheck-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-mode'.")

(custom-autoload 'global-flycheck-mode "../init/flycheck/flycheck" nil)

(autoload 'global-flycheck-mode "../init/flycheck/flycheck" "\
Toggle Flycheck mode in all buffers.
With prefix ARG, enable Global-Flycheck mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Flycheck mode is enabled in all buffers where
`flycheck-mode-on-safe' would do it.
See `flycheck-mode' for more information on Flycheck mode.

\(fn &optional ARG)" t nil)

(autoload 'flycheck-define-error-level "../init/flycheck/flycheck" "\
Define a new error LEVEL with PROPERTIES.

The following PROPERTIES constitute an error level:

`:severity SEVERITY'
     A number denoting the severity of this level.  The higher
     the number, the more severe is this level compared to other
     levels.  Defaults to 0.

     The severity is used by `flycheck-error-level-<' to
     determine the ordering of errors according to their levels.

`:compilation-level LEVEL'

     A number indicating the broad class of messages that errors
     at this level belong to: one of 0 (info), 1 (warning), or
     2 or nil (error).  Defaults to nil.

     This is used by `flycheck-checker-pattern-to-error-regexp'
     to map error levels into `compilation-mode''s hierarchy and
     to get proper highlighting of errors in `compilation-mode'.

`:overlay-category CATEGORY'
     A symbol denoting the overlay category to use for error
     highlight overlays for this level.  See Info
     node `(elisp)Overlay Properties' for more information about
     overlay categories.

     A category for an error level overlay should at least define
     the `face' property, for error highlighting.  Another useful
     property for error level categories is `priority', to
     influence the stacking of multiple error level overlays.

`:fringe-bitmap BITMAP'
     A fringe bitmap symbol denoting the bitmap to use for fringe
     indicators for this level.  See Info node `(elisp)Fringe
     Bitmaps' for more information about fringe bitmaps,
     including a list of built-in fringe bitmaps.

`:fringe-face FACE'
     A face symbol denoting the face to use for fringe indicators
     for this level.

`:error-list-face FACE'
     A face symbol denoting the face to use for messages of this
     level in the error list.  See `flycheck-list-errors'.

\(fn LEVEL &rest PROPERTIES)" nil nil)

(put 'flycheck-define-error-level 'lisp-indent-function '1)

(autoload 'flycheck-define-command-checker "../init/flycheck/flycheck" "\
Define SYMBOL as syntax checker to run a command.

Define SYMBOL as generic syntax checker via
`flycheck-define-generic-checker', which uses an external command
to check the buffer.  SYMBOL and DOCSTRING are the same as for
`flycheck-define-generic-checker'.

In addition to the properties understood by
`flycheck-define-generic-checker', the following PROPERTIES
constitute a command syntax checker.  Unless otherwise noted, all
properties are mandatory.  Note that the default `:error-filter'
of command checkers is `flycheck-sanitize-errors'.

`:command COMMAND'
     The command to run for syntax checking.

     COMMAND is a list of the form `(EXECUTABLE [ARG ...])'.

     EXECUTABLE is a string with the executable of this syntax
     checker.  It can be overridden with the variable
     `flycheck-SYMBOL-executable'.  Note that this variable is
     NOT implicitly defined by this function.  Use
     `flycheck-def-executable-var' to define this variable.

     Each ARG is an argument to the executable, either as string,
     or as special symbol or form for
     `flycheck-substitute-argument', which see.

`:error-patterns PATTERNS'
     A list of patterns to parse the output of the `:command'.

     Each ITEM in PATTERNS is a list `(LEVEL SEXP ...)', where
     LEVEL is a Flycheck error level (see
     `flycheck-define-error-level'), followed by one or more RX
     `SEXP's which parse an error of that level and extract line,
     column, file name and the message.

     See `rx' for general information about RX, and
     `flycheck-rx-to-string' for some special RX forms provided
     by Flycheck.

     All patterns are applied in the order of declaration to the
     whole output of the syntax checker.  Output already matched
     by a pattern will not be matched by subsequent patterns.  In
     other words, the first pattern wins.

     This property is optional.  If omitted, however, an
     `:error-parser' is mandatory.

`:error-parser FUNCTION'
     A function to parse errors with.

     The function shall accept three arguments OUTPUT CHECKER
     BUFFER.  OUTPUT is the syntax checker output as string,
     CHECKER the syntax checker that was used, and BUFFER a
     buffer object representing the checked buffer.  The function
     must return a list of `flycheck-error' objects parsed from
     OUTPUT.

     This property is optional.  If omitted, it defaults to
     `flycheck-parse-with-patterns'.  In this case,
     `:error-patterns' is mandatory.

`:standard-input t'
     Whether to send the buffer contents on standard input.

     If this property is given and has a non-nil value, send the
     contents of the buffer on standard input.

     Defaults to nil.

Note that you may not give `:start', `:interrupt', and
`:print-doc' for a command checker.  You can give a custom
`:verify' function, though, whose results will be appended to the
default `:verify' function of command checkers.

\(fn SYMBOL DOCSTRING &rest PROPERTIES)" nil nil)

(put 'flycheck-define-command-checker 'lisp-indent-function '1)

(put 'flycheck-define-command-checker 'doc-string-elt '2)

(autoload 'flycheck-def-config-file-var "../init/flycheck/flycheck" "\
Define SYMBOL as config file variable for CHECKER, with default FILE-NAME.

SYMBOL is declared as customizable variable using `defcustom', to
provide a configuration file for the given syntax CHECKER.
CUSTOM-ARGS are forwarded to `defcustom'.

FILE-NAME is the initial value of the new variable.  If omitted,
the default value is nil.

Use this together with the `config-file' form in the `:command'
argument to `flycheck-define-checker'.

\(fn SYMBOL CHECKER &optional FILE-NAME &rest CUSTOM-ARGS)" nil t)

(put 'flycheck-def-config-file-var 'lisp-indent-function '3)

(autoload 'flycheck-def-option-var "../init/flycheck/flycheck" "\
Define SYMBOL as option variable with INIT-VALUE for CHECKER.

SYMBOL is declared as customizable variable using `defcustom', to
provide an option for the given syntax CHECKERS (a checker or a
list of checkers).  INIT-VALUE is the initial value of the
variable, and DOCSTRING is its docstring.  CUSTOM-ARGS are
forwarded to `defcustom'.

Use this together with the `option', `option-list' and
`option-flag' forms in the `:command' argument to
`flycheck-define-checker'.

\(fn SYMBOL INIT-VALUE CHECKERS DOCSTRING &rest CUSTOM-ARGS)" nil t)

(put 'flycheck-def-option-var 'lisp-indent-function '3)

(put 'flycheck-def-option-var 'doc-string-elt '4)

;;;***

;;;### (autoloads (let-alist) "../init/let-alist/let-alist" "../init/let-alist/let-alist.el"
;;;;;;  (22342 25224 79313 827000))
;;; Generated autoloads from ../init/let-alist/let-alist.el

(autoload 'let-alist "../init/let-alist/let-alist" "\
Let-bind dotted symbols to their cdrs in ALIST and execute BODY.
Dotted symbol is any symbol starting with a `.'.  Only those present
in BODY are let-bound and this search is done at compile time.

For instance, the following code

  (let-alist alist
    (if (and .title .body)
        .body
      .site
      .site.contents))

essentially expands to

  (let ((.title (cdr (assq 'title alist)))
        (.body  (cdr (assq 'body alist)))
        (.site  (cdr (assq 'site alist)))
        (.site.contents (cdr (assq 'contents (cdr (assq 'site alist))))))
    (if (and .title .body)
        .body
      .site
      .site.contents))

If you nest `let-alist' invocations, the inner one can't access
the variables of the outer one. You can, however, access alists
inside the original alist by using dots inside the symbol, as
displayed in the example above.

\(fn ALIST &rest BODY)" nil t)

(put 'let-alist 'lisp-indent-function '1)

;;;***

;;;### (autoloads (pkg-info-version-info pkg-info-package-version
;;;;;;  pkg-info-defining-library-version pkg-info-defining-library-original-version
;;;;;;  pkg-info-library-version pkg-info-library-original-version)
;;;;;;  "../init/pkg-info/pkg-info" "../init/pkg-info/pkg-info.el"
;;;;;;  (22342 25232 639314 260000))
;;; Generated autoloads from ../init/pkg-info/pkg-info.el

(autoload 'pkg-info-library-original-version "../init/pkg-info/pkg-info" "\
Get the original version in the header of LIBRARY.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no X-Original-Version
header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-library-version "../init/pkg-info/pkg-info" "\
Get the version in the header of LIBRARY.

LIBRARY is either a symbol denoting a named feature, or a library
name as string.

If SHOW is non-nil, show the version in the minibuffer.

Return the version from the header of LIBRARY as list.  Signal an
error if the LIBRARY was not found or had no proper header.

See Info node `(elisp)Library Headers' for more information
about library headers.

\(fn LIBRARY &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-original-version "../init/pkg-info/pkg-info" "\
Get the original version of the library defining FUNCTION.

The original version is stored in the X-Original-Version header.
This header is added by the MELPA package archive to preserve
upstream version numbers.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-defining-library-version "../init/pkg-info/pkg-info" "\
Get the version of the library defining FUNCTION.

If SHOW is non-nil, show the version in mini-buffer.

This function is mainly intended to find the version of a major
or minor mode, i.e.

   (pkg-info-defining-library-version 'flycheck-mode)

Return the version of the library defining FUNCTION.  Signal an
error if FUNCTION is not a valid function, if its defining
library was not found, or if the library had no proper version
header.

\(fn FUNCTION &optional SHOW)" t nil)

(autoload 'pkg-info-package-version "../init/pkg-info/pkg-info" "\
Get the version of an installed PACKAGE.

If SHOW is non-nil, show the version in the minibuffer.

Return the version as list, or nil if PACKAGE is not installed.

\(fn PACKAGE &optional SHOW)" t nil)

(autoload 'pkg-info-version-info "../init/pkg-info/pkg-info" "\
Obtain complete version info for LIBRARY and PACKAGE.

LIBRARY is a symbol denoting a named feature, or a library name
as string.  PACKAGE is a symbol denoting an ELPA package.  If
omitted or nil, default to LIBRARY.

If SHOW is non-nil, show the version in the minibuffer.

When called interactively, prompt for LIBRARY.  When called
interactively with prefix argument, prompt for PACKAGE as well.

Return a string with complete version information for LIBRARY.
This version information contains the version from the headers of
LIBRARY, and the version of the installed PACKAGE, the LIBRARY is
part of.  If PACKAGE is not installed, or if the PACKAGE version
is the same as the LIBRARY version, do not include a package
version.

\(fn LIBRARY &optional PACKAGE SHOW)" t nil)

;;;***

;;;### (autoloads (helm-quickrun anything-quickrun quickrun-autorun-mode
;;;;;;  quickrun-shell quickrun-compile-only quickrun-eval-print
;;;;;;  quickrun-replace-region quickrun-region quickrun-with-arg
;;;;;;  quickrun quickrun-add-command quickrun-set-default) "../init/quickrun/quickrun"
;;;;;;  "../init/quickrun/quickrun.el" (22342 25307 613575 795000))
;;; Generated autoloads from ../init/quickrun/quickrun.el

(autoload 'quickrun-set-default "../init/quickrun/quickrun" "\
Set `key' as default key in programing language `lang'

\(fn LANG KEY)" nil nil)

(autoload 'quickrun-add-command "../init/quickrun/quickrun" "\


\(fn KEY ALIST &key DEFAULT MODE OVERRIDE)" nil nil)

(autoload 'quickrun "../init/quickrun/quickrun" "\
Run commands quickly for current buffer
   With universal prefix argument(C-u), select command-key,
   With double prefix argument(C-u C-u), run in compile-only-mode

\(fn &rest PLIST)" t nil)

(autoload 'quickrun-with-arg "../init/quickrun/quickrun" "\
Run commands quickly for current buffer with arguments

\(fn ARG)" t nil)

(autoload 'quickrun-region "../init/quickrun/quickrun" "\
Run commands with specified region

\(fn START END)" t nil)

(autoload 'quickrun-replace-region "../init/quickrun/quickrun" "\
Run commands with specified region and replace

\(fn START END)" t nil)

(autoload 'quickrun-eval-print "../init/quickrun/quickrun" "\
Run commands with specified region and replace

\(fn START END)" t nil)

(autoload 'quickrun-compile-only "../init/quickrun/quickrun" "\
Exec only compilation

\(fn)" t nil)

(autoload 'quickrun-shell "../init/quickrun/quickrun" "\
Run commands in shell for interactive programs

\(fn)" t nil)

(autoload 'quickrun-autorun-mode "../init/quickrun/quickrun" "\
`quickrun' after saving buffer

\(fn &optional ARG)" t nil)

(autoload 'anything-quickrun "../init/quickrun/quickrun" "\


\(fn)" t nil)

(autoload 'helm-quickrun "../init/quickrun/quickrun" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "../init/undo-tree/undo-tree"
;;;;;;  "../init/undo-tree/undo-tree.el" (22342 25316 281576 233000))
;;; Generated autoloads from ../init/undo-tree/undo-tree.el

(autoload 'undo-tree-mode "../init/undo-tree/undo-tree" "\
Toggle undo-tree mode.
With no argument, this command toggles the mode.
A positive prefix argument turns the mode on.
A negative prefix argument turns it off.

Undo-tree-mode replaces Emacs' standard undo feature with a more
powerful yet easier to use version, that treats the undo history
as what it is: a tree.

The following keys are available in `undo-tree-mode':

  \\{undo-tree-map}

Within the undo-tree visualizer, the following keys are available:

  \\{undo-tree-visualizer-mode-map}

\(fn &optional ARG)" t nil)

(defvar global-undo-tree-mode nil "\
Non-nil if Global-Undo-Tree mode is enabled.
See the command `global-undo-tree-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-undo-tree-mode'.")

(custom-autoload 'global-undo-tree-mode "../init/undo-tree/undo-tree" nil)

(autoload 'global-undo-tree-mode "../init/undo-tree/undo-tree" "\
Toggle Undo-Tree mode in all buffers.
With prefix ARG, enable Global-Undo-Tree mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Undo-Tree mode is enabled in all buffers where
`turn-on-undo-tree-mode' would do it.
See `undo-tree-mode' for more information on Undo-Tree mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (snippet-mode yas-global-mode yas-minor-mode) "../init/yasnippet/yasnippet"
;;;;;;  "../init/yasnippet/yasnippet.el" (22342 25171 191311 155000))
;;; Generated autoloads from ../init/yasnippet/yasnippet.el

(autoload 'yas-minor-mode "../init/yasnippet/yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, `yas-expand', normally bound to
the TAB key, expands snippets of code depending on the major
mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "../init/yasnippet/yasnippet" nil)

(autoload 'yas-global-mode "../init/yasnippet/yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

(autoload 'snippet-mode "../init/yasnippet/yasnippet" "\
A mode for editing yasnippets

\(fn)" t nil)

;;;***

;;;### (autoloads (YaTeX-goto-corresponding-leftright YaTeX-indent-line-equation
;;;;;;  YaTeX-intelligent-newline YaTeX-what-column) "../init/yatex/yatexenv"
;;;;;;  "../init/yatex/yatexenv.el" (22342 25340 777577 470000))
;;; Generated autoloads from ../init/yatex/yatexenv.el

(autoload 'YaTeX-what-column "../init/yatex/yatexenv" "\
Show which kind of column the current position is belonging to.

\(fn)" t nil)

(autoload 'YaTeX-intelligent-newline "../init/yatex/yatexenv" "\
Insert newline and environment-specific entry.
`\\item'	for some itemizing environment,
`\\> \\> \\'	for tabbing environemnt,
`& & \\ hline'	for tabular environment.

\(fn ARG)" t nil)

(autoload 'YaTeX-indent-line-equation "../init/yatex/yatexenv" "\
Indent a line in equation family.

\(fn)" nil nil)

(autoload 'YaTeX-goto-corresponding-leftright "../init/yatex/yatexenv" "\
Go to corresponding left or ight.

\(fn)" nil nil)

;;;***

;;;### (autoloads (YaTeX-help YaTeX-apropos) "../init/yatex/yatexhlp"
;;;;;;  "../init/yatex/yatexhlp.el" (22342 25340 781577 470000))
;;; Generated autoloads from ../init/yatex/yatexhlp.el

(autoload 'YaTeX-apropos "../init/yatex/yatexhlp" "\


\(fn KEY)" t nil)

(autoload 'YaTeX-help "../init/yatex/yatexhlp" "\
Show help buffer of LaTeX/TeX commands or macros.
Optional argument MACRO, if supplied, is directly selected to keyword.

\(fn &optional MACRO)" t nil)

;;;***

;;;### (autoloads (YaTeX-reindent YaTeX-command-to-string YaTeX-delete1
;;;;;;  read-string-with-history read-from-minibuffer-with-history
;;;;;;  completing-read-with-history YaTeX-minibuffer-complete YaTeX-match-string
;;;;;;  substitute-all-key-definition YaTeX-window-list split-window-calculate-height
;;;;;;  YaTeX-showup-buffer point-end-of-line point-beginning-of-line
;;;;;;  rindex YaTeX-replace-format-args YaTeX-replace-formats YaTeX-replace-format
;;;;;;  YaTeX-switch-to-buffer-other-window YaTeX-switch-to-buffer
;;;;;;  YaTeX-search-active-forward YaTeX-define-begend-key YaTeX-define-begend-region-key
;;;;;;  YaTeX-define-begend-key-normal YaTeX-update-dictionary YaTeX-cplread-with-learning
;;;;;;  YaTeX-update-table YaTeX-lookup-table YaTeX-reload-dictionary
;;;;;;  YaTeX-read-user-completion-table YaTeX-sync-local-table YaTeX-local-table-symbol
;;;;;;  YaTeX-define-key) "../init/yatex/yatexlib" "../init/yatex/yatexlib.el"
;;;;;;  (22342 25340 781577 470000))
;;; Generated autoloads from ../init/yatex/yatexlib.el

(autoload 'YaTeX-define-key "../init/yatex/yatexlib" "\
Define key on YaTeX-prefix-map.

\(fn KEY BINDING &optional MAP)" nil nil)

(autoload 'YaTeX-local-table-symbol "../init/yatex/yatexlib" "\
Return the lisp symbol which keeps local completion table of SYMBOL.

\(fn SYMBOL)" nil nil)

(autoload 'YaTeX-sync-local-table "../init/yatex/yatexlib" "\
Synchronize local variable SYMBOL.
Copy its corresponding directory dependent completion table to SYMBOL.

\(fn SYMBOL)" nil nil)

(autoload 'YaTeX-read-user-completion-table "../init/yatex/yatexlib" "\
Append user completion table of LaTeX macros

\(fn &optional FORCETOREAD)" t nil)

(autoload 'YaTeX-reload-dictionary "../init/yatex/yatexlib" "\
Reload local dictionary.
Use this function after editing ./.yatexrc.

\(fn)" t nil)

(autoload 'YaTeX-lookup-table "../init/yatex/yatexlib" "\
Lookup WORD in completion table whose type is TYPE.
This function refers the symbol tmp-TYPE-table, user-TYPE-table, TYPE-table.
Typically, TYPE is one of 'env, 'section, 'fontsize, 'singlecmd.

\(fn WORD TYPE)" nil nil)

(autoload 'YaTeX-update-table "../init/yatex/yatexlib" "\
Update completion table if the car of VALLIST is not in current tables.
Second argument DEFAULT-TABLE is the quoted symbol of default completion
table, third argument USER-TABLE is user table which will be saved in
YaTeX-user-completion-table, fourth argument LOCAL-TABLE should have the
completion which is valid during current Emacs's session.  If you
want to make LOCAL-TABLE valid longer span (but restrict in this directory)
create the file in current directory which has the same name with
YaTeX-user-completion-table.

\(fn VALLIST DEFAULT-TABLE USER-TABLE LOCAL-TABLE)" nil nil)

(autoload 'YaTeX-cplread-with-learning "../init/yatex/yatexlib" "\
Completing read with learning.
Do a completing read with prompt PROM.  Completion table is what
DEFAULT-TABLE, USER-TABLE, LOCAL table are appended in reverse order.
Note that these tables are passed by the symbol.
Optional arguments PRED, REQMATH and INIT are passed to completing-read
as its arguments PREDICATE, REQUIRE-MATCH and INITIAL-INPUT respectively.
If optional 8th argument HSYM, history symbol, is passed, use it as
history list variable.

\(fn PROM DEFAULT-TABLE USER-TABLE LOCAL-TABLE &optional PRED REQMATCH INIT HSYM)" nil nil)

(autoload 'YaTeX-update-dictionary "../init/yatex/yatexlib" "\


\(fn FILE SYMBOL &optional TYPE)" nil nil)

(autoload 'YaTeX-define-begend-key-normal "../init/yatex/yatexlib" "\
Define short cut YaTeX-make-begin-end key.

\(fn KEY ENV &optional MAP)" nil nil)

(autoload 'YaTeX-define-begend-region-key "../init/yatex/yatexlib" "\
Define short cut YaTeX-make-begin-end-region key.

\(fn KEY ENV &optional MAP)" nil nil)

(autoload 'YaTeX-define-begend-key "../init/yatex/yatexlib" "\
Define short cut key for begin type completion.
Define both strokes for normal and region mode.
To customize YaTeX, user should use this function.

\(fn KEY ENV &optional MAP)" nil nil)

(autoload 'YaTeX-search-active-forward "../init/yatex/yatexlib" "\
Search STRING which is not commented out by CMNTRX.
Optional arguments after BOUND, ERR, CNT are passed literally to search-forward
or search-backward.
Optional sixth argument FUNC changes search-function.

\(fn STRING CMNTRX &optional BOUND ERR CNT FUNC)" nil nil)

(autoload 'YaTeX-switch-to-buffer "../init/yatex/yatexlib" "\
Switch to buffer if buffer exists, find file if not.
Optional second arg SETBUF t make use set-buffer instead of switch-to-buffer.

\(fn FILE &optional SETBUF)" t nil)

(autoload 'YaTeX-switch-to-buffer-other-window "../init/yatex/yatexlib" "\
Switch to buffer if buffer exists, find file if not.

\(fn FILE)" t nil)

(autoload 'YaTeX-replace-format "../init/yatex/yatexlib" "\
In STRING, replace first appearance of FORMAT to REPL as if
function `format' does.  FORMAT does not contain `%'

\(fn STRING FORMAT REPL)" nil nil)

(autoload 'YaTeX-replace-formats "../init/yatex/yatexlib" "\


\(fn STRING REPLACE-LIST)" nil nil)

(autoload 'YaTeX-replace-format-args "../init/yatex/yatexlib" "\
Translate the argument mark #1, #2, ... #n in the STRING into the
corresponding real arguments ARGS.

\(fn STRING &rest ARGS)" nil nil)

(autoload 'rindex "../init/yatex/yatexlib" "\
Return the last position of STRING where character CHAR found.

\(fn STRING CHAR)" nil nil)

(autoload 'point-beginning-of-line "../init/yatex/yatexlib" "\


\(fn)" nil nil)

(autoload 'point-end-of-line "../init/yatex/yatexlib" "\


\(fn)" nil nil)

(autoload 'YaTeX-showup-buffer "../init/yatex/yatexlib" "\
Make BUFFER show up in certain window (but current window)
that gives the maximum value by the FUNC.  FUNC should take an argument
of its window object.  Non-nil for optional third argument SELECT selects
that window.  This function never selects minibuffer window.

\(fn BUFFER &optional FUNC SELECT)" nil nil)

(autoload 'split-window-calculate-height "../init/yatex/yatexlib" "\
Split current window wight specified HEIGHT.
If HEIGHT is number, make a new window that has HEIGHT lines.
If HEIGHT is string, make a new window that occupies HEIGT % of screen height.
Otherwise split window conventionally.

\(fn HEIGHT)" nil nil)

(autoload 'YaTeX-window-list "../init/yatex/yatexlib" "\


\(fn)" nil nil)

(autoload 'substitute-all-key-definition "../init/yatex/yatexlib" "\
Replace recursively OLDDEF with NEWDEF for any keys in KEYMAP now
defined as OLDDEF. In other words, OLDDEF is replaced with NEWDEF
where ever it appears.

\(fn OLDDEF NEWDEF KEYMAP)" nil nil)

(autoload 'YaTeX-match-string "../init/yatex/yatexlib" "\
Return (buffer-substring (match-beginning n) (match-beginning m)).

\(fn N &optional M)" nil nil)

(autoload 'YaTeX-minibuffer-complete "../init/yatex/yatexlib" "\
Complete in minibuffer.
  If the symbol 'delim is bound and is string, its value is assumed to be
the character class of delimiters.  Completion will be performed on
the last field separated by those delimiters.
  If the symbol 'quick is bound and is 't, when the try-completion results
in t, exit minibuffer immediately.

\(fn)" t nil)

(autoload 'completing-read-with-history "../init/yatex/yatexlib" "\
Completing read with general history: gmhist, Emacs-19.

\(fn PROMPT TABLE &optional PREDICATE MUST-MATCH INITIAL HSYM)" nil nil)

(autoload 'read-from-minibuffer-with-history "../init/yatex/yatexlib" "\
Read from minibuffer with general history: gmhist, Emacs-19.

\(fn PROMPT &optional INIT MAP READ HSYM)" nil nil)

(autoload 'read-string-with-history "../init/yatex/yatexlib" "\
Read string with history: gmhist(Emacs-18) and Emacs-19.

\(fn PROMPT &optional INIT HSYM)" nil nil)

(fset 'YaTeX-rassoc (if (and nil (fboundp 'rassoc) (subrp (symbol-function 'rassoc))) (symbol-function 'rassoc) #'(lambda (key list) (let ((l list)) (catch 'found (while l (if (equal key (cdr (car l))) (throw 'found (car l))) (setq l (cdr l))))))))

(autoload 'YaTeX-delete1 "../init/yatex/yatexlib" "\
Delete

\(fn ELT LIST)" nil nil)

(fset 'YaTeX-last-key (if (fboundp 'win:last-key) 'win:last-key #'(lambda nil (if (boundp 'last-command-char) last-command-char last-command-event))))

(autoload 'YaTeX-command-to-string "../init/yatex/yatexlib" "\


\(fn CMD)" nil nil)

(autoload 'YaTeX-reindent "../init/yatex/yatexlib" "\
Remove current indentation and reindento to COL column.

\(fn COL)" nil nil)

;;;***

;;;### (autoloads (YaTeX-goto-corresponding-paren YaTeX-toggle-math-mode)
;;;;;;  "../init/yatex/yatexmth" "../init/yatex/yatexmth.el" (22342
;;;;;;  25340 897577 476000))
;;; Generated autoloads from ../init/yatex/yatexmth.el

(autoload 'YaTeX-toggle-math-mode "../init/yatex/yatexmth" "\


\(fn &optional ARG)" t nil)

(autoload 'YaTeX-goto-corresponding-paren "../init/yatex/yatexmth" "\
Go to corresponding mathematical parentheses.

\(fn)" nil nil)

;;;***

;;;### (autoloads (YaTeX-make-section-with-overview YaTeX-read-section-in-minibuffer)
;;;;;;  "../init/yatex/yatexsec" "../init/yatex/yatexsec.el" (22342
;;;;;;  25340 789577 471000))
;;; Generated autoloads from ../init/yatex/yatexsec.el

(autoload 'YaTeX-read-section-in-minibuffer "../init/yatex/yatexsec" "\


\(fn PROMPT TABLE &optional DEFAULT DELIM)" t nil)

(autoload 'YaTeX-make-section-with-overview "../init/yatex/yatexsec" "\
Input sectining command with previous overview.

\(fn)" t nil)

;;;***

;;;### (autoloads (el-get el-get-self-checksum el-get-checksum el-get-make-recipes
;;;;;;  el-get-cd el-get-reinstall el-get-remove el-get-self-update
;;;;;;  el-get-update-packages-of-type el-get-update-all el-get-update
;;;;;;  el-get-install el-get-version) "el-get/el-get" "el-get/el-get.el"
;;;;;;  (22342 25132 307309 191000))
;;; Generated autoloads from el-get/el-get.el

(autoload 'el-get-version "el-get/el-get" "\
Message the current el-get version

\(fn)" t nil)

(autoload 'el-get-install "el-get/el-get" "\
Cause the named PACKAGE to be installed after all of its
dependencies (if any).

PACKAGE may be either a string or the corresponding symbol.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update "el-get/el-get" "\
Update PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'el-get-update-all "el-get/el-get" "\
Performs update of all installed packages.

\(fn &optional NO-PROMPT)" t nil)

(autoload 'el-get-update-packages-of-type "el-get/el-get" "\
Update all installed packages of type TYPE.

\(fn TYPE)" t nil)

(autoload 'el-get-self-update "el-get/el-get" "\
Update el-get itself.  The standard recipe takes care of reloading the code.

\(fn)" t nil)

(autoload 'el-get-remove "el-get/el-get" "\
Remove any PACKAGE that is know to be installed or required.

\(fn PACKAGE)" t nil)

(autoload 'el-get-reinstall "el-get/el-get" "\
Remove PACKAGE and then install it again.

\(fn PACKAGE)" t nil)

(autoload 'el-get-cd "el-get/el-get" "\
Open dired in the package directory.

\(fn PACKAGE)" t nil)

(autoload 'el-get-make-recipes "el-get/el-get" "\
Loop over `el-get-sources' and write a recipe file for each
entry which is not a symbol and is not already a known recipe.

\(fn &optional DIR)" t nil)

(autoload 'el-get-checksum "el-get/el-get" "\
Compute the checksum of the given package, and put it in the kill-ring

\(fn PACKAGE)" t nil)

(autoload 'el-get-self-checksum "el-get/el-get" "\
Compute the checksum of the running version of el-get itself.

Also put the checksum in the kill-ring.

\(fn)" t nil)

(autoload 'el-get "el-get/el-get" "\
Ensure that packages have been downloaded once and init them as needed.

This will not update the sources by using `apt-get install' or
`git pull', but it will ensure that:

* the packages have been installed
* load-path is set so their elisp files can be found
* Info-directory-list is set so their info files can be found
* Autoloads have been prepared and evaluated for each package
* Any post-installation setup (e.g. `(require 'feature)') happens

When SYNC is nil (the default), all installations run
concurrently, in the background.

When SYNC is 'sync, each package will be installed synchronously,
and any error will stop it all.

Please note that the `el-get-init' part of `el-get' is always
done synchronously. There's `byte-compile' support though, and
the packages you use are welcome to use `autoload' too.

PACKAGES is expected to be a list of packages you want to install
or init.  When PACKAGES is omited (the default), the list of
already installed packages is considered.

\(fn &optional SYNC &rest PACKAGES)" nil nil)

;;;***

;;;### (autoloads (el-get-bundle! el-get-bundle el-get-bundle-el-get)
;;;;;;  "el-get/el-get-bundle" "el-get/el-get-bundle.el" (22342 25132
;;;;;;  307309 191000))
;;; Generated autoloads from el-get/el-get-bundle.el

(autoload 'el-get-bundle-el-get "el-get/el-get-bundle" "\


\(fn SRC)" nil nil)

(autoload 'el-get-bundle "el-get/el-get-bundle" "\
Install PACKAGE and run initialization FORM.

PACKAGE can be either a simple package name or a package name
with a modifier before the name to specify local recipe source
information:

* `<owner>/' : specifies a Github owner name
* `gist:<id>' : specifies a Gist ID
* `<type>:' : specifies a type of the package source

If `FEATURE in PACKAGE' form is used instead of PACKAGE, then
that FEATURE is `require'd after installing PACKAGE.  You can
also use `el-get-bundle!' macro if FEATURE and PACKAGE are the
same.  If you wish to `require' more than one feature, then use
`:features' property in FORM.

The initialization FORM may start with a property list that
describes a local recipe.  The FORM after the property list is
treated as initialization code, which is actually an `:after'
property of the local recipe.

A copy of the initialization code is stored in a directory
specified by `el-get-bundle-init-directory' and its byte-compiled
version is used if `el-get-bundle-byte-compile' is non-nil.

\(fn PACKAGE &rest FORM)" nil t)

(put 'el-get-bundle 'lisp-indent-function 'defun)

(autoload 'el-get-bundle! "el-get/el-get-bundle" "\
Install PACKAGE and run initialization form.
It is the same as `el-get-bundle' except that PACKAGE is explicitly
required.

\(fn PACKAGE &rest ARGS)" nil t)

(put 'el-get-bundle! 'lisp-indent-function 'defun)

;;;***

;;;### (autoloads (el-get-check-recipe) "el-get/el-get-check" "el-get/el-get-check.el"
;;;;;;  (22342 25132 307309 191000))
;;; Generated autoloads from el-get/el-get-check.el

(autoload 'el-get-check-recipe "el-get/el-get-check" "\
Check the format of the recipe.
Please run this command before sending a pull request.
Usage: M-x el-get-check-recipe RET

You can run this function from checker script like this:
    test/check-recipe.el PATH/TO/RECIPE.rcp

When used as a lisp function, FILE-OR-BUFFER must be a buffer
object or a file path.

\(fn FILE-OR-BUFFER)" t nil)

;;;***

;;;### (autoloads (el-get-list-packages) "el-get/el-get-list-packages"
;;;;;;  "el-get/el-get-list-packages.el" (22342 25132 307309 191000))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../init/auto-complete/auto-complete-pkg.el"
;;;;;;  "../init/dash/dash-functional.el" "../init/dash/dash.el"
;;;;;;  "../init/epl/epl.el" "../init/flycheck/flycheck-buttercup.el"
;;;;;;  "../init/flycheck/flycheck-ert.el" "../init/fuzzy/fuzzy.el"
;;;;;;  "../init/let-alist/let-alist-autoloads.el" "../init/let-alist/let-alist-pkg.el"
;;;;;;  "../init/popup/popup.el" "../init/seq/seq-24.el" "../init/seq/seq-25.el"
;;;;;;  "../init/seq/seq.el" "../init/yasnippet/yasnippet-debug.el"
;;;;;;  "../init/yasnippet/yasnippet-tests.el" "../init/yatex/comment.el"
;;;;;;  "../init/yatex/yahtml.el" "../init/yatex/yatex.el" "../init/yatex/yatex19.el"
;;;;;;  "../init/yatex/yatex23.el" "../init/yatex/yatexadd.el" "../init/yatex/yatexgen.el"
;;;;;;  "../init/yatex/yatexhie.el" "../init/yatex/yatexhks.el" "../init/yatex/yatexinf.el"
;;;;;;  "../init/yatex/yatexm-o.el" "../init/yatex/yatexpkg.el" "../init/yatex/yatexprc.el"
;;;;;;  "el-get/el-get-autoloading.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el") (22342
;;;;;;  25340 994993 342000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
