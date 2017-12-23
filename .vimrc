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
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('ujihisa/neco-look')
call dein#add('scrooloose/syntastic')
call dein#add('thinca/vim-quickrun')
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
nnoremap x "_x
nnoremap dd "_dd
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
nnoremap <C-w> <C-w><C-w>
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

"##### Script #####
"SpaceHiglight
augroup highlightIdegraphicSpace
	autocmd!
	autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
	autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

"Paste
if &term =~ "xterm"
	let &t_SI .= "\e[?2004h"
	let &t_EI .= "\e[?2004l"
	let &pastetoggle = "\e[201~"
	function XTermPasteBegin(ret)
	set paste
	return a:ret
	endfunction
	inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"CursorRetune
augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal g`\"" | endif
augroup END

"##### OSenvironment #####
if has("mac")
"Script
let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
	augroup MyIMEGroup
	autocmd!
	autocmd InsertLeave * :call system(g:imeoff)
	augroup END
elseif has("unix")
"sentOS
"set term=builtin_linux
"set ttytype=builtin_linux
elseif has("win64")
elseif has("win32unix")
elseif has("win32")
endif

"##### Neocomplcache, Neosnippet #####
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 0
let g:neocomplcache_enable_at_startuple_auto_select = 1
let g:neocomplcache_enable_insert_char_pre = 1
let g:neocomplcache_text_mode_filetypes = {
	\'rst':1,
	\'markdown':1,
	\'gitrebase':1,
	\'gitcommit':1,
	\'vcs-commit':1,
	\'text':1,
	\'tex': 1,
	\'plaintex': 1,
	\'help':1,
	\'vim' :1,
	\'zsh':1,
	\'python':1,
\}
inoremap <expr><BS> neocomplcache#smart_close_popup()."<C-h>"
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"##### syntax #####
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_loc_list_height = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"##### quickrun #####
let g:quickrun_config = {"_" : {
\		"runner" : "vimproc",
\		"runner/vimproc/updatetime" : 60,
\		"outputter" : "error",
\		"outputter/error/success" : "buffer",
\		"outputter/error/error" : "buffer",
\		"outputter/buffer/split" : ":vertical 5sp",
\		"outputter/buffer/close_on_empty" : 0
\		}}
set splitright
nnoremap <C-q> :QuickRun<CR>
nnoremap q :<C-u>bw! \[quickrun\ output\]<CR>

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### lightline #####
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

"##### hybrid #####
syntax on
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
set number
set cursorline
