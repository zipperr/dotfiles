#  使い方
1. git clone https://github.com/zipperr/dotfiles ~/dotfiles
2. chmod +x ~/dotfiles/setup.sh
3. ~/dotfiles/setup.sh

#  Mac OSX
xcode-select --install  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
brew tap Homebrew/bundle  
brew bundle  
chsh -s /bin/zsh   

#  Linux
sudo apt-get install zsh vim git  
chsh -s /usr/bin/zsh

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
| `W`            | ショートカットリストを開く(トグル)                         |
| `T`            | ツイッターを開く                                           |
| `E`           | ファイルツリーを開く(トグル)                               |
| `Z`           | 最近開いたファイルのリスト                                 |
| `Q`           | ソースコードを実行、出力                                   |
| `ESC` `ESC`     | バッファを閉じる(ショートカットリスト、ツリー、実行結果等) |
| `Space` `g`     | 内部grep サブディレクトリ内のファイルも再帰的に検索        |
| `Space` `G`     | 外部grep サブディレクトリ内のファイルも再帰的に検索        |
| `visual-Enter`  | 選択範囲のテキストを整形する                               |
