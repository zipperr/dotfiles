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
	execute 'set runtimepath^=' . s:dein_repo_dir
endif
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

"##### PluginList #####
call dein#add('Shougo/dein.vim')
" Utility
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Shougo/unite.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tomtom/tcomment_vim')
" Programming Support
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('scrooloose/syntastic')
call dein#add('ujihisa/neco-look')
call dein#add('thinca/vim-quickrun')
" Theme / Interface
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('osyo-manga/vim-brightest')
" Git Support
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')
" Twitter
call dein#add('tyru/open-browser.vim')
call dein#add('basyura/TweetVim')
call dein#add('basyura/twibill.vim')
call dein#end()
call dein#save_state()
endif
if dein#check_install()
	call dein#install()
endif

"##### DefaultSetting #####
"Encoding
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
set nofixeol
"Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set breakindent
"Invisibles
set list
set listchars=tab:>-,trail:-
"SwapFile
set nobackup
set noswapfile
set viminfo+=n~/.vim/viminfo.txt
set noundofile
"Move
set virtualedit=onemore
set wrap
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set scrolloff=3
"CommandLine
set wildmenu
set history=100
set infercase
"Clipboard
set clipboard=unnamed,autoselect
nnoremap x "_x
vnoremap pp "0p
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"Matchpairs
set showmatch
set matchtime=0
set matchpairs+=<:>,「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
"Search
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
"Color
syntax on
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
hi Comment gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi LineNr gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi SpecialKey gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi IncSearch gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
hi Search gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
hi MatchParen gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
"CursorLine
set cursorline
set number
hi clear CursorLine
"Other
set vb t_vb=
set lazyredraw
set ttyfast
set shellslash
cmap w!! w !sudo tee % > /dev/null

