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
call dein#add('osyo-manga/vim-brightest')
call dein#add('LeafCage/yankround.vim')
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
" Git Support
call dein#add('airblade/vim-gitgutter')
call dein#add('tpope/vim-fugitive')

"おためしプラグイン
call dein#add('thiagoalessio/rainbow_levels.vim')


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
"Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
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
nnoremap dd "_dd
vnoremap pp "0p
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
"Matchpairs
set showmatch
set matchtime=0
set matchpairs+=<:>,「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
"Color
syntax on
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
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
noremap L 10l
noremap H 10h
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
inoremap {} {}
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

"MacESC-IME
if has("mac")
let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
	augroup MyIMEGroup
	autocmd!
	autocmd InsertLeave * :call system(g:imeoff)
	augroup END
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
	\"outputter/buffer/split" : ":vertical 5sp",
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
let NERDTreeShowHidden = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"#####Commentout #####
nmap ,, gcc
vmap ,, gcc

"##### Yankround #####
nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)


"##### おためしプラグインとスクリプト #####
":Xでファイル暗号化
if has('cryptv')
  if v:version > 704 || v:version == 704 && has('patch401')
    set cryptmethod=blowfish2
  elseif v:version >= 703
    set cryptmethod=blowfish
  else
    set cryptmethod=zip
  endif
endif


map <leader>l :RainbowLevelsToggle<cr>
let g:rainbow_levels = [
    \{'ctermfg': 2, 'guifg': '#859900'},
    \{'ctermfg': 6, 'guifg': '#2aa198'},
    \{'ctermfg': 4, 'guifg': '#268bd2'},
    \{'ctermfg': 5, 'guifg': '#6c71c4'},
    \{'ctermfg': 1, 'guifg': '#dc322f'},
    \{'ctermfg': 3, 'guifg': '#b58900'},
    \{'ctermfg': 8, 'guifg': '#839496'},
    \{'ctermfg': 7, 'guifg': '#586e75'}]
