## 使い方
1. cd ~
2. git clone https://github.com/zipperr/dotfiles
3. chmod +x dotfiles/setup.sh
4. ~/dotfiles/setup.sh

## Mac OSX
xcode-select --install  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew tap Homebrew/bundle  
brew bundle  
chsh -s /bin/zsh   

##  Linux
sudo apt-get install zsh vim git make gcc  
chsh -s /usr/bin/zsh

aptコマンドメモ:node.js python3 python perl ruby golang gcc cpp g++  
default-jre default-jdk php clisp mono lua groovy open-cobol

##  Windows
[Gitbash Install](http://gitforwindows.org)  
setup.bat

##  vimMEMO
C-eでディレクトリツリーを開く  
C-wでタブ間移動  
C-qでソースコードを実行、バッファとして出力  
qでバッファを閉じる(Unite、ツリー、実行結果等)  
S-h,j,k,lで20行単位で移動

Synstatic(構文チェック), Quickrun(コード実行)は、  
起動シェルに該当のプログラムがインストールされていることが前提  
neko-look(英文補完)は、  
起動シェルにlookコマンドがインストールされていることが前提、  
vimproc(非同期処理)は、  
起動シェルにmake, gccコマンドがインストールされていることが前提
