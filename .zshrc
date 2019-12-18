export EDITOR=vim
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true
bindkey -v
setopt print_eight_bit
setopt no_beep
setopt no_hist_beep
setopt no_list_beep
setopt auto_cd
setopt AUTO_NAME_DIRS
setopt correct
setopt prompt_subst
setopt notify
setopt chase_links
setopt AUTO_RESUME
export TERM=xterm-256color
autoload -U colors && colors
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export PATH=$HOME/bin:/usr/local/bin:$PATH
setopt nonomatch
#vim用設定
stty -ixon -ixoff
stty stop undef
stty start undef
export KEYTIMEOUT=1

##### alias #####
if [ "$(uname)" == "Darwin" ]; then
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
    alias ls='ls -a  --color=auto'
    alias desk='cd ~/Desktop'
fi

alias sudo='sudo '
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'
alias -g V='| vim -R -'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias emacs='vim'
alias vi='vim'
alias v='vim'
alias g='git'
alias server='python -m SimpleHTTPServer'
alias server3='python -m http.server'
alias w3="w3m -B"
alias ssh='ssh zip@60.116.182.149'

#grep
function grep() {find . -name '*' -print0 |xargs -0 grep --color=always -s -I -n $1 |awk '{print substr($0, 1, 180) "..." }'}

##### Completion ####
autoload -U compinit
compinit -u
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
setopt auto_param_keys
setopt auto_param_slash
setopt noautoremoveslash
setopt auto_pushd
setopt complete_aliases
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
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

##### histry #####
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt share_history
setopt append_history
setopt pushd_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt extended_glob
setopt extended_history
if [ $UID = 0 ]; then
    unset HISTFILE
    SAVEHIST=0
fi

# PROMPT
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
SPROMPT="もしかして: %r  (y, n, a, e)-> "
PROMPT='%{${fg[cyan]}%}(%T)[%n@%m][%~]%{%{$reset_color%}%}${vcs_info_msg_0_}
$ '

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

##### mkdir+cd #####
function mkcd() {
    if [[ -d $1 ]]; then
        cd $1
    else
        mkdir -p $1 && cd $1
    fi
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

##### Proxy #####
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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -  2>/dev/null)"

export JAVA_HOME=`/usr/libexec/java_home -v 13  2>/dev/null`
export PATH="$JAVA_HOME/bin:$PATH"

export PATH_TO_FX="/Library/Java/JavaVirtualMachines/javafx-sdk-11.0.2/lib"
export PATH="$PATH_TO_FX:$PATH"
