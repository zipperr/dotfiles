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
sudo apt-get install zsh vim git make gcc w3m  
sudo yum install zsh vim git make gcc w3m  
chsh -s /usr/bin/zsh

aptコマンドメモ:node.js python3 python perl ruby golang gcc cpp g++  
default-jre default-jdk php clisp mono lua groovy open-cobol

#  Windows
[GitBash Install](http://gitforwindows.org)  

##  vimMEMO
| コマンド        | 操作                                                       |
| :-------------: | :--------------------------------------------------------: |
| `H`             | 行頭に移動                                                 |
| `L`             | 行末に移動                                                 |
| `J`             | 20行下に移動                                               |
| `K`             | 20行上に移動                                               |
| `Space` `Space` | コメントアウト(トグル)                                     |
| `C-s`            | ショートカットリストを開く(トグル)                         |
| `C-t`            | ツイッターを開く                                           |
| `S-t`            | ツイートする                                               |
| `C-e`           | ファイルツリーを開く(トグル)                               |
| `C-z`           | 最近開いたファイルのリスト                                 |
| `C-w`           | タブ間移動                                                 |
| `C-q`           | ソースコードを実行、出力                                   |
| `ESC` `ESC`     | バッファを閉じる(ショートカットリスト、ツリー、実行結果等) |
| `Space` `s`     | ブラウザーを開いてGoogle検索                               |
| `Space` `p`     | 開いているMarkdownファイルのプレビューをブラウザで開く     |
| `Space` `h`     | localhost:8000をブラウザで開く                             |
| `Space` `g`     | 内部grep サブディレクトリ内のファイルも再帰的に検索        |
| `Space` `G`     | 外部grep サブディレクトリ内のファイルも再帰的に検索        |
| `visual-Enter`  | 選択範囲のテキストを整形する                               |
