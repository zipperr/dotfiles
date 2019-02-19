#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    cd ~/dotfiles
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap Homebrew/bundle
    brew bundle
    chsh -s /bin/zsh
    chmod +x ~/dotfiles/pythonSetup.sh
    defaults write com.apple.dock autohide-delay -float 0
    defaults write com.apple.dock autohide-time-modifier -float 0
    defaults write com.apple.dock autohide -bool true
    defaults write com.apple.dock mineffect -string "scale"
    defaults write com.apple.dock springboard-show-duration -int 0
    defaults write com.apple.dock springboard-hide-duration -int 0
    killall Dock
    chflags nohidden ~/Library
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    defaults write com.apple.finder AppleShowAllFiles true
    defaults write com.apple.finder QuitMenuItem -bool true
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.LaunchServices LSQuarantine -bool false
    defaults write com.apple.CrashReporter DialogType none
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    echo 'windows'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    while true;do
        echo "Start apt-get update&install"
        echo "Type 'y' or 'n'"
        read answer
        case $answer in
            y)
                sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove && sudo apt-get autoclean
                sudo apt-get -y install zsh vim git make node.js python3 python
                sudo apt-get -y install golang gcc cpp g++ perl ruby groovy php
                sudo apt-get -y install default-jre default-jdk clisp open-cobol lua
                sudo apt-get -y omxplayer vsftpd
                break
                ;;
            n)
                break
                ;;
            *)
                echo -e "cannot understand $answer.\n"
                ;;
        esac
    done
    chsh -s /usr/bin/zsh
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
    chmod +x ~/dotfiles/pythonSetup.sh
fi

sudo rm $HOME/.vimrc
sudo rm $HOME/.bashrc
sudo rm $HOME/.bash_completion
sudo rm $HOME/.zshrc
sudo rm $HOME/.git-prompt.sh
sudo rm $HOME/.gitconfig
sudo rm $HOME/.gitignore_global
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -s $HOME/dotfiles/.bash_completion $HOME/.bash_completion
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.git-prompt.sh $HOME/.git-prompt.sh
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
