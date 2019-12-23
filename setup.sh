#!/bin/bash

ini(){
dotfiles_logo='
██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
*** WHAT IS INSIDE? ***
1. Download my dotfiles from https://github.com/zipperr/dotfiles
2. Symlinking dotfiles to your home directory
3. Install packages
   [bash zsh vim git python]
*** HOW TO INSTALL? ***
See the README for documentation.
Licensed under the MIT license.  
'
echo "$dotfiles_logo"
echo ""
read -p "$(echo '(U^w^) < Are you sure you want to install it? [y/N] ')" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo ""
  exit 1
fi
}

download_dotfiles() {
    REPOSITORY_NAME="dotfiles"
    REPOSITORY_URL="https://github.com/zipperr/"$REPOSITORY_NAME
    DOTFILES_PATH="$HOME/$REPOSITORY_NAME"

    cd $HOME
    if [ -d $DOTFILES_PATH ]; then
        rm -rf $DOTFILES_PATH
    fi

    if type git > /dev/null 2>&1; then
        git clone $REPOSITORY_URL
    else
        curl -sL $REPOSITORY_URL/archive/master.tar.gz | tar xz
        mv $REPOSITORY_NAME"-master" $DOTFILES_PATH
        rm -f $HOME/$REPOSITORY_NAME.tar.gz
    fi
    cd $DOTFILES_PATH
}

create_symbolic_links(){
    cd $DOTFILES_PATH
    export MSYS=winsymlinks:nati
    for f in .??*
    do
        [[ ${f} = ".git" ]] && continue
        [[ ${f} = ".gitignore" ]] && continue
        rm -f $HOME/${f}
        ln -snfv $DOTFILES_PATH/${f} $HOME/${f}
    done
}

 platform_dependent_setup(){
    if [ "$(uname)" == "Darwin" ]; then
        echo 'mac'
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        brew tap Homebrew/bundle
        brew bundle --global --no-lock
        chsh -s /bin/zsh
        sudo nvram SystemAudioVolume=%00
        defaults write NSGlobalDomain AppleShowAllExtensions -bool true
        defaults write com.apple.dock autohide-delay -float 0
        defaults write com.apple.dock autohide-time-modifier -float 0
        defaults write com.apple.dock autohide -bool true
        defaults write com.apple.dock mineffect -string "scale"
        defaults write com.apple.dock springboard-show-duration -int 0
        defaults write com.apple.dock springboard-hide-duration -int 0
        killall Dock
        sudo chflags nohidden ~/Library
        sudo chflags nohidden /Volumes
        defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
        defaults write -g com.apple.trackpad.scaling 3
        defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
        defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
        defaults write com.apple.finder AppleShowAllFiles true
        defaults write com.apple.finder QuitMenuItem -bool true
        defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
        defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
        defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
        defaults write com.apple.LaunchServices LSQuarantine -bool false
        defaults write com.apple.CrashReporter DialogType none
        defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
        defaults write com.apple.finder WarnOnEmptyTrash -bool false
        defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
        defaults write com.apple.Safari SuppressSearchSuggestions -bool true
        defaults write com.apple.Safari UniversalSearchEnabled -bool false
        defaults write -g InitialKeyRepeat -int 12
        defaults write -g KeyRepeat -int 1
        defaults write com.apple.screensaver askForPassword -bool false
        TERM_PROFILE='zip';
        TERM_PATH='./';
        CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
        if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}" ]; then
            open "$TERM_PATH$TERM_PROFILE.terminal"
            defaults write com.apple.Terminal "Default Window Settings" -string "$TERM_PROFILE"
            defaults write com.apple.Terminal "Startup Window Settings" -string "$TERM_PROFILE"
        fi
        defaults import com.apple.Terminal "$HOME/Library/Preferences/com.apple.Terminal.plist"
    elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
        echo 'windows'
        pacman  -Syu --noconfirm
        pacman -S tmux vim git bash zsh --noconfirm
    elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
        echo 'linux'
        sudo apt-get update && sudo apt-get -y dist-upgrade && sudo apt-get -y autoremove && sudo apt-get autoclean
        sudo apt-get -y install zsh vim git make python3 python w3m
        sudo apt-get -y install gcc cpp g++ perl ruby node.js lua
        chsh -s /usr/bin/zsh
        localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
    fi
}

install_python(){
    while true;do
        echo "Start python3.7.0 install"
        echo "Type 'y' or 'n'"
        read answer
        case $answer in
            y)
                if [ "$(uname)" == "Darwin" ]; then
                    if [ `which pyenv` ]; then
                        pyenv install -v 3.7.0
                        pyenv global 3.7.0
                    fi
                    if [ `which pip` ]; then
                        pip install --upgrade pip
                        pip install numpy
                        pip install Flask
                        pip install vim-vint
                        pip install flask-socketIO
                    fi
                elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
                    if [ `which pacman` ]; then
                        pacman -S python3 python3-pip --noconfirm
                    fi
                    if [ `which pip` ]; then
                        pip install --upgrade pip
                        pip install Flask
                        pip install vim-vint
                        pip install --user mps-youtube youtube-dl
                    fi
                elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
                    if [ `which git` ]; then
                        git clone https://github.com/pyenv/pyenv.git ~/.pyenv
                        sudo apt-get -y install git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev
                        pyenv install -v 3.7.0
                        pyenv global 3.7.0
                    fi
                    if [ `which pip` ]; then
                        pip install --upgrade pip
                        pip install numpy
                        pip install Flask
                        pip install vim-vint
                        pip install flask-socketIO
                        pip install Flask-MySQL
                        pip install picamera
                        pip install --upgrade setuptools
                        pip install flask-bootstrap
                    fi
                fi
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
}

ini
download_dotfiles
create_symbolic_links
platform_dependent_setup
install_python
