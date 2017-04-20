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
sudo apt-get install zsh vim git  
chsh -s /usr/bin/zsh  

##  Windows
setup-x86.exe ^  
--root c:\cygwin ^  
--local-package-dir %CD% ^  
--site http://ftp.iij.ad.jp/pub/cygwin/ ^  
--quiet-mode ^  
--packages gcc,gcc-core,gcc-g++,gcc-ada,binutils,git,make,wget,zsh,vim  
