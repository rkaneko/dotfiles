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
```
