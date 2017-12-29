set encoding=utf-8
scriptencoding utf-8

"##### DefaultSetting #####{{{
"Encoding
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
if(v:version >= 704)|set nofixeol|endif
"Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
if(v:version >= 800)|set breakindent|endif
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
"StatusLine
set laststatus=2
hi StatusLine gui=NONE guifg=Black guibg=DarkCyan cterm=NONE ctermfg=Black ctermbg=DarkCyan
set statusline=%F%h\%m%r%w%=\[%{&ff},%{&fenc!=''?&fenc:&enc},%Y][%3l/%3L]
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
"Search
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
"Color
syntax on
set t_Co=256
augroup ColorSetting
	autocmd!
	autocmd ColorScheme * highlight Normal ctermbg=none
	autocmd ColorScheme * highlight LineNr ctermbg=none
augroup END
" colorscheme hybrid
set background=dark
hi Comment gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi LineNr  gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi CursorLineNR  gui=NONE font=NONE guifg=#ffff00 guibg=NONE guisp=NONE cterm=NONE  term=NONE  ctermfg=226 ctermbg=NONE
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
set nrformats=alpha,octal,hex
set lazyredraw
set ttyfast
set updatetime=10
set shellslash

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
nnoremap Y y$
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
inoremap <<CR> <<CR>><Esc><S-o><TAB>
inoremap , ,<space>
"VisualMode
vnoremap <Tab> %
vnoremap v $h
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>
"CommandlineMode
cmap w!! w !sudo tee % > /dev/null

"##### Script #####
"ZenkakuSpase
highlight ZenkakuSpace term=underline cterm=reverse ctermfg=Red gui=reverse guifg=Red
augroup ZenkakuSpaceScript
	autocmd!
	autocmd BufNewFile,BufRead * match ZenkakuSpace /　/
augroup END

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
augroup CursorScript
	autocmd!
	autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
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
