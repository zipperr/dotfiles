#!/bin/bash

DOT_FILES=(.vimrc .bashrc .bash_history .zshrc .zsh_history .minttyrc .irssi screenfetch-dev)
for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
