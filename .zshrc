###### 基本設定 #####
export EDITOR=vim        # エディタをvimに設定
export LANG=ja_JP.UTF-8  # 文字コードをUTF-8に設定
export KCODE=u           # KCODEにUTF-8を設定
export AUTOFEATURE=true  # autotestでfeatureを動かす
bindkey -v               # キーバインドをviモードに設定
setopt print_eight_bit   # 日本語名ファイルを表示可
setopt no_beep           # ビープ音を鳴らさないようにする
setopt no_hist_beep      # ビープ音を鳴らさないようにする
setopt no_list_beep      # ビープ音を鳴らさないようにする
setopt auto_cd           # ディレクトリ名の入力のみで移動する
setopt AUTO_NAME_DIRS    # "~$var" でディレクトリにアクセス
setopt correct           # コマンドのスペルを訂正する
setopt prompt_subst      # プロンプト定義内で変数置換やコマンド置換を扱う
setopt notify            # バックグラウンドジョブの状態変化を即時報告する
setopt chase_links       # シンボリックリンクは実体を追うようになる
setopt AUTO_RESUME       # サスペンド中のプロセスと同じコマンド名を実行した場合はリジュームする
export TERM=xterm-256color #256色使う。(vimのlightline作動にも使います)
autoload -U colors && colors
export HOMEBREW_CASK_OPTS="--appdir=/Applications"  #caskでインストールしたアプリをApplicationsへ
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`    #caskでインストールしたjavaの場所
export PATH=$HOME/bin:/usr/local/bin:$PATH          #パス

##### エイリアス #####
if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -a -G'  #mac用
else
    alias ls='ls -a  --color=auto'  #その他
fi

alias sudo='sudo '       # sudo の後のコマンドでエイリアスを有効にする
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias -g V='| vim -R -'
alias ...='cd ../..'     # auto_cdとのコンボ
alias ....='cd ../../..' # 同上
alias mkdir='mkdir -p'
alias cp='cp -i'
alias rm='rm -i'
alias vi='vim'
alias v='vim'
alias vz='vim ~/.zshrc'
alias g='git'
alias server='python -m SimpleHTTPServer'   #簡易サーバーを立てる デフォルトは8000 引数で設定可
alias server3='python -m http.server'   #python3はこっち
alias ip='ifconfig'     #IPを表示する
alias onkey="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"    #mac本体のキーボードを有効にする
alias offkey="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/" #mac本体のキーボードを無効にする
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"   #DS_Store削除

##### 補完機能 ####
autoload -U compinit           # 補完機能(TAB)を有効にする
compinit -u                    # セキュリティ警告を表示しない
setopt auto_list               # 補完候補を一覧で表示する
setopt auto_menu               # 補完キー連打で補完候補を順に表示する
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
setopt auto_param_keys         # カッコの対応などを自動的に補完
setopt auto_param_slash        # ディレクトリ名の補完で末尾の / を自動的に付加
setopt noautoremoveslash       # 最後のスラッシュを自動的に削除しない
setopt auto_pushd              # タブキーでこれまでに移動したディレクトリを一覧表示
setopt complete_aliases        # エイリアスを展開して補完

# 補完候補のメニュー選択で、矢印キーの代わりにhjklで移動出来るようにする。
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

###### 補完の表示関連 #####
zstyle ':completion:*:default' menu select=1    # 補完メニューをカーソルで選択可能にする。
zstyle ':completion:*:cd:*' tag-order local-directories path-directories     # カレントに候補が無い場合のみcdpath 上のディレクトリが候補となる。
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*' # 補完の時に大文字小文字を区別しない
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}                        #ファイル補完候補に色を付ける
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
HISTFILE=~/.zsh_history      #コマンド履歴ファイルを参照/作成する
HISTSIZE=50000               #ヒストリサイズ
SAVEHIST=50000
setopt share_history         #同時に起動したzshの間でヒストリを共有する
setopt append_history        #複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt pushd_ignore_dups     #重複したディレクトリを追加しない
setopt hist_ignore_all_dups  #同じコマンドをヒストリに残さない
setopt hist_ignore_space     #スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks    #ヒストリに保存するときに余分なスペースを削除する
setopt extended_glob         #高機能なワイルドカード展開を使用する
setopt extended_history      #zsh の開始・終了時刻をヒストリファイルに書き込む
#rootは履歴を保存しない
if [ $UID = 0 ]; then
	unset HISTFILE
	SAVEHIST=0
fi

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

##### cdしたらlsする #####
chpwd() {
    ls_abbrev
}
ls_abbrev() {
    if [[ ! -r $PWD ]]; then
        return
    fi
    local cmd_ls='ls'
    local -a opt_ls
    opt_ls=('-aCF' '--color=always')
    case "${OSTYPE}" in
        freebsd*|darwin*)
            if type gls > /dev/null 2>&1; then
                cmd_ls='gls'
            else
                opt_ls=('-aCFG')
            fi
            ;;
    esac
    local ls_result
    ls_result=$(CLICOLOR_FORCE=1 COLUMNS=$COLUMNS command $cmd_ls ${opt_ls[@]} | sed $'/^\e\[[0-9;]*m$/d')
    local ls_lines=$(echo "$ls_result" | wc -l | tr -d ' ')
    if [ $ls_lines -gt 10 ]; then
        echo "$ls_result" | head -n 5
        echo '...'
        echo "$ls_result" | tail -n 5
        echo "$(command ls -1 -A | wc -l | tr -d ' ') files exist"
    else
        echo "$ls_result"
    fi
}

##### mkcdコマンドでmkdirとcdを同時に実行 #####
function mkcd() {
    if [[ -d $1 ]]; then
    cd $1
    else
    mkdir -p $1 && cd $1
    fi
}

##### '^' を押すと上のディレクトリに移動する #####
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

##### Proxy設定 #####
: << '#COMMENT_OUT'
#Proxy環境下でapt-get,yum,docker,git等を使う時に設定しておく
export HTTP_PROXY_USER=id
export HTTP_PROXY_PASS=pass
export HTTP_PROXY=http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@proxysrv:port/
export HTTPS_PROXY=${HTTP_PROXY}
#COMMENT_OUT

: << '#COMMENT_OUT'
#認証のないプロキシの時はこっちを使う
export http_proxy=http://<ProxyFQDN>:<ProxyPort>
export https_proxy=http://<ProxyFQDN>:<ProxyPort>
#COMMENT_OUT

: << '#COMMENT_OUT'
#GitにProxy設定を加える
git config --global http.proxy ${HTTP_PROXY}
git config --global https.proxy ${HTTPS_PROXY}
git config --global url."https://".insteadOf git://
#COMMENT_OUT
