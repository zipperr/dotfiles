#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    cd ~/dotfiles
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew tap Homebrew/bundle
    brew bundle
    chsh -s /bin/zsh
    chmod +x ~/dotfiles/pythonSetup.sh

    # 起動最小
    sudo nvram SystemAudioVolume=%00
    # 拡張子を常に表示
    defaults write NSGlobalDomain AppleShowAllExtensions -bool true
    # Dockをすぐに表示する
    defaults write com.apple.dock autohide-delay -float 0
    #Dockアニメーションなし
    defaults write com.apple.dock autohide-time-modifier -float 0
    # 自動でドック隠す
    defaults write com.apple.dock autohide -bool true
    #スケールエフェクト
    defaults write com.apple.dock mineffect -string "scale"
    #Launchpadすぐ出す
    defaults write com.apple.dock springboard-show-duration -int 0
    #Launchpadすぐ隠す
    defaults write com.apple.dock springboard-hide-duration -int 0
    # 設定反映
    killall Dock
    #ライブラリディレクトリを見えるようにする
    sudo chflags nohidden ~/Library
    # /Volumes ディレクトリを見えるようにする
    sudo chflags nohidden /Volumes
    # タップでクリック
    defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1
    # カーソル最速
    defaults write -g com.apple.trackpad.scaling 3
    # スクロール方向
    defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
    # タイトルバーにフルパスを表示
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
    # 隠しファイルや隠しフォルダを表示
    defaults write com.apple.finder AppleShowAllFiles true
    #Finderを終了を出す
    defaults write com.apple.finder QuitMenuItem -bool true
    # アドレスバーに完全なURLを表示
    defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
    # ネットワークフォルダとUSBに.DS_Storeを作らない
    defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
    defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
    # 未確認のアプリケーションを実行する際のダイアログを無効にする
    defaults write com.apple.LaunchServices LSQuarantine -bool false
    # クラッシュリポーターを無効にする
    defaults write com.apple.CrashReporter DialogType none
    # 拡張子変更時の警告を無効化する
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
    # ゴミ箱を空にする前の警告を無効化する
    defaults write com.apple.finder WarnOnEmptyTrash -bool false
    # ファイルのダウンロード後に自動でファイルを開くのを無効化する
    defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
    # 検索クエリを Apple へ送信しない
    defaults write com.apple.Safari SuppressSearchSuggestions -bool true
    # 検索クエリを Apple へ送信しない
    defaults write com.apple.Safari UniversalSearchEnabled -bool false
    #キーリピート最速
    defaults write -g InitialKeyRepeat -int 12
    defaults write -g KeyRepeat -int 1
    # スリープとスクリーンセーバの解除にパスワードを要求
    defaults write com.apple.screensaver askForPassword -bool false
    # Use a custom theme （カスタムテーマを使う、そのテーマをデフォルトに設定する）
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
