dotfiles
====================
'dotfiles' includes .vimrc, .gvimrc, .zshrc and so on.

#### Prerequisites
+ OS: MacOSX or Linux(Ubuntu, CentOS...)
+ git 1.9 or later
+ mercurial
+ (C++) clang-format 3.4 or later
+ Vim with lua and clipboard
+ tmux 1.9 or later
+ zsh 5.0.7 or later + [Prezto](https://github.com/sorin-ionescu/prezto)

(optional)
+ ag: The Silver searcher (for Unite grep)

##### prepare
+ MacOSX

```bash
$ brew install vim --with-lua

$ brew install tmux

# for tmux clipboard
$ brew install reattach-to-user-namespace

$ brew install zsh
```

+ Ubuntu

  - [Installing Git on Ubuntu](https://gist.github.com/rkaneko/5703889)

```bash
$ sudo aptitude install vim vim-nox vim-gtk vim-gnome vim-athena

$ sudo aptitude install tmux

# for clipboard
$ sudo aptitude install xclip xsel

$ sudo aptitude install zsh
```

+ CentOS

See also gists.
  - [Installing Git](https://gist.github.com/rkaneko/a50a076d36240611adab)
  - [Installing Vim](http://qiita.com/rkaneko/items/fbba826efa2dfc8d0905)
  - [Installing zsh](https://gist.github.com/rkaneko/d0794aec2c50f9f8a09b)
  - [Installing tmux](https://gist.github.com/rkaneko/2c5636106aced7052e65)
  - [Installing ag](https://gist.github.com/rkaneko/988c3964a3177eb69b75)

```bash
# install xclip xsel
$ sudo yum install xclip xsel
```

### install Prezto
Install following [Prezto README](https://github.com/sorin-ionescu/prezto).
Don't forget to change login shell zsh.

### Installing [peco cmd](https://github.com/peco/peco/tree/master/cmd/peco)

```bash
# If u set GOPATH, u can install peco like this.
$ go get github.com/peco/peco/cmd/peco
# but u can select how u install peco.
```

### Usage

```bash
$ cd

$ git clone https://github.com/rkaneko/dotfiles.git

$ cd dotfiles

$ git submodule init && git submodule update

$ ./setup.sh

# add option -2 for tmux-color OR set alias(see dotfiles/.bashrc.alias
$ tmux -2

# (on tmux)
# install tmux plugins managed with tpm
$ [tmux's prefix] I
# update tmux plugins
$ [tmux's prefix] U
```

#### Appendix
+ [ghq](https://github.com/motemen/ghq)
+ [hub](https://github.com/github/hub)
+ [tig](https://github.com/jonas/tig)
+ [tmuxinator](https://github.com/tmuxinator/tmuxinator)
+ [tmux-plugins](https://github.com/tmux-plugins)

### Utility env
```bash
# after install golang
# install ghp: a github's repository manager
$ go get github.com/motemen/ghq

# install gh: hub clone implemented with golang
$ mkdir -p ~/go/src/github.com/jingweno/
$ cd ~/go/src/github.com/jingweno/
$ git clone https://github.com/jingweno/gh.git
$ cd gh
$ script/install
# see gh's version
$ gh version
git version 1.8.4.3
gh version 2.1.0

# install Tig: text mode interface for Git
$ ghq get https://github.com/jonas/tig.git
$ cd ~/.ghq/github.com/jonas/tig/
$ make && make install
$ source ~/.bashrc
# see tig's help 
$ tig -h
# (and see dotfiles/.tigrc)
```
### for Go
```bash
$ go get github.com/nsf/gocode

$ go get github.com/golang/lint/golint
```

### IME config
If u want to IME off when u escapes Vim insert mode, please see [this Web site](http://hotolab.net/blog/vim_ime/)
