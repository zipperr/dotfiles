#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    chmod +x ~/dotfiles/pythonSetup.sh
    if [ `which brew` ]; then
        brew update
    else
        cd ~/dotfiles
        xcode-select --install
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap Homebrew/bundle
        brew bundle
        chsh -s /bin/zsh
    fi
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo 'windows'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    chmod +x ~/dotfiles/pythonSetup.sh
    sudo apt-get -y install zsh vim git make gcc
    chsh -s /usr/bin/zsh
fi

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.bash_completion $HOME/.bash_completion
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
