#!/bin/bash

DOT_FILES=(.vimrc .bashrc .bash_profile .inputrc .bash_history .zshrc .zsh_history .minttyrc .irssi)
for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
