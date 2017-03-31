;;; .loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (anzu-isearch-query-replace-regexp anzu-isearch-query-replace
;;;;;;  anzu-replace-at-cursor-thing anzu-query-replace-regexp anzu-query-replace
;;;;;;  anzu-query-replace-at-cursor-thing anzu-query-replace-at-cursor
;;;;;;  global-anzu-mode anzu-mode) "../init/anzu/anzu" "../init/anzu/anzu.el"
;;;;;;  (22598 31822 26405 726000))
;;; Generated autoloads from ../init/anzu/anzu.el

(autoload 'anzu-mode "../init/anzu/anzu" "\
minor-mode which display search information in mode-line.

\(fn &optional ARG)" t nil)

(defvar global-anzu-mode nil "\
Non-nil if Global-Anzu mode is enabled.
See the command `global-anzu-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-anzu-mode'.")

(custom-autoload 'global-anzu-mode "../init/anzu/anzu" nil)

(autoload 'global-anzu-mode "../init/anzu/anzu" "\
Toggle Anzu mode in all buffers.
With prefix ARG, enable Global-Anzu mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Anzu mode is enabled in all buffers where
`anzu--turn-on' would do it.
See `anzu-mode' for more information on Anzu mode.

\(fn &optional ARG)" t nil)

(autoload 'anzu-query-replace-at-cursor "../init/anzu/anzu" "\
Replace symbol at cursor with to-string.

\(fn)" t nil)

(autoload 'anzu-query-replace-at-cursor-thing "../init/anzu/anzu" "\
Replace symbol at cursor within `anzu-replace-at-cursor-thing' area.

\(fn)" t nil)

(autoload 'anzu-query-replace "../init/anzu/anzu" "\
anzu version of `query-replace'.

\(fn ARG)" t nil)

(autoload 'anzu-query-replace-regexp "../init/anzu/anzu" "\
anzu version of `query-replace-regexp'.

\(fn ARG)" t nil)

(autoload 'anzu-replace-at-cursor-thing "../init/anzu/anzu" "\
anzu-query-replace-at-cursor-thing without query.

\(fn)" t nil)

(autoload 'anzu-isearch-query-replace "../init/anzu/anzu" "\
anzu version of `isearch-query-replace'.

\(fn ARG)" t nil)

(autoload 'anzu-isearch-query-replace-regexp "../init/anzu/anzu" "\
anzu version of `isearch-query-replace-regexp'.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (global-auto-complete-mode auto-complete-mode auto-complete)
;;;;;;  "../init/auto-complete/auto-complete" "../init/auto-complete/auto-complete.el"
;;;;;;  (22598 31821 154405 691000))
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
;;;;;;  "../init/auto-complete/auto-complete-config.el" (22598 31821
;;;;;;  154405 691000))
;;; Generated autoloads from ../init/auto-complete/auto-complete-config.el

(autoload 'ac-config-default "../init/auto-complete/auto-complete-config" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads (er/expand-region) "../init/expand-region/expand-region"
;;;;;;  "../init/expand-region/expand-region.el" (22749 64189 595108
;;;;;;  919000))
;;; Generated autoloads from ../init/expand-region/expand-region.el

(autoload 'er/expand-region "../init/expand-region/expand-region" "\
Increase selected region by semantic units.

With prefix argument expands the region that many times.
If prefix argument is negative calls `er/contract-region'.
If prefix argument is 0 it resets point and mark to their state
before calling `er/expand-region' for the first time.

\(fn ARG)" t nil)

;;;***

;;;### (autoloads (expand-region-smart-cursor expand-region-exclude-text-mode-expansions
;;;;;;  expand-region-reset-fast-key expand-region-contract-fast-key
;;;;;;  expand-region-fast-keys-enabled expand-region-skip-whitespace
;;;;;;  expand-region-autocopy-register expand-region-guess-python-mode
;;;;;;  expand-region-preferred-python-mode expand-region) "../init/expand-region/expand-region-custom"
;;;;;;  "../init/expand-region/expand-region-custom.el" (22749 64189
;;;;;;  595108 919000))
;;; Generated autoloads from ../init/expand-region/expand-region-custom.el

(let ((loads (get 'expand-region 'custom-loads))) (if (member '"../init/expand-region/expand-region-custom" loads) nil (put 'expand-region 'custom-loads (cons '"../init/expand-region/expand-region-custom" loads))))

(defvar expand-region-preferred-python-mode 'python "\
The name of your preferred python mode")

(custom-autoload 'expand-region-preferred-python-mode "../init/expand-region/expand-region-custom" t)

(defvar expand-region-guess-python-mode t "\
If expand-region should attempt to guess your preferred python mode")

(custom-autoload 'expand-region-guess-python-mode "../init/expand-region/expand-region-custom" t)

(defvar expand-region-autocopy-register "" "\
If set to a string of a single character (try \"e\"), then the
contents of the most recent expand or contract command will
always be copied to the register named after that character.")

(custom-autoload 'expand-region-autocopy-register "../init/expand-region/expand-region-custom" t)

(defvar expand-region-skip-whitespace t "\
If expand-region should skip past whitespace on initial expansion")

(custom-autoload 'expand-region-skip-whitespace "../init/expand-region/expand-region-custom" t)

(defvar expand-region-fast-keys-enabled t "\
If expand-region should bind fast keys after initial expand/contract")

(custom-autoload 'expand-region-fast-keys-enabled "../init/expand-region/expand-region-custom" t)

(defvar expand-region-contract-fast-key "-" "\
Key to use after an initial expand/contract to contract once more.")

(custom-autoload 'expand-region-contract-fast-key "../init/expand-region/expand-region-custom" t)

(defvar expand-region-reset-fast-key "0" "\
Key to use after an initial expand/contract to undo.")

(custom-autoload 'expand-region-reset-fast-key "../init/expand-region/expand-region-custom" t)

(defvar expand-region-exclude-text-mode-expansions '(html-mode nxml-mode) "\
List of modes which derive from `text-mode' for which text mode expansions are not appropriate.")

(custom-autoload 'expand-region-exclude-text-mode-expansions "../init/expand-region/expand-region-custom" t)

(defvar expand-region-smart-cursor nil "\
Defines whether the cursor should be placed intelligently after expansion.

If set to t, and the cursor is already at the beginning of the new region,
keep it there; otherwise, put it at the end of the region.

If set to nil, always place the cursor at the beginning of the region.")

(custom-autoload 'expand-region-smart-cursor "../init/expand-region/expand-region-custom" t)

;;;***

;;;### (autoloads (flycheck-def-option-var flycheck-def-config-file-var
;;;;;;  flycheck-define-command-checker flycheck-define-error-level
;;;;;;  global-flycheck-mode flycheck-mode flycheck-manual) "../init/flycheck/flycheck"
;;;;;;  "../init/flycheck/flycheck.el" (22598 31825 458405 866000))
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

;;;### (autoloads (google-translate-at-point-reverse google-translate-at-point
;;;;;;  google-translate-query-translate-reverse google-translate-query-translate)
;;;;;;  "../init/google-translate/google-translate-default-ui" "../init/google-translate/google-translate-default-ui.el"
;;;;;;  (22598 31821 134405 690000))
;;; Generated autoloads from ../init/google-translate/google-translate-default-ui.el

(autoload 'google-translate-query-translate "../init/google-translate/google-translate-default-ui" "\
Interactively translate text with Google Translate.

Query a text (a word or a phrase), and pop up a buffer named *Google
Translate* displaying available translations of the text.

If no defaults for the source and target languages are specified (by
setting the variables `google-translate-default-source-language' and
`google-translate-default-target-language'), interactively query the
missing parts.  For example, a reasonable option may be to specify a
default for the target language and always be queried for the source
language.

With a `C-u' prefix argument, query the source and target languages,
even if any defaults are specified.  For example, you may frequently
need to translate from English to Russian, and you may choose to set
the default source and target languages to \"en\" and  \"ru\", resp.
However, occasionally you may also need to translate from Russian to
English.  With a `C-u' prefix argument you can override the defaults
and specify the source and target languages explicitly.

The languages are queried with completion, and the null input at the
source language prompt is considered as an instruction for Google
Translate to detect the source language.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-query-translate-reverse "../init/google-translate/google-translate-default-ui" "\
Like `google-translate-query-translate', but performs translation
in the reverse direction.

The value of the variable `google-translate-default-source-language'
\(if set) becomes the target language, and the value of the variable
`google-translate-default-target-language' (if also set) becomes the
source language.

In particular, when both variables are set, translation is performed
in the reverse direction.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-at-point "../init/google-translate/google-translate-default-ui" "\
Translate the word at point or the words in the active region.

For the meaning of OVERRIDE-P, see `google-translate-query-translate'.

\(fn &optional OVERRIDE-P)" t nil)

(autoload 'google-translate-at-point-reverse "../init/google-translate/google-translate-default-ui" "\
Like `google-translate-at-point', but performs translation in the
reverse direction.

\(fn &optional OVERRIDE-P)" t nil)

;;;***

;;;### (autoloads (google-translate-smooth-translate) "../init/google-translate/google-translate-smooth-ui"
;;;;;;  "../init/google-translate/google-translate-smooth-ui.el"
;;;;;;  (22598 31821 134405 690000))
;;; Generated autoloads from ../init/google-translate/google-translate-smooth-ui.el

(autoload 'google-translate-smooth-translate "../init/google-translate/google-translate-smooth-ui" "\
Translate a text using translation directions.

Make a prompt in minibuffer for a text to translate. Default text
is word at point.

In case of `google-translate-translation-directions-alist' is
empty list then after inputed translating text prompts for source
language and then for target languages.

In case of `google-translate-translation-directions-alist' is not
empty list takes current translation direction and makes
appropriate translation. Current translation direction indicates
in the minibuffers' prompt.

A current translation direction could be changed directly in the
minibuffer by means of key bindings such as C-n and C-p for
changing to the next translation direction and to the previous
one respectively.

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-do-ag-buffers helm-ag-buffers helm-do-ag-project-root
;;;;;;  helm-ag-project-root helm-do-ag helm-do-ag-this-file helm-ag
;;;;;;  helm-ag-this-file helm-ag-clear-stack helm-ag-pop-stack)
;;;;;;  "../init/helm-ag/helm-ag" "../init/helm-ag/helm-ag.el" (22598
;;;;;;  31821 26405 686000))
;;; Generated autoloads from ../init/helm-ag/helm-ag.el

(autoload 'helm-ag-pop-stack "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-ag-clear-stack "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-ag-this-file "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-ag "../init/helm-ag/helm-ag" "\


\(fn &optional BASEDIR)" t nil)

(autoload 'helm-do-ag-this-file "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-do-ag "../init/helm-ag/helm-ag" "\


\(fn &optional BASEDIR TARGETS)" t nil)

(autoload 'helm-ag-project-root "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-do-ag-project-root "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-ag-buffers "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

(autoload 'helm-do-ag-buffers "../init/helm-ag/helm-ag" "\


\(fn)" t nil)

;;;***

;;;### (autoloads (helm-descbinds helm-descbinds-uninstall helm-descbinds-install
;;;;;;  helm-descbinds-mode) "../init/helm-descbinds/helm-descbinds"
;;;;;;  "../init/helm-descbinds/helm-descbinds.el" (22598 31820 782405
;;;;;;  676000))
;;; Generated autoloads from ../init/helm-descbinds/helm-descbinds.el

(defvar helm-descbinds-mode nil "\
Non-nil if Helm-Descbinds mode is enabled.
See the command `helm-descbinds-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `helm-descbinds-mode'.")

(custom-autoload 'helm-descbinds-mode "../init/helm-descbinds/helm-descbinds" nil)

(autoload 'helm-descbinds-mode "../init/helm-descbinds/helm-descbinds" "\
Use `helm' for `describe-bindings'.

\(fn &optional ARG)" t nil)

(autoload 'helm-descbinds-install "../init/helm-descbinds/helm-descbinds" "\
Use `helm-descbinds' as a replacement of `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds-uninstall "../init/helm-descbinds/helm-descbinds" "\
Restore original `describe-bindings'.

\(fn)" t nil)

(autoload 'helm-descbinds "../init/helm-descbinds/helm-descbinds" "\
A convenient helm version of `describe-bindings'.

Turning on `helm-descbinds-mode' is the recommended way to
install this command to replace `describe-bindings'.

You complete against a list of keys + command pairs presented in
a similar way as `describe-bindings' does, split into sections
defined by the types of the key bindings (minor and major modes,
global bindings, etc).

The default action executes a command as if the binding had been
entered, or narrows the commands according to a prefix key,
respectively.

The persistent action pops up a help buffer for the selected
command without quitting.

For key translation maps, the default actions are not very
useful, yet they are listed for completeness.

\(fn &optional PREFIX BUFFER)" t nil)

;;;***

;;;### (autoloads (highlight-symbol-occur highlight-symbol-query-replace
;;;;;;  highlight-symbol-nav-mode highlight-symbol-prev-in-defun
;;;;;;  highlight-symbol-next-in-defun highlight-symbol-prev highlight-symbol-next
;;;;;;  highlight-symbol-count highlight-symbol-list-all highlight-symbol-remove-all
;;;;;;  highlight-symbol highlight-symbol-mode) "../init/highlight-symbol/highlight-symbol"
;;;;;;  "../init/highlight-symbol/highlight-symbol.el" (22749 63584
;;;;;;  799125 311000))
;;; Generated autoloads from ../init/highlight-symbol/highlight-symbol.el

(autoload 'highlight-symbol-mode "../init/highlight-symbol/highlight-symbol" "\
Minor mode that highlights the symbol under point throughout the buffer.
Highlighting takes place after `highlight-symbol-idle-delay'.

\(fn &optional ARG)" t nil)

(defalias 'highlight-symbol-at-point 'highlight-symbol)

(autoload 'highlight-symbol "../init/highlight-symbol/highlight-symbol" "\
Toggle highlighting of the symbol at point.
This highlights or unhighlights the symbol at point using the first
element in of `highlight-symbol-faces'.

\(fn &optional SYMBOL)" t nil)

(autoload 'highlight-symbol-remove-all "../init/highlight-symbol/highlight-symbol" "\
Remove symbol highlighting in buffer.

\(fn)" t nil)

(autoload 'highlight-symbol-list-all "../init/highlight-symbol/highlight-symbol" "\
List all symbols highlighted in the buffer.

\(fn)" t nil)

(autoload 'highlight-symbol-count "../init/highlight-symbol/highlight-symbol" "\
Print the number of occurrences of symbol at point.

\(fn &optional SYMBOL MESSAGE-P)" t nil)

(autoload 'highlight-symbol-next "../init/highlight-symbol/highlight-symbol" "\
Jump to the next location of the symbol at point within the buffer.

\(fn)" t nil)

(autoload 'highlight-symbol-prev "../init/highlight-symbol/highlight-symbol" "\
Jump to the previous location of the symbol at point within the buffer.

\(fn)" t nil)

(autoload 'highlight-symbol-next-in-defun "../init/highlight-symbol/highlight-symbol" "\
Jump to the next location of the symbol at point within the defun.

\(fn)" t nil)

(autoload 'highlight-symbol-prev-in-defun "../init/highlight-symbol/highlight-symbol" "\
Jump to the previous location of the symbol at point within the defun.

\(fn)" t nil)

(autoload 'highlight-symbol-nav-mode "../init/highlight-symbol/highlight-symbol" "\
Navigate occurrences of the symbol at point.

When called interactively, toggle `highlight-symbol-nav-mode'.
With prefix ARG, enable `highlight-symbol-nav-mode' if ARG is
positive, otherwise disable it.

When called from Lisp, enable `highlight-symbol-nav-mode' if ARG
is omitted, nil or positive.  If ARG is `toggle', toggle
`highlight-symbol-nav-mode'.  Otherwise behave as if called
interactively.

In `highlight-symbol-nav-mode' provide the following key bindings
to navigate between occurrences of the symbol at point in the
current buffer.

\\{highlight-symbol-nav-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'highlight-symbol-query-replace "../init/highlight-symbol/highlight-symbol" "\
Replace the symbol at point with REPLACEMENT.

\(fn REPLACEMENT)" t nil)

(autoload 'highlight-symbol-occur "../init/highlight-symbol/highlight-symbol" "\
Call `occur' with the symbol at point.
Each line is displayed with NLINES lines before and after, or -NLINES
before if NLINES is negative.

\(fn &optional NLINES)" t nil)

;;;***

;;;### (autoloads (jedi:auto-complete-mode jedi:complete jedi:ac-setup)
;;;;;;  "../init/jedi/jedi" "../init/jedi/jedi.el" (22596 58930 699096
;;;;;;  932000))
;;; Generated autoloads from ../init/jedi/jedi.el

(autoload 'jedi:ac-setup "../init/jedi/jedi" "\
Add Jedi AC sources to `ac-sources'.

If auto-completion is all you need, you can call this function instead
of `jedi:setup', like this::

   (add-hook 'python-mode-hook 'jedi:ac-setup)

Note that this function calls `auto-complete-mode' if it is not
already enabled, for people who don't call `global-auto-complete-mode'
in their Emacs configuration.

\(fn)" t nil)

(autoload 'jedi:complete "../init/jedi/jedi" "\
Complete code at point.

\(fn &key (expand ac-expand-on-auto-complete))" t nil)

(autoload 'jedi:auto-complete-mode "../init/jedi/jedi" "\


\(fn)" nil nil)

(setq jedi:setup-function #'jedi:ac-setup jedi:mode-function #'jedi:auto-complete-mode)

;;;***

;;;### (autoloads (jedi:install-server-block jedi:install-server
;;;;;;  jedi:setup anything-jedi-related-names helm-jedi-related-names
;;;;;;  jedi:start-dedicated-server) "../init/jedi/jedi-core" "../init/jedi/jedi-core.el"
;;;;;;  (22596 58930 699096 932000))
;;; Generated autoloads from ../init/jedi/jedi-core.el

(autoload 'jedi:start-dedicated-server "../init/jedi/jedi-core" "\
Start Jedi server dedicated to this buffer.
This is useful, for example, when you want to use different
`sys.path' for some buffer.  When invoked as an interactive
command, it asks you how to start the Jedi server.  You can edit
the command in minibuffer to specify the way Jedi server run.

If you want to setup how Jedi server is started programmatically
per-buffer/per-project basis, make `jedi:server-command' and
`jedi:server-args' buffer local and set it in `python-mode-hook'.
See also: `jedi:server-args'.

\(fn COMMAND)" t nil)

(autoload 'helm-jedi-related-names "../init/jedi/jedi-core" "\
Find related names of the object at point using `helm' interface.

\(fn)" t nil)

(autoload 'anything-jedi-related-names "../init/jedi/jedi-core" "\
Find related names of the object at point using `anything' interface.

\(fn)" t nil)

(autoload 'jedi:setup "../init/jedi/jedi-core" "\
Fully setup jedi.el for current buffer.
It setups `ac-sources' or `company-backends' and turns
`jedi-mode' on.

This function is intended to be called from `python-mode-hook',
like this::

       (add-hook 'python-mode-hook 'jedi:setup)

You can also call this function as a command, to quickly test
what jedi can do.

\(fn)" t nil)

(autoload 'jedi:install-server "../init/jedi/jedi-core" "\
This command installs Jedi server script jediepcserver.py in a
Python environment dedicated to Emacs.  By default, the
environment is at ``~/.emacs.d/.python-environments/default/``.
This environment is automatically created by ``virtualenv`` if it
does not exist.

Run this command (i.e., type ``M-x jedi:install-server RET``)
whenever Jedi.el shows a message to do so.  It is a good idea to
run this every time after you update Jedi.el to sync version of
Python modules used by Jedi.el and Jedi.el itself.

You can modify the location of the environment by changing
`jedi:environment-root' and/or `python-environment-directory'.  More
specifically, Jedi.el will install Python modules under the directory
``PYTHON-ENVIRONMENT-DIRECTORY/JEDI:ENVIRONMENT-ROOT``.  Note that you
need command line program ``virtualenv``.  If you have the command in
an unusual location, use `python-environment-virtualenv' to specify the
location.

.. NOTE:: jediepcserver.py is installed in a virtual environment but it
   does not mean Jedi.el cannot recognize the modules in virtual
   environment you are using for your Python development.  Jedi
   EPC server recognize the virtualenv it is in (i.e., the
   environment variable ``VIRTUAL_ENV`` in your Emacs) and then
   add modules in that environment to its ``sys.path``.  You can
   also add ``--virtual-env PATH/TO/ENV`` to `jedi:server-args'
   to include modules of virtual environment even you launch
   Emacs outside of the virtual environment.

.. NOTE:: It is highly recommended to use this command to install
   Python modules for Jedi.el.  You still can install Python
   modules used by Jedi.el manually.  However, you are then
   responsible for keeping Jedi.el and Python modules compatible.

See also:

- https://github.com/tkf/emacs-jedi/pull/72
- https://github.com/tkf/emacs-jedi/issues/140#issuecomment-37358527

\(fn)" t nil)

(autoload 'jedi:install-server-block "../init/jedi/jedi-core" "\
Blocking version `jedi:install-server'.

\(fn)" nil nil)

;;;***

;;;### (autoloads (let-alist) "../init/let-alist/let-alist" "../init/let-alist/let-alist.el"
;;;;;;  (22346 20008 832014 318000))
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

;;;### (autoloads (matlab-cedet-setup) "../init/matlab-mode/cedet-matlab"
;;;;;;  "../init/matlab-mode/cedet-matlab.el" (22598 31834 398406
;;;;;;  229000))
;;; Generated autoloads from ../init/matlab-mode/cedet-matlab.el

(autoload 'matlab-cedet-setup "../init/matlab-mode/cedet-matlab" "\
Update various paths to get SRecode to identify our macros.

\(fn)" t nil)

;;;***

;;;### (autoloads (company-matlab-shell) "../init/matlab-mode/company-matlab-shell"
;;;;;;  "../init/matlab-mode/company-matlab-shell.el" (22598 31834
;;;;;;  466406 231000))
;;; Generated autoloads from ../init/matlab-mode/company-matlab-shell.el

(autoload 'company-matlab-shell "../init/matlab-mode/company-matlab-shell" "\
A `company-mode' completion back-end for Matlab-Shell.

\(fn COMMAND &optional ARG &rest IGNORED)" t nil)

;;;***

;;;### (autoloads (enable-visual-studio-bookmarks) "../init/matlab-mode/linemark"
;;;;;;  "../init/matlab-mode/linemark.el" (22598 31834 2406 213000))
;;; Generated autoloads from ../init/matlab-mode/linemark.el

(autoload 'enable-visual-studio-bookmarks "../init/matlab-mode/linemark" "\
Bind the viss bookmark functions to F2 related keys.
\\<global-map>
\\[viss-bookmark-toggle]     - To=ggle a bookmark on this line.
\\[viss-bookmark-next-buffer]   - Move to the next bookmark.
\\[viss-bookmark-prev-buffer]   - Move to the previous bookmark.
\\[viss-bookmark-clear-all-buffer] - Clear all bookmarks.

\(fn)" t nil)

;;;***

;;;### (autoloads (matlab-shell matlab-mode) "../init/matlab-mode/matlab"
;;;;;;  "../init/matlab-mode/matlab.el" (22598 31834 34406 214000))
;;; Generated autoloads from ../init/matlab-mode/matlab.el

(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))

(autoload 'matlab-mode "../init/matlab-mode/matlab" "\
MATLAB(R) mode is a major mode for editing MATLAB dot-m files.
\\<matlab-mode-map>
Convenient editing commands are:
 \\[matlab-comment-region]   - Comment/Uncomment out a region of code.
 \\[matlab-fill-comment-line] - Fill the current comment line.
 \\[matlab-fill-region] - Fill code and comments in region.
 \\[matlab-fill-paragraph]     - Refill the current command or comment.
 \\[matlab-complete-symbol]   - Symbol completion of matlab symbolsbased on the local syntax.
 \\[matlab-indent-sexp] - Indent syntactic block of code.

Convenient navigation commands are:
 \\[matlab-beginning-of-command]   - Move to the beginning of a command.
 \\[matlab-end-of-command]   - Move to the end of a command.
 \\[matlab-beginning-of-defun] - Move to the beginning of a function.
 \\[matlab-end-of-defun] - Move do the end of a function.
 \\[matlab-forward-sexp] - Move forward over a syntactic block of code.
 \\[matlab-backward-sexp] - Move backwards over a syntactic block of code.

Convenient template insertion commands:
 \\[tempo-template-matlab-function] - Insert a function definition.
 \\[tempo-template-matlab-if] - Insert an IF END block.
 \\[tempo-template-matlab-for] - Insert a FOR END block.
 \\[tempo-template-matlab-switch] - Insert a SWITCH END statement.
 \\[matlab-insert-next-case] - Insert the next CASE condition in a SWITCH.
 \\[matlab-insert-end-block] - Insert a matched END statement.  With optional ARG, reindent.
 \\[matlab-stringify-region] - Convert plaintext in region to a string with correctly quoted chars.

Variables:
  `matlab-indent-level'		Level to indent blocks.
  `matlab-cont-level'		Level to indent continuation lines.
  `matlab-cont-requires-ellipsis' Does your MATLAB support implied elipsis.
  `matlab-case-level'		Level to unindent case statements.
  `matlab-indent-past-arg1-functions'
                                Regexp of functions to indent past the first
                                  argument on continuation lines.
  `matlab-maximum-indents'      List of maximum indents during lineups.
  `matlab-comment-column'       Goal column for on-line comments.
  `fill-column'			Column used in auto-fill.
  `matlab-indent-function-body' If non-nil, indents body of MATLAB functions.
  `matlab-functions-have-end'	If non-nil, MATLAB functions terminate with end.
  `matlab-return-function'	Customize RET handling with this function.
  `matlab-auto-fill'            Non-nil, do auto-fill at startup.
  `matlab-fill-code'            Non-nil, auto-fill code.
  `matlab-fill-strings'         Non-nil, auto-fill strings.
  `matlab-verify-on-save-flag'  Non-nil, enable code checks on save.
  `matlab-highlight-block-match-flag'
                                Enable matching block begin/end keywords.
  `matlab-vers-on-startup'	If t, show version on start-up.
  `matlab-handle-simulink'      If t, enable simulink keyword highlighting.

All Key Bindings:
\\{matlab-mode-map}

\(fn)" t nil)

(autoload 'matlab-shell "../init/matlab-mode/matlab" "\
Create a buffer with MATLAB running as a subprocess.

MATLAB shell cannot work on the MS Windows platform because MATLAB is not
a console application.

\(fn)" t nil)

;;;***

;;;### (autoloads (mlint-minor-mode) "../init/matlab-mode/mlint"
;;;;;;  "../init/matlab-mode/mlint.el" (22598 31834 194406 220000))
;;; Generated autoloads from ../init/matlab-mode/mlint.el

(autoload 'mlint-minor-mode "../init/matlab-mode/mlint" "\
Toggle mlint minor mode, a mode for showing mlint errors.
With prefix ARG, turn mlint minor mode on iff ARG is positive.
\\{mlint-minor-mode-map\\}

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (semantic-default-matlab-setup) "../init/matlab-mode/semantic-matlab"
;;;;;;  "../init/matlab-mode/semantic-matlab.el" (22598 31833 866406
;;;;;;  207000))
;;; Generated autoloads from ../init/matlab-mode/semantic-matlab.el

(autoload 'semantic-default-matlab-setup "../init/matlab-mode/semantic-matlab" "\
Set up a buffer for parsing of MATLAB files.

\(fn)" nil nil)

;;;***

;;;### (autoloads (srecode-semantic-handle-:matlab) "../init/matlab-mode/srecode-matlab"
;;;;;;  "../init/matlab-mode/srecode-matlab.el" (22598 31834 70406
;;;;;;  215000))
;;; Generated autoloads from ../init/matlab-mode/srecode-matlab.el

(autoload 'srecode-semantic-handle-:matlab "../init/matlab-mode/srecode-matlab" "\
Add macros into the dictionary DICT based on the current MATLAB buffer.
Adds the following:
FILE_SYMBOL - The file name as a symbol.
FILE_DOC_SYMBOL - The file name as a symbol for doc strings.
PACKAGE - The package this file is in, or empty if none.
FILE_CLASS - Show section if filename should be a class.
FILE_FUNCTION - Show setion if filename is a function.

On class prediction - when filling in an empty file, if the filename and directory it is in
match, for example @foo/foo.m then foo should be a classdef.

\(fn DICT)" nil nil)

;;;***

;;;### (autoloads (tlc-mode) "../init/matlab-mode/tlc" "../init/matlab-mode/tlc.el"
;;;;;;  (22598 31834 102406 217000))
;;; Generated autoloads from ../init/matlab-mode/tlc.el

(autoload 'tlc-mode "../init/matlab-mode/tlc" "\
Major mode for editing Tlc files, or files found in tlc directories.

\(fn)" t nil)
(add-to-list 'auto-mode-alist '("\\.tlc$" . tlc-mode))

;;;***

;;;### (autoloads (mc/edit-beginnings-of-lines mc/edit-ends-of-lines
;;;;;;  mc/edit-lines) "../init/multiple-cursors/mc-edit-lines" "../init/multiple-cursors/mc-edit-lines.el"
;;;;;;  (22750 12018 600027 425000))
;;; Generated autoloads from ../init/multiple-cursors/mc-edit-lines.el

(autoload 'mc/edit-lines "../init/multiple-cursors/mc-edit-lines" "\
Add one cursor to each line of the active region.
Starts from mark and moves in straight down or up towards the
line point is on.

What is done with lines which are not long enough is governed by
`mc/edit-lines-empty-lines'.  The prefix argument ARG can be used
to override this.  If ARG is a symbol (when called from Lisp),
that symbol is used instead of `mc/edit-lines-empty-lines'.
Otherwise, if ARG negative, short lines will be ignored.  Any
other non-nil value will cause short lines to be padded.

\(fn &optional ARG)" t nil)

(autoload 'mc/edit-ends-of-lines "../init/multiple-cursors/mc-edit-lines" "\
Add one cursor to the end of each line in the active region.

\(fn)" t nil)

(autoload 'mc/edit-beginnings-of-lines "../init/multiple-cursors/mc-edit-lines" "\
Add one cursor to the beginning of each line in the active region.

\(fn)" t nil)

;;;***

;;;### (autoloads (mc-hide-unmatched-lines-mode) "../init/multiple-cursors/mc-hide-unmatched-lines-mode"
;;;;;;  "../init/multiple-cursors/mc-hide-unmatched-lines-mode.el"
;;;;;;  (22750 12018 600027 425000))
;;; Generated autoloads from ../init/multiple-cursors/mc-hide-unmatched-lines-mode.el

(autoload 'mc-hide-unmatched-lines-mode "../init/multiple-cursors/mc-hide-unmatched-lines-mode" "\
Minor mode when enabled hides all lines where no cursors (and
also hum/lines-to-expand below and above) To make use of this
mode press \"C-'\" while multiple-cursor-mode is active. You can
still edit lines while you are in mc-hide-unmatched-lines
mode. To leave this mode press <return> or \"C-g\"

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (mc/mark-sgml-tag-pair mc/toggle-cursor-on-click
;;;;;;  mc/mark-all-symbols-like-this-in-defun mc/mark-all-words-like-this-in-defun
;;;;;;  mc/mark-all-like-this-in-defun mc/mark-all-dwim mc/mark-all-like-this-dwim
;;;;;;  mc/mark-more-like-this-extended mc/mark-all-in-region-regexp
;;;;;;  mc/mark-all-in-region mc/mark-all-symbols-like-this mc/mark-all-words-like-this
;;;;;;  mc/mark-all-like-this mc/skip-to-previous-like-this mc/skip-to-next-like-this
;;;;;;  mc/unmark-previous-like-this mc/unmark-next-like-this mc/mark-previous-lines
;;;;;;  mc/mark-next-lines mc/mark-previous-symbol-like-this mc/mark-previous-word-like-this
;;;;;;  mc/mark-previous-like-this-word mc/mark-previous-like-this
;;;;;;  mc/mark-next-symbol-like-this mc/mark-next-word-like-this
;;;;;;  mc/mark-next-like-this-word mc/mark-next-like-this) "../init/multiple-cursors/mc-mark-more"
;;;;;;  "../init/multiple-cursors/mc-mark-more.el" (22750 12018 600027
;;;;;;  425000))
;;; Generated autoloads from ../init/multiple-cursors/mc-mark-more.el

(autoload 'mc/mark-next-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the next part of the buffer matching the currently active region
If no region is active add a cursor on the next line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-like-this-word "../init/multiple-cursors/mc-mark-more" "\
Find and mark the next part of the buffer matching the currently active region
If no region is active, mark the word at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-word-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the next word of the buffer matching the currently active region
The matching region must be a whole word to be a match
If no region is active, mark the symbol at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-symbol-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the next symbol of the buffer matching the currently active region
The matching region must be a whole symbol to be a match
If no region is active, mark the symbol at the point and find the next match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-like-this-word "../init/multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
If no region is active, mark the word at the point and find the previous match
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark previous.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-word-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
The matching region must be a whole word to be a match
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-previous-symbol-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark the previous part of the buffer matching the currently active region
The matching region must be a whole symbol to be a match
If no region is active add a cursor on the previous line
With negative ARG, delete the last one instead.
With zero ARG, skip the last one and mark next.

\(fn ARG)" t nil)

(autoload 'mc/mark-next-lines "../init/multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/mark-previous-lines "../init/multiple-cursors/mc-mark-more" "\


\(fn ARG)" t nil)

(autoload 'mc/unmark-next-like-this "../init/multiple-cursors/mc-mark-more" "\
Deselect next part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/unmark-previous-like-this "../init/multiple-cursors/mc-mark-more" "\
Deselect prev part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/skip-to-next-like-this "../init/multiple-cursors/mc-mark-more" "\
Skip the current one and select the next part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/skip-to-previous-like-this "../init/multiple-cursors/mc-mark-more" "\
Skip the current one and select the prev part of the buffer matching the currently active region.

\(fn)" t nil)

(autoload 'mc/mark-all-like-this "../init/multiple-cursors/mc-mark-more" "\
Find and mark all the parts of the buffer matching the currently active region

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this "../init/multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this "../init/multiple-cursors/mc-mark-more" "\


\(fn)" t nil)

(autoload 'mc/mark-all-in-region "../init/multiple-cursors/mc-mark-more" "\
Find and mark all the parts in the region matching the given search

\(fn BEG END &optional SEARCH)" t nil)

(autoload 'mc/mark-all-in-region-regexp "../init/multiple-cursors/mc-mark-more" "\
Find and mark all the parts in the region matching the given regexp.

\(fn BEG END)" t nil)

(autoload 'mc/mark-more-like-this-extended "../init/multiple-cursors/mc-mark-more" "\
Like mark-more-like-this, but then lets you adjust with arrows key.
The adjustments work like this:

   <up>    Mark previous like this and set direction to 'up
   <down>  Mark next like this and set direction to 'down

If direction is 'up:

   <left>  Skip past the cursor furthest up
   <right> Remove the cursor furthest up

If direction is 'down:

   <left>  Remove the cursor furthest down
   <right> Skip past the cursor furthest down

The bindings for these commands can be changed. See `mc/mark-more-like-this-extended-keymap'.

\(fn)" t nil)

(autoload 'mc/mark-all-like-this-dwim "../init/multiple-cursors/mc-mark-more" "\
Tries to guess what you want to mark all of.
Can be pressed multiple times to increase selection.

With prefix, it behaves the same as original `mc/mark-all-like-this'

\(fn ARG)" t nil)

(autoload 'mc/mark-all-dwim "../init/multiple-cursors/mc-mark-more" "\
Tries even harder to guess what you want to mark all of.

If the region is active and spans multiple lines, it will behave
as if `mc/mark-all-in-region'. With the prefix ARG, it will call
`mc/edit-lines' instead.

If the region is inactive or on a single line, it will behave like
`mc/mark-all-like-this-dwim'.

\(fn ARG)" t nil)

(autoload 'mc/mark-all-like-this-in-defun "../init/multiple-cursors/mc-mark-more" "\
Mark all like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-words-like-this-in-defun "../init/multiple-cursors/mc-mark-more" "\
Mark all words like this in defun.

\(fn)" t nil)

(autoload 'mc/mark-all-symbols-like-this-in-defun "../init/multiple-cursors/mc-mark-more" "\
Mark all symbols like this in defun.

\(fn)" t nil)

(autoload 'mc/toggle-cursor-on-click "../init/multiple-cursors/mc-mark-more" "\
Add a cursor where you click, or remove a fake cursor that is
already there.

\(fn EVENT)" t nil)

(defalias 'mc/add-cursor-on-click 'mc/toggle-cursor-on-click)

(autoload 'mc/mark-sgml-tag-pair "../init/multiple-cursors/mc-mark-more" "\
Mark the tag we're in and its pair for renaming.

\(fn)" t nil)

;;;***

;;;### (autoloads (mc/mark-pop) "../init/multiple-cursors/mc-mark-pop"
;;;;;;  "../init/multiple-cursors/mc-mark-pop.el" (22750 12018 600027
;;;;;;  425000))
;;; Generated autoloads from ../init/multiple-cursors/mc-mark-pop.el

(autoload 'mc/mark-pop "../init/multiple-cursors/mc-mark-pop" "\
Add a cursor at the current point, pop off mark ring and jump
to the popped mark.

\(fn)" t nil)

;;;***

;;;### (autoloads (mc/vertical-align-with-space mc/vertical-align
;;;;;;  mc/sort-regions mc/reverse-regions mc/insert-letters mc/insert-numbers)
;;;;;;  "../init/multiple-cursors/mc-separate-operations" "../init/multiple-cursors/mc-separate-operations.el"
;;;;;;  (22750 12018 600027 425000))
;;; Generated autoloads from ../init/multiple-cursors/mc-separate-operations.el

(autoload 'mc/insert-numbers "../init/multiple-cursors/mc-separate-operations" "\
Insert increasing numbers for each cursor, starting at
`mc/insert-numbers-default' or ARG.

\(fn ARG)" t nil)

(autoload 'mc/insert-letters "../init/multiple-cursors/mc-separate-operations" "\
Insert increasing letters for each cursor, starting at 0 or ARG.
     Where letter[0]=a letter[2]=c letter[26]=aa

\(fn ARG)" t nil)

(autoload 'mc/reverse-regions "../init/multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

(autoload 'mc/sort-regions "../init/multiple-cursors/mc-separate-operations" "\


\(fn)" t nil)

(autoload 'mc/vertical-align "../init/multiple-cursors/mc-separate-operations" "\
Aligns all cursors vertically with a given CHARACTER to the one with the
highest colum number (the rightest).
Might not behave as intended if more than one cursors are on the same line.

\(fn CHARACTER)" t nil)

(autoload 'mc/vertical-align-with-space "../init/multiple-cursors/mc-separate-operations" "\
Aligns all cursors with whitespace like `mc/vertical-align' does

\(fn)" t nil)

;;;***

;;;### (autoloads (multiple-cursors-mode) "../init/multiple-cursors/multiple-cursors-core"
;;;;;;  "../init/multiple-cursors/multiple-cursors-core.el" (22750
;;;;;;  12018 600027 425000))
;;; Generated autoloads from ../init/multiple-cursors/multiple-cursors-core.el

(autoload 'multiple-cursors-mode "../init/multiple-cursors/multiple-cursors-core" "\
Mode while multiple cursors are active.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (rectangular-region-mode set-rectangular-region-anchor)
;;;;;;  "../init/multiple-cursors/rectangular-region-mode" "../init/multiple-cursors/rectangular-region-mode.el"
;;;;;;  (22750 12018 600027 425000))
;;; Generated autoloads from ../init/multiple-cursors/rectangular-region-mode.el

(autoload 'set-rectangular-region-anchor "../init/multiple-cursors/rectangular-region-mode" "\
Anchors the rectangular region at point.

Think of this one as `set-mark' except you're marking a rectangular region. It is
an exceedingly quick way of adding multiple cursors to multiple lines.

\(fn)" t nil)

(autoload 'rectangular-region-mode "../init/multiple-cursors/rectangular-region-mode" "\
A mode for creating a rectangular region to edit

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (pkg-info-version-info pkg-info-package-version
;;;;;;  pkg-info-defining-library-version pkg-info-defining-library-original-version
;;;;;;  pkg-info-library-version pkg-info-library-original-version)
;;;;;;  "../init/pkg-info/pkg-info" "../init/pkg-info/pkg-info.el"
;;;;;;  (22346 20281 852006 919000))
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

;;;### (autoloads (popwin:messages popwin:find-file-tail popwin:find-file
;;;;;;  popwin:popup-buffer-tail popwin:one-window popwin:universal-display
;;;;;;  popwin:pop-to-buffer popwin:display-buffer popwin:popup-buffer)
;;;;;;  "../init/popwin/popwin" "../init/popwin/popwin.el" (22379
;;;;;;  34438 914396 705000))
;;; Generated autoloads from ../init/popwin/popwin.el

(autoload 'popwin:popup-buffer "../init/popwin/popwin" "\
Show BUFFER in a popup window and return the popup window. If
NOSELECT is non-nil, the popup window will not be selected. If
STICK is non-nil, the popup window will be stuck. If TAIL is
non-nil, the popup window will show the last contents. Calling
`popwin:popup-buffer' during `popwin:popup-buffer' is allowed. In
that case, the buffer of the popup window will be replaced with
BUFFER.

\(fn BUFFER &key (width popwin:popup-window-width) (height popwin:popup-window-height) (position popwin:popup-window-position) NOSELECT DEDICATED STICK TAIL)" t nil)

(autoload 'popwin:display-buffer "../init/popwin/popwin" "\
Display BUFFER-OR-NAME, if possible, in a popup window, or as
usual. This function can be used as a value of
`display-buffer-function'.

\(fn BUFFER-OR-NAME &optional NOT-THIS-WINDOW)" t nil)

(autoload 'popwin:pop-to-buffer "../init/popwin/popwin" "\
Same as `pop-to-buffer' except that this function will use
`popwin:display-buffer-1' instead of `display-buffer'.

\(fn BUFFER &optional OTHER-WINDOW NORECORD)" t nil)

(autoload 'popwin:universal-display "../init/popwin/popwin" "\
Call the following command interactively with letting
`popwin:special-display-config' be
`popwin:universal-display-config'. This will be useful when
displaying buffers in popup windows temporarily.

\(fn)" t nil)

(autoload 'popwin:one-window "../init/popwin/popwin" "\
Delete other window than the popup window. C-g restores the
original window configuration.

\(fn)" t nil)

(autoload 'popwin:popup-buffer-tail "../init/popwin/popwin" "\
Same as `popwin:popup-buffer' except that the buffer will be
`recenter'ed at the bottom.

\(fn &rest SAME-AS-POPWIN:POPUP-BUFFER)" t nil)

(autoload 'popwin:find-file "../init/popwin/popwin" "\
Edit file FILENAME with popup window by `popwin:popup-buffer'.

\(fn FILENAME &optional WILDCARDS)" t nil)

(autoload 'popwin:find-file-tail "../init/popwin/popwin" "\
Edit file FILENAME with popup window by
`popwin:popup-buffer-tail'.

\(fn FILE &optional WILDCARD)" t nil)

(autoload 'popwin:messages "../init/popwin/popwin" "\
Display *Messages* buffer in a popup window.

\(fn)" t nil)

;;;***

;;;### (autoloads (py-yapf-enable-on-save py-yapf-buffer) "../init/py-yapf/py-yapf"
;;;;;;  "../init/py-yapf/py-yapf.el" (22598 32060 314415 403000))
;;; Generated autoloads from ../init/py-yapf/py-yapf.el

(autoload 'py-yapf-buffer "../init/py-yapf/py-yapf" "\
Uses the \"yapf\" tool to reformat the current buffer.

\(fn)" t nil)

(autoload 'py-yapf-enable-on-save "../init/py-yapf/py-yapf" "\
Pre-save hooked to be used before running py-yapf.

\(fn)" t nil)

;;;***

;;;### (autoloads (doctest-mode doctest-register-mmm-classes) "../init/python-mode/test/doctest-mode"
;;;;;;  "../init/python-mode/test/doctest-mode.el" (22597 3786 917728
;;;;;;  0))
;;; Generated autoloads from ../init/python-mode/test/doctest-mode.el

(autoload 'doctest-register-mmm-classes "../init/python-mode/test/doctest-mode" "\
Register doctest's mmm classes, allowing doctest to be used as a
submode region in other major modes, such as python-mode and rst-mode.
Two classes are registered:

`doctest-docstring'

    Used to edit docstrings containing doctest examples in python-
    mode.  Docstring submode regions start and end with triple-quoted
    strings (\"\"\").  In order to avoid confusing start-string
    markers and end-string markers, all triple-quote strings in the
    buffer are treated as submode regions (even if they're not
    actually docstrings).  Use (C-c % C-d) to insert a new doctest-
    docstring region.  When `doctest-execute' (C-c C-c) is called
    inside a doctest-docstring region, it executes just the current
    docstring.  The globals for this execution are constructed by
    importing the current buffer's contents in Python.

`doctest-example'

    Used to edit doctest examples in text-editing modes, such as
    `rst-mode' or `text-mode'.  Docstring submode regions start with
    optionally indented prompts (>>>) and end with blank lines.  Use
    (C-c % C-e) to insert a new doctest-example region.  When
    `doctest-execute' (C-c C-c) is called inside a doctest-example
    region, it executes all examples in the buffer.

If ADD-MODE-EXT-CLASSES is true, then register the new classes in
`mmm-mode-ext-classes-alist', which will cause them to be used by
default in the following modes:

    doctest-docstring:  python-mode
    doctest-example:    rst-mode

If FIX-MMM-FONTIFY-REGION-BUG is true, then register a hook that will
fix a bug in `mmm-fontify-region' that affects some (but not all)
versions of emacs.  (See `doctest-fixed-mmm-fontify-region' for more
info.)

\(fn &optional ADD-MODE-EXT-CLASSES FIX-MMM-FONTIFY-REGION-BUG)" t nil)

(add-to-list 'auto-mode-alist '("\\.doctest$" . doctest-mode))

(autoload 'doctest-mode "../init/python-mode/test/doctest-mode" "\
A major mode for editing text files that contain Python
doctest examples.  Doctest is a testing framework for Python that
emulates an interactive session, and checks the result of each
command.  For more information, see the Python library reference:
<http://docs.python.org/lib/module-doctest.html>

`doctest-mode' defines three kinds of line, each of which is
treated differently:

  - 'Source lines' are lines consisting of a Python prompt
    ('>>>' or '...'), followed by source code.  Source lines are
    colored (similarly to `python-mode') and auto-indented.

  - 'Output lines' are non-blank lines immediately following
    source lines.  They are colored using several doctest-
    specific output faces.

  - 'Text lines' are any other lines.  They are not processed in
    any special way.

\\{doctest-mode-map}

\(fn)" t nil)

;;;***

;;;### (autoloads (helm-quickrun anything-quickrun quickrun-autorun-mode
;;;;;;  quickrun-shell quickrun-compile-only quickrun-eval-print
;;;;;;  quickrun-replace-region quickrun-region quickrun-with-arg
;;;;;;  quickrun quickrun-add-command quickrun-set-default) "../init/quickrun/quickrun"
;;;;;;  "../init/quickrun/quickrun.el" (22346 20318 216005 933000))
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

;;;### (autoloads (region-bindings-mode) "../init/region-bindings-mode/region-bindings-mode"
;;;;;;  "../init/region-bindings-mode/region-bindings-mode.el" (22750
;;;;;;  10661 996064 192000))
;;; Generated autoloads from ../init/region-bindings-mode/region-bindings-mode.el

(autoload 'region-bindings-mode "../init/region-bindings-mode/region-bindings-mode" "\
Enable special bindings when working with an active region.

Do not invoke `region-bindings-mode' directly!

Toggling the mode on and off via this function will simply
enable/disable the bindings, but it will not honour
`region-bindings-mode-disabled-modes' or
`region-bindings-mode-disable-predicates', or toggle activation
of the hooks which automatically enable/disable the bindings when
the mark is activated or deactivated.

Instead, call `region-bindings-mode-enable' and
`region-bindings-mode-enable'.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads (global-undo-tree-mode undo-tree-mode) "../init/undo-tree/undo-tree"
;;;;;;  "../init/undo-tree/undo-tree.el" (22346 20327 956005 669000))
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
;;;;;;  "../init/yasnippet/yasnippet.el" (22346 20344 956005 209000))
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
;;;;;;  "../init/yatex/yatexenv.el" (22386 21033 47593 728000))
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
;;;;;;  "../init/yatex/yatexhlp.el" (22386 21033 51593 728000))
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
;;;;;;  (22386 21033 51593 728000))
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
;;;;;;  "../init/yatex/yatexmth" "../init/yatex/yatexmth.el" (22386
;;;;;;  21033 155593 725000))
;;; Generated autoloads from ../init/yatex/yatexmth.el

(autoload 'YaTeX-toggle-math-mode "../init/yatex/yatexmth" "\


\(fn &optional ARG)" t nil)

(autoload 'YaTeX-goto-corresponding-paren "../init/yatex/yatexmth" "\
Go to corresponding mathematical parentheses.

\(fn)" nil nil)

;;;***

;;;### (autoloads (YaTeX-make-section-with-overview YaTeX-read-section-in-minibuffer)
;;;;;;  "../init/yatex/yatexsec" "../init/yatex/yatexsec.el" (22386
;;;;;;  21033 55593 728000))
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
;;;;;;  (22346 20165 412010 75000))
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
;;;;;;  "el-get/el-get-bundle" "el-get/el-get-bundle.el" (22346 20165
;;;;;;  408010 75000))
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
;;;;;;  (22346 20165 408010 75000))
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
;;;;;;  "el-get/el-get-list-packages.el" (22346 20165 412010 75000))
;;; Generated autoloads from el-get/el-get-list-packages.el

(autoload 'el-get-list-packages "el-get/el-get-list-packages" "\
Display a list of packages.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("../init/auto-complete/auto-complete-pkg.el"
;;;;;;  "../init/ctable/ctable.el" "../init/ctable/test-ctable.el"
;;;;;;  "../init/dash/dash-functional.el" "../init/dash/dash.el"
;;;;;;  "../init/deferred/concurrent.el" "../init/deferred/deferred.el"
;;;;;;  "../init/epc/epc.el" "../init/epc/epcs.el" "../init/epc/test-epc.el"
;;;;;;  "../init/epl/epl.el" "../init/expand-region/cc-mode-expansions.el"
;;;;;;  "../init/expand-region/clojure-mode-expansions.el" "../init/expand-region/cperl-mode-expansions.el"
;;;;;;  "../init/expand-region/css-mode-expansions.el" "../init/expand-region/enh-ruby-mode-expansions.el"
;;;;;;  "../init/expand-region/er-basic-expansions.el" "../init/expand-region/erlang-mode-expansions.el"
;;;;;;  "../init/expand-region/expand-region-core.el" "../init/expand-region/expand-region-pkg.el"
;;;;;;  "../init/expand-region/feature-mode-expansions.el" "../init/expand-region/html-mode-expansions.el"
;;;;;;  "../init/expand-region/js-mode-expansions.el" "../init/expand-region/js2-mode-expansions.el"
;;;;;;  "../init/expand-region/jsp-expansions.el" "../init/expand-region/latex-mode-expansions.el"
;;;;;;  "../init/expand-region/nxml-mode-expansions.el" "../init/expand-region/octave-expansions.el"
;;;;;;  "../init/expand-region/python-el-expansions.el" "../init/expand-region/python-el-fgallina-expansions.el"
;;;;;;  "../init/expand-region/python-mode-expansions.el" "../init/expand-region/ruby-mode-expansions.el"
;;;;;;  "../init/expand-region/sml-mode-expansions.el" "../init/expand-region/subword-mode-expansions.el"
;;;;;;  "../init/expand-region/text-mode-expansions.el" "../init/expand-region/the-org-mode-expansions.el"
;;;;;;  "../init/expand-region/web-mode-expansions.el" "../init/flycheck/flycheck-buttercup.el"
;;;;;;  "../init/flycheck/flycheck-ert.el" "../init/fuzzy/fuzzy.el"
;;;;;;  "../init/google-translate/google-translate-core-ui.el" "../init/google-translate/google-translate-core.el"
;;;;;;  "../init/google-translate/google-translate-pkg.el" "../init/google-translate/google-translate-tk.el"
;;;;;;  "../init/google-translate/google-translate.el" "../init/jedi/test-jedi.el"
;;;;;;  "../init/jedi/tryout-jedi.el" "../init/let-alist/let-alist-autoloads.el"
;;;;;;  "../init/let-alist/let-alist-pkg.el" "../init/matlab-mode/matlab-load.el"
;;;;;;  "../init/matlab-mode/matlab-mode-autoloads.el" "../init/matlab-mode/matlab-mode-pkg.el"
;;;;;;  "../init/matlab-mode/matlab-publish.el" "../init/matlab-mode/semanticdb-matlab.el"
;;;;;;  "../init/multiple-cursors/mc-cycle-cursors.el" "../init/multiple-cursors/multiple-cursors-pkg.el"
;;;;;;  "../init/multiple-cursors/multiple-cursors.el" "../init/popup/popup.el"
;;;;;;  "../init/popwin/misc/popwin-browse-kill-ring.el" "../init/popwin/misc/popwin-pp.el"
;;;;;;  "../init/popwin/misc/popwin-term.el" "../init/popwin/misc/popwin-w3m.el"
;;;;;;  "../init/popwin/misc/popwin-yatex.el" "../init/py-yapf/tests.el"
;;;;;;  "../init/python-environment/python-environment.el" "../init/python-environment/test-python-environment.el"
;;;;;;  "../init/python-mode/python-mode-pkg.el" "../init/python-mode/python-mode.el"
;;;;;;  "../init/python-mode/test/py-bug-numbered-tests.el" "../init/python-mode/test/py-completion-tests.el"
;;;;;;  "../init/python-mode/test/py-ert-always-split-lp-1361531-tests.el"
;;;;;;  "../init/python-mode/test/py-ert-beginning-tests.el" "../init/python-mode/test/py-ert-end-tests.el"
;;;;;;  "../init/python-mode/test/py-ert-execute-block-test.el" "../init/python-mode/test/py-ert-execute-region-test.el"
;;;;;;  "../init/python-mode/test/py-ert-forward-tests.el" "../init/python-mode/test/py-ert-function-tests.el"
;;;;;;  "../init/python-mode/test/py-ert-interactive-tests.el" "../init/python-mode/test/py-ert-just-two-split-lp-1361531-tests.el"
;;;;;;  "../init/python-mode/test/py-ert-tests-1.el" "../init/python-mode/test/py-ert-tests-2.el"
;;;;;;  "../init/python-mode/test/py-ert-tests-3.el" "../init/python-mode/test/py-ert-variablen-tests.el"
;;;;;;  "../init/python-mode/test/py-execute-region-commandp-test.el"
;;;;;;  "../init/python-mode/test/py-interactive-tests.el" "../init/python-mode/test/py-non-travis-tests.el"
;;;;;;  "../init/python-mode/test/py-shell-arg-ert-tests.el" "../init/python-mode/test/py-shell-completion-tests.el"
;;;;;;  "../init/python-mode/test/py-shell-ert-tests.el" "../init/python-mode/test/py-split-window-on-execute-lp-1361531-test.el"
;;;;;;  "../init/python-mode/test/python-extended-executes-test.el"
;;;;;;  "../init/python-mode/test/python-mode-syntax-test.el" "../init/python-mode/test/python-mode-test.el"
;;;;;;  "../init/python-mode/test/setup-ert-tests.el" "../init/seq/seq-24.el"
;;;;;;  "../init/seq/seq-25.el" "../init/seq/seq.el" "../init/smartrep/smartrep.el"
;;;;;;  "../init/undohist/undohist.el" "../init/yasnippet/yasnippet-debug.el"
;;;;;;  "../init/yasnippet/yasnippet-tests.el" "../init/yatex/comment.el"
;;;;;;  "../init/yatex/yahtml.el" "../init/yatex/yatex.el" "../init/yatex/yatex19.el"
;;;;;;  "../init/yatex/yatex23.el" "../init/yatex/yatexadd.el" "../init/yatex/yatexgen.el"
;;;;;;  "../init/yatex/yatexhie.el" "../init/yatex/yatexhks.el" "../init/yatex/yatexinf.el"
;;;;;;  "../init/yatex/yatexm-o.el" "../init/yatex/yatexpkg.el" "../init/yatex/yatexprc.el"
;;;;;;  "el-get/el-get-autoloading.el" "el-get/el-get-build.el" "el-get/el-get-byte-compile.el"
;;;;;;  "el-get/el-get-core.el" "el-get/el-get-custom.el" "el-get/el-get-dependencies.el"
;;;;;;  "el-get/el-get-install.el" "el-get/el-get-methods.el" "el-get/el-get-notify.el"
;;;;;;  "el-get/el-get-recipes.el" "el-get/el-get-status.el") (22750
;;;;;;  12022 413942 621000))

;;;***

(provide '.loaddefs)
;; Local Variables:
;; version-control: never
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; .loaddefs.el ends here
