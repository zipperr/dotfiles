XCOPY %HOMEPATH%"\dotfiles\.vimrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.zshrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.minttyrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.bashrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.gitconfig" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.gitignore_global" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.git-prompt.sh" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.vim\colors\hybrid.vim" %HOMEPATH%"\.vim\colors\" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.vim\snippets" %HOMEPATH%"\.vim\snippets" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.vim\templates" %HOMEPATH%"\.vim\templates" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.vim\dll\vimproc_cygwin.dll" %HOMEPATH%"\.vim\dein\repos\github.com\Shougo\vimproc.vim\lib\" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.vim\tmp\yankring_history_v2.txt" %HOMEPATH%"\.vim\tmp\" /D /S /R /I /K /Y
exit 0
