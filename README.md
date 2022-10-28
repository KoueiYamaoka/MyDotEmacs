# MyDotEmacs

## How to Install
### install external libraries
```sh
$ sudo apt insatll mercurial cmigemo
```

### for python
Anaconda is recommended
```sh
$ conda install black virtualenv jedi flake8
$ pip install epc
$ emacs -nw
M-x jedi:install-server
```


### aspell setting
```sh
echo "lang en_US" > ~/.aspell.conf
```

Then, run emacs

## alias
```sh
alias e="emacs"
function emacs() {
    if [[ "$INSIDE_EMACS" = 'vterm' ]]; then
        vterm_printf "51;Eswitch-to-prev-buffer"
    else
        emacsclient -nw -a "" $1
    fi
}
alias ekill='emacsclient -e "(kill-emacs)"'
```

# git settings
Write following setting to ~/.gitconfig
```sh
[core]
    editor = "emacsclient -t" --alternate-editor emacs
```
