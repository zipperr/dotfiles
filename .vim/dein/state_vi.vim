if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/Users/zip/.vimrc'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/zip/.vim/dein'
let g:dein#_runtime_path = '/Users/zip/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/Users/zip/.vim/dein/.cache/.vimrc'
let &runtimepath = '/Users/zip/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/zip/.vim,/Users/zip/.vim/dein/repos/github.com/Shougo/vimproc.vim,/Users/zip/.vim/dein/repos/github.com/vim-scripts/javacomplete,/Users/zip/.vim/dein/.cache/.vimrc/.dein,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/Users/zip/.vim/dein/.cache/.vimrc/.dein/after,/usr/share/vim/vimfiles/after,/Users/zip/.vim/after,/Users/zip/.vim/dein/repos/github.com/Shougo/dein.vim'
