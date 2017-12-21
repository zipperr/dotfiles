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
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('Shougo/neocomplcache.vim')
call dein#add('Shougo/neocomplete.vim', {
    \ 'if' : has('lua')
    \ })
call dein#add('ujihisa/neco-look', {
    \ 'depends': ['neocomplete.vim'],
    \ 'if' : has('lua')
    \ })

call dein#end()
call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif

"##### basic config #####
"Encoding
set encoding=utf-8
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
"CommandLine
set wildmenu
set history=100
set infercase
"Clipboard
set clipboard=unnamed,autoselect
noremap PP "0p
noremap x "_x
"Other
set showmatch
set nocompatible
set belloff=all
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

"##### Neosnipett #####
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() <Bar><bar> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"##### Neocomplete, Neocomplcache #####
if has('lua')
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#auto_completion_start_length = 3
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_camel_case_completion = 1
let g:neocomplete#enable_underbar_completion = 1
let g:neocomplete#min_syntax_length = 3
let g:neocomplete#enable_quick_match = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#max_list = 20
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#enable_auto_close_preview = 0
let g:neocomplete#max_keyword_width = 10000
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size = 30000000
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif
else
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_auto_completion_start_length = 2
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
endif

let g:neocomplete#text_mode_filetypes = { "_" : 1 }

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### lightline #####
set laststatus=2
let g:lightline = {'colorscheme': 'wombat'}

"##### hybrid #####
syntax on
set term=builtin_linux
set ttytype=builtin_linux
set t_Co=256
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
colorscheme hybrid
set background=dark
set number
set cursorline
