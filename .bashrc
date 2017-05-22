# 基本設定
export PATH=$PATH:/sbin:/usr/sbin # パス
export PAGER='/usr/bin/lv -c' # man とかで使われる
export EDITOR='/usr/bin/vim' # visudo とかで使われる
export LANG='ja_JP.UTF-8' #文字コード
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

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
alias ls='ls -a -G'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'
alias v='vim'
alias vi='vim'


# プロンプトの表示 (時間)[ユーザー名@ホスト名][カレントディレクトリ]で表示
PS1="\[\e[036m\](\t)\[\e[036m\]\[\e[036m\][\u@\h]\[\e[36m\][\w]\[\e[m\]"

# cdしたらlsする
cd ()
{
    builtin cd "$@" && ls
}

shopt -s autocd
shopt -s cdable_vars
shopt -s cdspell
shopt -s dirspell
