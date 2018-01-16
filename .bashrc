export PATH=$PATH:/sbin:/usr/sbin
export PAGER='/usr/bin/lv -c'
export EDITOR='/usr/bin/vim'
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
shopt -s cdable_vars
shopt -s autocd
shopt -s dirspell
shopt -s cdspell
complete -cf sudo
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=ignoredups
export HISTCONTROL=ignorespace
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%Y/%m/%d %H:%M:%S'
#vimでC-q
stty stop undef
stty start undef

# Compaletion
[ -n "${BASH_COMPLETION}" ] || \
      export BASH_COMPLETION="$HOME/.bash_completion"
. $BASH_COMPLETION

if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -a -G'
else
    alias ls='ls -a  --color=auto'
fi

alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias sc='screen'
alias ps='ps --sort=start_time'
alias v='vim'
alias vi='vim'
alias emacs='vim'
alias g='git'
alias ..='cd ..'
alias server='python -m SimpleHTTPServer'
alias server3='python -m http.server'
alias desk='cd /cygdrive/c/Users/taniuchi/Desktop'

#grep
function grep() {
    find ./ -type f -print | xargs grep -n --color=auto $1 /dev/null
}

#(時間)[ユーザ名@ホスト名][場所][ブランチ名]
source $HOME/.git-prompt.sh
export PS1='\[\e[036m\](\A)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '

cd (){
    builtin cd "$@" && ls
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
