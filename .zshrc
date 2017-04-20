######　基本設定 #####
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
bindkey -v               # キーバインドをviモードに設定
setopt print_eight_bit   #日本語名ファイルを表示可
setopt no_beep           # ビープ音を鳴らさないようにする
setopt no_hist_beep      # ビープ音を鳴らさないようにする
setopt no_list_beep      # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
alias ...='cd ../..'
alias ....='cd ../../..'
setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
export TERM=xterm-256color #256色使う。(vimのlightline作動にも使います)
autoload -U colors && colors
export HOMEBREW_CASK_OPTS="--appdir=/Applications"  #caskでインストールしたアプリをApplicationsへ

##### 補完機能 ####
autoload -U compinit           # 補完機能(TAB)を有効にする
compinit -u                    # セキュリティ警告を表示しない
setopt auto_list               # 補完候補を一覧で表示する
setopt auto_menu               # 補完キー連打で補完候補を順に表示する
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt auto_param_keys         # カッコの対応などを自動的に補完
setopt auto_param_slash        # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
zstyle ':completion:*:default' menu select=1    # 補完メニューをカーソルで選択可能にする。
setopt auto_param_slash        # ディレクトリ名の補完で末尾の / を自動的に付加
zstyle ':completion:*:default' menu select=1            # 補完メニューをカーソルで選択可能にする。
zstyle ':completion:*:cd:*' tag-order local-directories path-directories     # カレントに候補が無い場合のみcdpath 上のディレクトリが候補となる。
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' # 補完の時に大文字小文字を区別しない
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}                        #ファイル補完候補に色を付ける

###### 補完の表示関連 #####
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

##### コマンド履歴 #####
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history

##### 左プロンプト設定 #####
SPROMPT="もしかして: %r  (y, n, a, e)-> "   #スペル訂正をグーグル風にする
PROMPT="%{${fg[cyan]}%}(%T)[%n@%m]%{%{$reset_color%}%}"   #(時間)[ユーザ名@ホスト名]で表示

##### 右プロンプト+git設定 #####
RPROMPT="%{${fg[cyan]}%}[%~]%{${reset_color}%}"
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

##### googleコマンドで検索 #####
google() {
    local str opt
    if [ $# != 0 ]; then
        for i in $*; do
            # $strが空じゃない場合、検索ワードを+記号でつなぐ(and検索)
            str="$str${str:++}$i"
        done
        opt='search?num=100'
        opt="${opt}&q=${str}"
    fi
    open -a Google\ Chrome http://www.google.co.jp/$opt
}

##### cdしたらls -aを実行する #####
function chpwd() {
    emulate -L zsh
    ls -a
}

##### mkcdコマンドでmkdirとcdを同時に実行 #####
function mkcd() {
    if [[ -d $1 ]]; then
    cd $1
    else
    mkdir -p $1 && cd $1
    fi
}
