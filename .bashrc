# 基本設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export LANG='ja_JP.UTF-8' #文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s dirspell
complete -cf sudo #sudoの後も候補予測する

# コマンド履歴
export HISTSIZE=100000  # 現在使用中のbashが保持するコマンド履歴数
export HISTFILESIZE=100000  # 履歴ファイルに保存される履歴数
export HISTCONTROL=ignoredups   # 同じコマンドが連続する場合は1回だけ記録する
export HISTCONTROL=ignorespace  # コマンドの頭にスペースを付けて実行すると記録しない
export HISTCONTROL=ignoreboth   # ignoredupsとignorespaceどちらも設定する
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S' # historyコマンドで表示された際のコマンド履歴に日付を追加

# ctrl+s で出力がロックされてしまうのを防ぐ
stty stop undef

# エイリアス
if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -a -G'  #mac用
else
    alias ls='ls -a  --color=auto'  #その他
fi

alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias v='vim'
alias vi='vim'
alias g='git'
alias ..='cd ..'
alias onkey="sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/"   #mac本体のキーボードを有効にする
alias offkey="sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext/" #mac本体のキーボードを無効にする
alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"   #DS_Store削除

#プロンプト表示 (時間)[ユーザ名@ホスト名][場所][ブランチ名]で表示
source $HOME/.git-prompt.sh
if [ "$(uname)" == 'Darwin' ]; then     #mac用
export PS1='\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then   #Linux用
export PS1='\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then    #Gitbash,Cygwin 64bit用
export PS1="\[\e[036m\](\t)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then    #Gitbash,Cygwin 32bit用
export PS1="\[\e[036m\](\t)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
else    #その他(ブランチ名は表示しない)
export PS1="\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[m\]"
fi

# cdしたらlsする
cd ()
{
    builtin cd "$@" && ls
}

# mkdirしたらcdする
function mkcd() {
    mkdir $1;
    cd $1;
}
alias mkcd=mkcd

#在処が全然解らないファイルを力尽くで探す
function fa() {
    sudo find / -name "$1" -ls;
}
alias fa=fa

#置換コマンド(sr 置換前の文字列 置換後の文字列)
function sr {
    find . -type f -exec sed -i '' s/$1/$2/g {} +
}

#change_色名でターミナルの色を変える (デフォルトターミナル、端末でのみ有効)
BASE_COLOR_CHANGE='tell application "Terminal" to set current settings of first window to settings set '
PREFIX_COLOR_CHANGE='/usr/bin/osascript -e '"'"$BASE_COLOR_CHANGE
alias change_default=$PREFIX_COLOR_CHANGE' "Pro"'"'"
alias change_blue=$PREFIX_COLOR_CHANGE' "Ocean"'"'"
alias change_red=$PREFIX_COLOR_CHANGE' "Red Sands"'"'"
alias change_silver=$PREFIX_COLOR_CHANGE' "Silver Aerogel"'"'"
alias change_green=$PREFIX_COLOR_CHANGE' "Grass"'"'"

#簡易サーバーを立てる
alias server='python -m SimpleHTTPServer'   #簡易サーバーを立てる デフォルトは8000 引数で設定可↲
alias server3='python -m http.server'   #python3はこっち↲
alias ip='ifconfig'     #IPを表示する

#googleコマンドで検索する
google(){
    if [ $(echo $1 | egrep "^-[cfs]$") ]; then
        local opt="$1"
        shift
    fi
    local url="https://www.google.co.jp/search?q=${*// /+}"
    local app="/Applications"
    local g="${app}/Google Chrome.app"
    local f="${app}/Firefox.app"
    local s="${app}/Safari.app"
    case ${opt} in
        "-g")   open "${url}" -a "$g";;
        "-f")   open "${url}" -a "$f";;
        "-s")   open "${url}" -a "$s";;
        *)      open "${url}";;
    esac
}

#設定した時間に牛が通知してくれるアラームコマンド 例:alarm 'メッセージ' 9:50
alarm(){
    echo "echo $1 | cowsay | wall" | at $2
}

<< '#COMMENT_OUT'
#Proxy環境下でapt-get,yum,docker,git等を使う時に設定しておく
export HTTP_PROXY_USER=id
export HTTP_PROXY_PASS=pass
export HTTP_PROXY=http://${HTTP_PROXY_USER}:${HTTP_PROXY_PASS}@proxysrv:port/
export HTTPS_PROXY=${HTTP_PROXY}
#COMMENT_OUT

<< '#COMMENT_OUT'
#認証のないプロキシの時はこっちを使う
export http_proxy=http://<ProxyFQDN>:<ProxyPort>
export https_proxy=http://<ProxyFQDN>:<ProxyPort>
#COMMENT_OUT

<< '#COMMENT_OUT'
#GitにProxy設定を加える
git config --global http.proxy ${HTTP_PROXY}
git config --global https.proxy ${HTTPS_PROXY}
git config --global url."https://".insteadOf git://
#COMMENT_OUT

