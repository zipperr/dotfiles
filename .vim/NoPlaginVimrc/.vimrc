"##### Stratup #####
set encoding=utf-8
scriptencoding utf-8
augroup vimrc
	autocmd!
augroup END

"Encoding
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
if v:version >= 704|set nofixeol|endif
"Indent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
if v:version >= 800|set breakindent|endif
"Runtimepath
set runtimepath+=$HOME/.vim,$HOME/.vim/after
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
set scrolloff=5
"Clipboard
set clipboard=unnamed,autoselect
nnoremap x "_x
nnoremap dd "_dd
vnoremap pp "0p
"Matchpair
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
autocmd vimrc ColorScheme * highlight Normal ctermbg=none
autocmd vimrc ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
hi Comment gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi LineNr  gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi CursorLineNR  gui=NONE font=NONE guifg=#ffff00 guibg=NONE guisp=NONE cterm=NONE  term=NONE  ctermfg=226 ctermbg=NONE
hi SpecialKey gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE  term=NONE ctermfg=59 ctermbg=NONE
hi IncSearch gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
hi Search gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
hi MatchParen gui=underline font=NONE guifg=NONE guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
"StatusLine
set laststatus=2
set statusline=%F%h\%m%r%w%=\[%{&ff},%{&fenc!=''?&fenc:&enc},%Y][%3l/%3L][%{strftime('%k:%M')}]
au vimrc VimEnter * hi StatusLine gui=NONE guifg=Black guibg=DarkCyan cterm=NONE ctermfg=Black ctermbg=DarkCyan
au vimrc InsertEnter * hi StatusLine gui=NONE guifg=Black guibg=DarkGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
au vimrc InsertLeave * hi StatusLine gui=NONE guifg=Black guibg=DarkCyan cterm=NONE ctermfg=Black ctermbg=DarkCyan
"CursorLine
set cursorline
set number
hi clear CursorLine
"CommandLine
set showcmd
set wildmenu
set history=100
set infercase
"Other
set vb t_vb=
set nrformats=alpha,octal,hex
set lazyredraw
set ttyfast
set updatetime=10
set shellslash
if v:version >= 704 | set cm=blowfish2 | elseif | set cm=zip | endif

"##### KeyMapping #####
let g:mapleader = "\<Space>"
"NormalMode+VisualMode
noremap J 20j
noremap K 20k
noremap L $
noremap H ^
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <Tab> %
"NormalMode
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <C-w> <C-w><C-w>
nnoremap r <C-r>
nnoremap Y y$
nnoremap p p`]
nnoremap <Enter> o<ESC>
nnoremap <S-Left> <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
"InsertMode
inoremap jj <ESC>
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
inoremap (<CR> (<CR>)<Esc><S-o>
inoremap [<CR> [<CR>]<Esc><S-o>
inoremap <<CR> <<CR>><Esc><S-o>
inoremap , ,<space>
"VisualMode
vnoremap v $h
vnoremap * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>
"CommandlineMode
cmap w!! w !sudo tee % > /dev/null
cmap wb set binary noeol<CR> :wq<CR>

"##### Script #####
"HiglightZenkakuSpase
hi ZenkakuSpace term=underline cterm=reverse ctermfg=Red gui=reverse guifg=Red
autocmd vimrc BufNewFile,BufRead * match ZenkakuSpace /　/

"CursorRetune
autocmd vimrc BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

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
