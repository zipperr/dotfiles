#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    cd ~/dotfiles
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap Homebrew/bundle
    brew bundle
    chsh -s /bin/zsh
    chmod +x ~/dotfiles/pythonSetup.sh
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo 'windows'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove && sudo apt-get autoclean
    sudo apt-get -y install zsh vim git make node.js python3 python perl ruby golang gcc cpp g++ default-jre default-jdk php clisp lua groovy open-cobol
    chsh -s /usr/bin/zsh
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
    chmod +x ~/dotfiles/pythonSetup.sh
fi

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.bash_completion $HOME/.bash_completion
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
