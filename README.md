# MyDotEmacs

## How to Install
### install mercurial for git
```sh
$ sudo apt-get insatll mercurial
```

### for python
Anaconda is recommended
```sh
$ conda install black virtualenv jedi flake8
4 pip install epc
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
alias e='emacsclient -nw -a ""'
alias ekill='emacsclient -e "(kill-emacs)"'
```

# git settings
Write following setting to ~/.gitconfig
```sh
[core]
    editor = "/usr/bin/emacsclient -t" --alternate-editor /usr/bin/emacs
```
