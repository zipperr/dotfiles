#!/bin/bash

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
mkdir -p $HOME/.vim
ln -s $HOME/dotfiles/.vim/colors/ $HOME/.vim
ln -s $HOME/dotfiles/.vim/snippets/ $HOME/.vim
