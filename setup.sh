#!/bin/bash

### Script for setting up rkaneko's dotfiles.
### @author    rkaneko
### @createdAt 2014/7/5


PARENT_DIR=`dirname $0`
#include
. ${PARENT_DIR}/sh/installNeoBundle.sh

# install NeoBundle
CURRENT_DIR=`pwd`
installNeoBundle ${CURRENT_DIR}
# install NeoBundle end

# make symbolic link
DOT_FILES=( .vim .vimrc .gvimrc .tigrc .config )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
# make sybolic link end

# tmux
ln -s $HOME/dotfiles/.tmux/tmux.conf $HOME/.tmux.conf

ln -s $HOME/dotfiles/.tmux/.tmux-powerlinerc $HOME/.tmux-powerlinerc
# tmux end

# zsh
# ZDOT_FILES=`find $HOME/dotfiles/.zsh -type f | awk -F/ '{print $NF}'`
ZDOT_FILES=( .zlogin .zlogout .zpreztorc .zshenv .zprofile .zshrc )
for ZDOT_FILE in ${ZDOT_FILES[@]}
do
    ln -s $HOME/dotfiles/.zsh/$ZDOT_FILE $HOME/$ZDOT_FILE
done
# zsh end

# make symbolic link
ln -s $HOME/dotfiles/git/dotgitignore $HOME/.gitignore

ln -s $HOME/dotfiles/git/.gitconfig $HOME/.gitconfig

# for git submodules
git submodule init
