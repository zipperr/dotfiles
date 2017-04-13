## 使い方
1. cd ~                      # if windows use this > cd %HOMEPATH%
2. git clone https://github.com/zipperr/dotfiles
3. chmod +x dotfiles/setup.sh
4. ~/dotfiles/setup.sh       # if windows use this > setup.bat
5. sudo vim

## Mac OSX  
xcode-select --install  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew tap Homebrew/bundle  
brew bundle  
sudo vi /etc/shells  
chpass -s /usr/local/bin/zsh  

##  Linux
sudo apt-get install zsh vim git mono ruby perl python mysql tomcat irssi screenfetch wget curl  
chsh -s /bin/zsh  

##  Windows
c:\cygwin\setup.exe -q -d -D -L -s http://ftp.jaist.ac.jp/pub/cygwin/ -l "%USERPROFILE%\.cygwin" -R  
c:\cygwin -P git,vim,wget,zsh    
