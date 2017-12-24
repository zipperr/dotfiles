set encoding=utf-8
scriptencoding utf-8

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
"Move
set virtualedit=onemore
set wrap
set nocompatible
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
colorscheme darkblue
set background=dark
hi LineNr ctermfg=gray
hi Comment ctermfg=gray

"CursorLine
set cursorline
set number
hi clear CursorLine
"Other
set vb t_vb=
set lazyredraw
set ttyfast
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
vnoremap v $h
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>

"##### Script #####
"ZenkakuSpase
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=Red gui=reverse guifg=Red
endfunction
augroup ZenkakuSpace
autocmd!
autocmd ColorScheme       * call ZenkakuSpace()
autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
augroup END
call ZenkakuSpace()

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

"##### Statusline #####
set laststatus=2
set statusline=\[%{SnipMid(expand('%:p:h'),80-len(expand('%:p:t')),'A...')}/%{expand('%:p:t')}\]%<%=\ %m%r%w[%Y,%{&fenc!=''?&fenc:&enc},%{s}][%3l/%3L]
function! SnipMid(str, len, mask)
	if a:len >= len(a:str)
		return a:str
	elseif a:len <= len(a:mask)
	return a:mask
	endif
		let len_head = (a:len - len(a:mask)) / 2
		let len_tail = a:len - len(a:mask) - len_head
	return (len_head > 0 ? a:str[: len_head - 1] : '') . a:mask . (len_tail > 0 ? a:str[-len_tail :] : '')
endfunction

let dic_line = {'dos': 'CRLF', 'unix': 'CR', 'mac': 'LF'}
let f = &fileformat
let s = ''
if has_key(dic_line, f)
	let s = dic_line[f]
else
	let s = 'unkwown'
endif

hi StatusLine gui=NONE guifg=Black guibg=DarkCyan cterm=NONE ctermfg=Black ctermbg=DarkCyan
let g:hi_insert = 'highlight StatusLine guifg=Black guibg=DarkGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen'
if has('syntax')
	augroup InsertHook
	autocmd!
	autocmd InsertEnter * call s:StatusLine('Enter')
	autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
		redraw
	endif
endfunction
function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction
