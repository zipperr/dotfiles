set encoding=utf-8
scriptencoding utf-8
let g:vimproc#download_windows_dll = 1

"##### Plugin #####
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
	endif
	execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

"##### PluginList #####
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
	\ 'build': {
	\     'windows' : 'make -f make_mingw64.mak',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make -f make_mac.mak',
	\     'linux'   : 'make',
	\     'unix' : 'make -f make_unix.mak',
	\    },
	\ })
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('ujihisa/neco-look')
call dein#add('scrooloose/syntastic')
call dein#end()
call dein#save_state()
endif
if dein#check_install()
	call dein#install()
endif

"##### basic config #####
"Encoding
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
"Indent
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"Invisibles
set list
set listchars=tab:>-,trail:-
augroup highlightIdegraphicSpace
	autocmd!
	autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
"SwapFile
set nobackup
set noswapfile
"Move
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set nowrap
set mouse=a
set wrap
"CommandLine
set wildmenu
set history=100
set infercase
"Clipboard
set clipboard=unnamed,autoselect
"Other
set showmatch
set nocompatible
set vb t_vb=
set shellslash
cmap w!! w !sudo tee % > /dev/null

"##### KeyMapping #####
"NormalMode+VisualMode
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h
"NormalMode
nnoremap r <C-r>
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
"InsertMode
inoremap <silent> jj <ESC>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap < <><Left>
inoremap ' ''<Left>
inoremap " ""<Left>
inoremap "" ""
inoremap '' ''
inoremap () ()
inoremap [] []
inoremap {} {}
inoremap <> <>
inoremap {<CR> {<CR>}<Esc><S-o>
inoremap (<CR> (<CR>)<Esc><S-o><TAB>
inoremap [<CR> [<CR>]<Esc><S-o><TAB>
inoremap <<CR> <<CR>><Esc><S-o><TAB>
inoremap , ,<Space>

"##### Neocomplcache, Neosnippet #####
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_text_mode_filetypes = {
	\ 'markdown' : 1,
	\ 'gitcommit' : 1,
	\ 'text' : 1,
	\ 'vim' : 1,
	\ }
inoremap <expr><BS> neocomplcache#smart_close_popup()."<C-h>"
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"##### syntax #####
let g:syntastic_enable_signs = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### lightline #####
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

"##### hybrid #####
syntax on
"set term=builtin_linux
"set ttytype=builtin_linux
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
set number
set cursorline
