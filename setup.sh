#!/bin/bash

if [ ! -d ~/.zsh ]; then ln -s ~/dotfiles/.zsh/ ~/.zsh > /dev/null 2>&1; fi

DOT_FILES=(.vimrc .bashrc .zshrc .git-prompt.sh .gitconfig .gitignore_global )
for file in ${DOT_FILES[@]}
do
ln -s $HOME/dotfiles/$file $HOME/$file
done
