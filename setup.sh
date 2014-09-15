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
DOT_FILES=( .vim .vimrc .gvimrc .tmux.conf .tigrc)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

ln -s $HOME/dotfiles/.tmux/.tmux-powerlinerc $HOME/.tmux-powerlinerc
# make sybolic link end

# make symbolic link
ln -s $HOME/dotfiles/git/dotgitignore $HOME/.gitignore

# ln -s $HOME/dotfiles/git/.gitconfig $HOME/.gitconfig

# for git submodules
git submodule
