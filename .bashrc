export PATH=$PATH:/sbin:/usr/sbin
export PAGER='/usr/bin/lv -c'
export EDITOR='/usr/bin/vim'
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
shopt -s cdable_vars
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

if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -a -G'
else
    alias ls='ls -a  --color=auto'
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
alias server='python -m SimpleHTTPServer'
alias server3='python -m http.server'

#(時間)[ユーザ名@ホスト名][場所][ブランチ名]
source $HOME/.git-prompt.sh
if [ "$(uname)" == 'Darwin' ]; then     #mac
export PS1='\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then   #Linux
export PS1='\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then    #Gitbash,Cygwin 64bit
export PS1="\[\e[036m\](\t)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then    #Gitbash,Cygwin 32bit
export PS1="\[\e[036m\](\t)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
else
export PS1="\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[m\]"
fi

cd (){
    builtin cd "$@" && ls
}
shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s dirspell

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
