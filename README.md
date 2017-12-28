#  使い方
1. cd ~
2. git clone https://github.com/zipperr/dotfiles
3. chmod +x dotfiles/setup.sh
4. ~/dotfiles/setup.sh

#  Mac OSX
xcode-select --install  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew tap Homebrew/bundle  
brew bundle  
chsh -s /bin/zsh   

#  Linux
sudo apt-get install zsh vim git make gcc  
chsh -s /usr/bin/zsh

aptコマンドメモ:node.js python3 python perl ruby golang gcc cpp g++  
default-jre default-jdk php clisp mono lua groovy open-cobol

#  Windows
##  Gitbash
[Gitbash Install](http://gitforwindows.org)  
setup.bat  
##  Cygwin
Cygwin.bat  
git clone https://github.com/transcode-open/apt-cyg.git  
cd apt-cyg/  
install apt-cyg /usr/local/bin  
apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/ update  
apt-cyg install python

##  vimMEMO
| コマンド |操作                                                       |  
|:--------:|:---------------------------------------------------------:|  
|H         |行頭に移動                                                 |  
|L         |行末に移動                                                 |  
|J         |20行下に移動                                               |  
|K         |20行上に移動                                               |  
|,,        |コメントアウト(トグル)                                     |  
|F1        |ショートカットリストを開く(トグル)                         |  
|F2        |ツイッターを開く                                           |  
|F3        |ツイートする                                               |  
|C-e       |ファイルツリーを開く(トグル)                               |  
|C-w       |タブ間移動                                                 |  
|C-q       |ソースコードを実行、出力                                   |  
|ESC ESC   |バッファを閉じる(ショートカットリスト、ツリー、実行結果等) |  


Synstatic(構文チェック), Quickrun(コード実行)は、  
起動シェルに該当の**プログラム言語**がインストールされていることが前提  
neko-look(英文補完)は、  
起動シェルに**lookコマンド**がインストールされていることが前提、  
vimproc(非同期処理)は、  
起動シェルに**make, gccコマンド**がインストールされていることが前提  
Openbrowser、TweetVimは、  
起動シェルに**curlコマンド**がインストールされていることが前提  
