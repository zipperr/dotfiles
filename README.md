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
| `\`             | 文字列のリテラル(", ')や論理値(True, False)を変える        |
| `F1`            | ショートカットリストを開く(トグル)                         |
| `F2`            | ツイッターを開く                                           |
| `F3`            | ツイートする                                               |
| `F4`            | W3mでGoogle検索                                            |
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
| `:Gstatus`      | -でaddファイルを選択、Cでコミット                          |

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
___  
W3mVimは、  
**w3mコマンド**がインストールされていることが前提  
