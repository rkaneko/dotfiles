dotfiles
====================
'dotfiles' includes .vimrc, .gvimrc, .bashrc and so on.

#### Prerequirements
+ OS: MacOSX or Linux(Ubuntu, CentOS...)
+ git
+ (C++) clang-format 3.4 or later

(optional)
+ ag: The Silver searcher (for Unite grep)

##### prepare
+ MacOSX

```bash
$ brew install vim --with-lua

$ brew install tmux

# for tmux clipboard
$ brew install reattach-to-user-namespace
```

+ Ubuntu

```bash
$ sudo aptitude install vim vim-nox vim-gtk vim-gnome vim-athena

$ sudo aptitude install tmux

# for clipboard
$ sudo aptitude install xclip xsel
```

### Usage

```bash
$ cd

$ git clone https://github.com/rkaneko/dotfiles.git

$ cd dotfiles

$ git submodule

# (optional)
$ git submodule update

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

# install gh: hub clone implemented with golang (notice) u cannot install gh with ghq or go get
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
