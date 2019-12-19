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
stty -ixon -ixoff
stty stop undef
stty start undef

# Compaletion
[ -n "${BASH_COMPLETION}" ] || \
      export BASH_COMPLETION="$HOME/.bash_completion"
. $BASH_COMPLETION

if [ "$(uname)" == "Darwin" ]; then
    alias python='python3'
    alias pip='pip3'
    alias ls='ls -a -G'
    alias ip='ifconfig'
    alias desk='cd ~/Desktop'
elif [ "$(expr substr $(uname -s) 1 5)" == "MINGW" ]; then
    alias python='winpty python.exe'
    alias ls='ls -a  --color=auto'
    alias ip='ipconfig /all'
    userName=$(whoami)
    alias desk='cd /c/Users/${userName}/Desktop'
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    alias python='python3'
    alias pip='pip3'
    alias ls='ls -a  --color=auto'
    alias ip='ifconfig'
    alias desk='cd ~/Desktop'
fi

alias sudo='sudo '
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
alias ssh='ssh zip@60.116.182.149'

#grep
function grep() {
    find . -name '*' -print0 |xargs -0 grep --color=always -s -I -n $1 | awk '{print substr($0, 0, 180) "..."}'
}

#(時間)[ユーザ名@ホスト名][場所][ブランチ名]
source $HOME/.git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=true
if [ "$(uname)" == 'Darwin' ]; then                              #mac
    export PS1='\[\e[036m\](\A)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then       #Linux
    export PS1='\[\e[036m\](\A)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[31m\]$(__git_ps1 "[%s]")\[\e[0m\]\n\$ '
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW64_NT' ]; then #Gitbash,Cygwin 64bit
    export PS1="\[\e[036m\](\A)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
elif [ "$(expr substr $(uname -s) 1 10)" == 'MINGW32_NT' ]; then #Gitbash,Cygwin 32bit
    export PS1="\[\e[036m\](\A)[\u@\h][\w]\[\e[31m\]\$(__git_ps1 '[%s]')"$'\[\e[0m\]\n$'
else
    export PS1="\[\e[036m\](\A)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[m\]"
fi

cd (){
    builtin cd "$@" && ls
}

#### extract ####
function extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -  2>/dev/null)"

export JAVA_HOME=`/usr/libexec/java_home -v 13 2>/dev/null`
export PATH="$JAVA_HOME/bin:$PATH"

export PATH_TO_FX="/Library/Java/JavaVirtualMachines/javafx-sdk-11.0.2/lib"
export PATH="$PATH_TO_FX:$PATH"
