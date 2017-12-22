XCOPY %HOMEPATH%"\dotfiles\.vimrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.bashrc" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.gitconfig" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.gitignore_global" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\.git-prompt" %HOMEPATH% /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\vimproc\vimproc_cygwin.dll" %HOMEPATH%"\.vim\dein\repos\github.com\Shougo\vimproc.vim\lib\" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\vimproc\vimproc_win32.dll" %HOMEPATH%"\.vim\dein\repos\github.com\Shougo\vimproc.vim\lib\" /D /S /R /I /K /Y
XCOPY %HOMEPATH%"\dotfiles\vimproc\vimproc_win64.dll" %HOMEPATH%"\.vim\dein\repos\github.com\Shougo\vimproc.vim\lib\" /D /S /R /I /K /Y
exit 0