"##### KeyMapping #####
let mapleader = "\<Space>"
"NormalMode+VisualMode
noremap J 20j
noremap K 20k
noremap L $
noremap H ^
"NormalMode
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-w> <C-w><C-w>
nnoremap <Tab> %
nnoremap r <C-r>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
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
inoremap {} {
inoremap <> <>
inoremap {<CR> {<CR>}<Esc><S-o>
inoremap (<CR> (<CR>)<Esc><S-o><TAB>
inoremap [<CR> [<CR>]<Esc><S-o><TAB>
inoremap <<cr> <<cr>><esc><s-o><tab>
inoremap , ,<space>
"VisualMode
vnoremap <Tab> %
vnoremap v $h
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>

"##### Script #####
"ZenkakuSpase
highlight ZenkakuSpace term=underline cterm=reverse ctermfg=Red gui=reverse guifg=Red
au BufNewFile,BufRead * match ZenkakuSpace /　/

"PasteIndent
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

"encryptionFile
if has('cryptv')
  if v:version > 704 || v:version == 704 && has('patch401')
	set cryptmethod=blowfish2
  elseif v:version >= 703
	set cryptmethod=blowfish
  else
	set cryptmethod=zip
  endif
endif

"##### Neocomplcache, Neosnippet #####
let g:neocomplcache_enable_at_startup = 1
let g:NeoComplCache_SmartCase = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:NeoComplCache_PreviousKeywordCompletion = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_EnableUnderbarCompletion = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_manual_completion_start_length = 0
let g:neocomplcache_min_keyword_length = 2
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
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
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

"##### syntastic #####
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
	\"runner" : "vimproc",
	\"runner/vimproc/updatetime" : 60,
	\"outputter" : "error",
	\"outputter/error/success" : "buffer",
	\"outputter/error/error" : "buffer",
	\"outputter/buffer/split" : ":vertical 35",
	\"outputter/buffer/close_on_empty" : 0
\}}
set splitright
nnoremap <C-q> :QuickRun<CR>
nnoremap q :<C-u>bw! \[quickrun\ output\]<CR>

"##### lightline #####
set laststatus=2
let g:lightline = {
	\'colorscheme': 'wombat',
	\'active': {
		\'left': [ ['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
		\'right': [ [ 'syntastic', 'lineinfo' ], ['percent'],[ 'fileformat', 'fileencoding', 'filetype' ] ]
	\},
	\'component': {
		\'readonly': '%{&readonly?"RO":""}',
	\},
	\'component_function': {
		\'fugitive': 'LightlineFugitive',
		\'filename': 'LightlineFilename',
		\'fileformat': 'LightlineFileformat',
		\'filetype': 'LightlineFiletype',
		\'fileencoding': 'LightlineFileencoding',
		\'mode': 'LightlineMode',
	\},
	\'component_expand': {
		\'syntastic': 'SyntasticStatuslineFlag',
	\},
	\'component_type': {
		\'syntastic': 'error',
	\}
\}
function! LightlineFugitive()
	return exists('*fugitive#head') ? fugitive#head() : ''
endfunction
function! LightlineFilename()
let fname = expand('%:t')
return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
	\ fname =~ 'NERD_tree' ? '' :
	\ &ft == 'unite' ? unite#get_status_string() :
	\ ('' != fname ? fname : '[No Name]')
endfunction
function! LightlineFileformat()
	return winwidth(0) > 70 ? &fileformat : ''
endfunction
function! LightlineFiletype()
	return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
function! LightlineFileencoding()
	return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction
function! LightlineMode()
	let fname = expand('%:t')
	return fname == 'ControlP' ? 'CtrlP' :
		\fname =~ 'NERD_tree' ? 'NERDTree' :
		\&ft == 'unite' ? 'Unite' :
		\winwidth(0) > 30 ? lightline#mode() : ''
endfunction
function! s:syntastic()
	SyntasticCheck
	call lightline#update()
endfunction

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd FileType NERDTree nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd FileType NERDTree inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
let NERDTreeShowHidden = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"#####Commentout #####
nmap ,, gcc
vmap ,, gcc

"##### Tweetvim #####
nnoremap <F2> :TweetVimUserStream<CR>
nnoremap <F3> :TweetVimCommandSay<CR>
let g:tweetvim_config_dir = expand('~/.vim/.tweetvim')
let g:tweetvim_display_time = 1
let g:tweetvim_open_buffer_cmd = '25vsplit'
let g:tweetvim_display_separator = 0
let g:tweetvim_display_source = 0
let g:tweetvim_async_post = 1
let g:tweetvim_tweet_per_page = 50
let g:tweetvim_include_rts = 1
augroup TweetVimSetting
	autocmd!
	autocmd FileType tweetvim set nonumber
	autocmd FileType tweetvim set noequalalways
augroup END
" let $http_proxy	= 'http://xxx.xx.xx:8080'
" let $HTTPS_PROXY	= 'http://xxx.xx.xx:8080'

"##### UniteMenu #####
nnoremap <F1> :Unite -toggle -silent -vertical -winwidth=30 -wrap menu:shortcut<CR>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.shortcut = {"description" : "shortcut",}
let g:unite_source_menu_menus.shortcut.command_candidates = [
	\[ "[web]Github", "OpenBrowser https://github.com/zipperr" ],
	\[ "[web]Google", "OpenBrowser https://www.google.co.jp" ],
	\[ "[web]GoogleDrive", "OpenBrowser https://drive.google.com" ],
	\[ "[web]Qiita", "OpenBrowser https://qiita.com" ],
	\[ "[web]Wiki", "OpenBrowser https://ja.wikipedia.org" ],
	\[ "[web]Slack", "OpenBrowser https://vim-jp.slack.com" ],
	\[ "[vim]Twitter", "TweetVimUserStream" ],
	\[ "[vim]Tweet", "TweetVimCommandSay" ],
	\[ "[vim]SyntaxOn", "set syntax=on" ],
	\[ "[vim]SyntaxOff", "set syntax=off" ],
	\[ "[vim]BGdark", "set background=dark" ],
	\[ "[vim]BGlight", "set background=light" ],
	\[ "[vim]TweetVimNewToken", "TweetVimAccessToken" ],
	\[ "[File]Tab > Space", "set expandtab|retab 4" ],
	\[ "[File]Space > Tab", "set noexpandtab | retab! 4" ],
	\[ "[File]Open_UTF8", "e ++enc=utf-8" ],
	\[ "[File]Open_ShiftJis", "e ++enc=cp932" ],
	\[ "[File]Open_euc-jp", "e ++enc=euc-jp" ],
	\[ "[File]Open_iso-2022-jp", "e ++enc=iso-2022-jp" ],
	\[ "[File]Open_Dos", "e ++ff=dos" ],
	\[ "[File]Open_Mac", "e ++ff=mac" ],
	\[ "[File]Open_Unix", "e ++ff=unix" ],
	\[ "[File]Set_UTF8", "set fenc=utf-8" ],
	\[ "[File]Set_ShiftJis", "set fenc=cp932" ],
	\[ "[File]Set_euc-jp", "set fenc=euc-jp" ],
	\[ "[File]Set_iso-2022-jp", "set fenc=iso-2022-jp" ],
	\[ "[File]Set_Dos", "set ff=dos" ],
	\[ "[File]Set_Mac", "set ff=mac" ],
	\[ "[File]Set_Unix", "set ff=unix" ],
	\[ "[File]EOLdelete", "set binary noeol|wq" ],
	\[ "[Toggle]Number", "set number!" ],
	\[ "[Toggle]BreakIndent", "set breakindent!" ],
	\[ "[Toggle]CursorColumn", "set cursorcolumn!" ],
	\[ "[Toggle]CursorLine", "set cursorline!" ],
	\[ "[Toggle]HilightSeach", "set hlsearch!" ],
	\[ "[Toggle]ShowMatch", "set showmatch!" ],
	\[ "[Toggle]Wrap", "set wrap!" ],
	\[ "[Edit]vimrc", "edit $MYVIMRC"],
	\[ "[Edit]zshrc", "edit ~/.zshrc"],
	\[ "[Edit]bashrc", "edit ~/.bashrc"],
	\[ "[Edit]gitconf", "edit ~/.gitconfig"],
\]
augroup UniteSetting
	autocmd!
	autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
	autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
	autocmd FileType unite set noequalalways
augroup END
