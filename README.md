# MyDotEmacs

## How to Install
### install mercurial for git
```sh
$ sudo apt-get insatll mercurial
```

### for python
```sh
$ sudo pip install yapf
$ sudo pip install flake8
$ sudo pip install virtualenv
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
