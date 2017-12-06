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
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('itchyny/lightline.vim')
call dein#add('scrooloose/nerdtree')
call dein#add('tpope/vim-fugitive')
call dein#add('rhysd/accelerated-jk')
call dein#add('Yggdroot/indentLine')
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

"##### Unite #####
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

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

"##### Neosnippet #####
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)"
    \: "\<TAB>"

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

"##### lightline #####
set laststatus=2
set t_Co=256
let g:lightline = {'colorscheme': 'wombat'}

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### syntastic #####
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_check_on_wq = 0

"##### settings #####
set encoding=utf-8
scriptencoding utf-8
set fenc=utf-8
set title
set showmatch
set mouse=a
set vb t_vb=
set clipboard=unnamed,autoselect
set nobackup
set noswapfile
autocmd FileType * setlocal formatoptions-=ro
set tw=0
set formatoptions=q

"##### encode #####
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=dos,unix,mac
set ambiwidth=double

"##### TAB,indent #####
set expandtab
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set shiftwidth=4

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

noremap PP "0p
noremap x "_x

augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

set list
set listchars=tab:»-,trail:-,nbsp:%

"##### searce settings #####
set incsearch
set ignorecase
set smartcase
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"##### cursor #####
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
vnoremap <down> gj
vnoremap <up> gk
set backspace=indent,eol,start
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
set wildmenu
set history=10000
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
inoremap , ,<Space>

"##### color settings #####
syntax on
set background=dark
autocmd Colorscheme * highlight Normal ctermbg=none
autocmd Colorscheme * highlight LineNr ctermbg=none
let g:solarized_termcolors=256
colorscheme hybrid

"###### ather #######
inoremap <silent> jj <ESC>
autocmd BufWritePre * :%s/\s\+$//ge
cmap w!! w !sudo tee > /dev/null %
set timeout timeoutlen=40

"Esckey(macOnly)
if has('mac')
let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
    augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
    augroup END
endif
