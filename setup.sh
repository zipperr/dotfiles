#!/bin/bash

DOT_FILES=(.vimrc .bashrc .zshrc .git-prompt.sh .gitconfig .gitignore_global)
for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
