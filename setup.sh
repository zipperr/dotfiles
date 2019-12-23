#!/bin/bash

download_dotfiles() {
    echo 'Download Dotfiles'
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
    echo 'Create SymbolicLinks'
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

setup(){
    echo 'Setup for each OS'
    if [ "$(uname)" == "Darwin" ]; then
        echo 'mac'
        which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        which brew >/dev/null 2>&1 && brew doctor
        which brew >/dev/null 2>&1 && brew update
        brew upgrade --all
        brew tap "caskroom/cask"
        brew tap "homebrew/bundle"
        brew tap "homebrew/cask"
        brew tap "homebrew/core"
        brew tap "mas-cli/tap"
        brew install "bash"
        brew install "node"
        brew install "coffeescript"
        brew install "ctags"
        brew install "curl"
        brew install "openssl"
        brew install "flake8"
        brew install "gcc"
        brew install "git"
        brew install "git-lfs"
        brew install "gnu-typist"
        brew install "go"
        brew install "jsonlint"
        brew install "lua"
        brew install "mysql"
        brew install "perl"
        brew install "pyenv"
        brew install "ruby"
        brew install "screenfetch"
        brew install "vim"
        brew install "w3m"
        brew install "wget"
        brew install "write-good"
        brew install "zsh"
        brew install "mas-cli/tap/mas"
        brew cask install "java"
        brew cask install "bathyscaphe"
        brew cask install "karabiner-elements"
        brew cask install "mplayerx"
        mas install "AdGuard for Safari", id: 1440147259
        mas install "LINE", id: 539883307
        mas install "PiPifier", id: 1160374471
        mas install "The Unarchiver", id: 425424353
        mas install "ToothFairy", id: 1191449274
        mas install "TweetDeck", id: 485812721
        brew cleanup
        brew cask cleanup
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
                    echo "Go https://www.python.org/"
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

echo "Start Setup"
download_dotfiles
create_symbolic_links
setup
install_python
echo "Finish Setup"
