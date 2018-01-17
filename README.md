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
[Cygwin Install](https://cygwin.com/install.html)  
vim、git、zsh、curl、make、wget、python2あたりをインストール  
git clone https://github.com/zipperr/dotfiles  
vimrcのquickrunでproc部分をコメントアウト  
zsh  
desk  

# setup.sh(bat)実行後のファイル構成
```
~
├── .vimrc
├── .bashrc
├── .zshrc
├── .minttyrc
├── .gitconfig
├── .gitignore_global
├── .git-prompt
├── /.vim
│   ├── /colors
│   ├── /snippet
│   ├── /templeates
│   ├── /tmp
│   └── /dein
└── /dotfiles
```

##  vimMEMO
| コマンド     | 操作                                                        |  
| :--------:   | :---------------------------------------------------------: |  
| H            | 行頭に移動                                                  |  
| L            | 行末に移動                                                  |  
| J            | 20行下に移動                                                |  
| K            | 20行上に移動                                                |  
| ,,           | コメントアウト(トグル)                                      |  
| \            | 文字列のリテラル(", ')や論理値(True, False)を変える         |  
| F1           | ショートカットリストを開く(トグル)                          |  
| F2           | ツイッターを開く                                            |  
| F3           | ツイートする                                                |  
| C-e          | ファイルツリーを開く(トグル)                                |  
| C-z          | 最近開いたファイルのリスト                                  |  
| C-w          | タブ間移動                                                  |  
| C-q          | ソースコードを実行、出力                                    |  
| ESC ESC      | バッファを閉じる(ショートカットリスト、ツリー、実行結果等)  |  
| Space Space  | ブラウザーを開いてGoogle検索                                |  
| visual-Enter | 選択範囲のテキストを整形する                                |  


___  
Synstatic(構文チェック), Quickrun(コード実行)は、  
該当の**プログラム言語**がインストールされていることが前提  
___  
neko-look(英文補完)は、  
**lookコマンド**がインストールされていることが前提  
___  
vimproc(非同期処理)は、  
**make, gccコマンド**がインストールされていることが前提  
___  
Openbrowser、TwitVimは、  
**curlコマンド**がインストールされていることが前提  
