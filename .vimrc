set encoding=utf-8
scriptencoding utf-8
filetype on
augroup vimrc
    autocmd!
augroup END

"----- Plugin Setting-----
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
    call dein#add('Shougo/dein.vim')            " プラグイン管理
    call dein#add('Shougo/unite.vim')           " ランチャー
    call dein#add('scrooloose/nerdtree')        " ファイルツリー
    call dein#add('Shougo/neocomplcache.vim')   " 補完
    call dein#add('Shougo/neosnippet.vim')      " スニペット
    call dein#add('Shougo/neosnippet-snippets') " デフォルトスニペット
    call dein#add('honza/vim-snippets')         " 追加スニペット
    call dein#add('w0rp/ale')                   " 構文チェック
    call dein#add('zipperr/vim-template')       " テンプレート
    call dein#add('thinca/vim-quickrun')        " コード実行
    call dein#add('tomtom/tcomment_vim')        " コメントアウトトグル
    call dein#add('AndrewRadev/switch.vim')     " リテラルトグル
    call dein#add('junegunn/vim-easy-align')    " 整形
    call dein#add('Townk/vim-autoclose')        " 閉じ括弧補完
    call dein#add('airblade/vim-gitgutter')     " Git差分表示
    call dein#add('tpope/vim-fugitive')         " Git操作
    call dein#add('itchyny/lightline.vim')      " ステータスライン
    call dein#add('maximbaz/lightline-ale')     " ステータスラインにエラー数を表示
    call dein#add('Yggdroot/indentLine')        " インデント可視化
    call dein#add('morhetz/gruvbox')            " カラースキーマ
    call dein#add('twitvim/twitvim')            " Twitter
    call dein#add('yuratomo/w3m.vim')           " w3m
    call dein#add('tyru/open-browser.vim')      " GUIブラウザ起動
    call dein#end()
    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif

"{{{----- NERDTree -----
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeDirArrows  = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 30
let g:NERDTreeMouseMode=2
let g:NERDTreeWinPos   = 'left'
let g:NERDTreeIgnore   = ['\.clean$', '\.swp$', '\.bak$', '\~$', '\.DS_Store']
autocmd vimrc vimenter * if !argc() | NERDTree | endif
autocmd vimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"}}}
"{{{----- Lightline -----
let g:lightline = {
            \'colorscheme': 'wombat',
            \'active': {
            \'left':  [
            \['mode', 'paste'],
            \['fugitive', 'readonly', 'filename', 'modified'],
            \['linter_checking', 'linter_errors', 'linter_warnings']
            \],
            \'right': [
            \['youbi', 'syntastic' ],
            \['lineinfo'],
            \['fileformat', 'fileencoding', 'filetype']
            \]
            \},
            \'component': {
            \'readonly': '%{&readonly?"RO":""}',
            \'lineinfo': '%3l/%L'
            \},
            \'component_expand': {
            \ 'linter_checking': 'lightline#ale#checking',
            \ 'linter_warnings': 'lightline#ale#warnings',
            \ 'linter_errors':   'lightline#ale#errors',
            \ 'linter_ok':       'lightline#ale#ok'
            \},
            \'component_type': {
            \ 'linter_checking': 'left',
            \ 'linter_warnings': 'warning',
            \ 'linter_errors':   'error',
            \ 'linter_ok':       'left'
            \},
            \'component_function':{
            \'fugitive':     'LightlineFugitive',
            \'filename':     'LightlineFilename',
            \'fileformat':   'LightlineFileformat',
            \'filetype':     'LightlineFiletype',
            \'fileencoding': 'LightlineFileencoding',
            \'syntastic':    'SyntasticStatuslineFlag',
            \'youbi':        'Youbi',
            \'mode':         'LightlineMode'},
            \}

let g:ale_statusline_format = ['E%d', 'W%d', 'ok']

function! LightlineFugitive()
    return winwidth('.') > 50 ? (exists('*fugitive#head') ? fugitive#head() : '') : ''
endfunction

function! LightlineFilename()
    if winwidth('.') > 90
        let fname = expand('%:p')
    else
        let fname = expand('%:t')
    endif
    return fname =~# 'NERD_tree' ? '' :
                \ &filetype ==# 'unite' ? unite#get_status_string() :
                \ ('' !=# fname ? fname : '[No Name]')
endfunction

function! LightlineFileformat()
    return winwidth('.') > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth('.') > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth('.') > 70 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname =~# 'NERD_tree' ? 'NERDTree' :
                \&filetype ==# 'unite' ? 'Unite' :
                \lightline#mode()
endfunction

function! Youbi()
    let weeks = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']
    let wday = strftime('%w')
    return winwidth('.') > 50 ? strftime('%Y/%m/%d').weeks[wday].strftime(' %H:%M') : ''
endfunction
"}}}
"{{{----- Commentout -----
let g:mapleader = "\<Space>"
nmap <Leader><Leader> gcc
vmap <Leader><Leader> gc
"}}}
"{{{----- Easy-Align -----
vmap <Enter> <Plug>(EasyAlign)*
"}}}
"{{{----- AutoClose -----
let g:AutoClosePairs_add = "<> |"" |'' |"
"}}}
"{{{----- Twitvim -----
let twitvim_count = 100
let twitvim_token_file = expand('~/.vim/.twitvim.token')
if has('mac')
    let twitvim_browser_cmd = 'open'
elseif (has('win64') || has('win32unix') || has('win32'))
    " let twitvim_browser_cmd = '/c/Program Files (x86)/Google/Chrome/Application/chrome.exe'
endif
nnoremap <C-t> :40vnew<CR>:FriendsTwitter<CR><C-w>j:q<CR>
nnoremap T :PosttoTwitter<CR>
nnoremap <Leader>t :RefreshTwitter<CR>
autocmd vimrc FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
    set nonumber
    set wrap
    set whichwrap=b,s,h,l,<,>,[,]
endfunction
"}}}
"{{{----- Unite -----
autocmd vimrc FileType unite set noequalalways
autocmd vimrc FileType unite nnoremap <silent><buffer><expr> i unite#do_action('split')
autocmd vimrc FileType unite inoremap <silent><buffer><expr> i unite#do_action('split')
autocmd vimrc FileType unite nnoremap <silent><buffer><expr> s unite#do_action('vsplit')
autocmd vimrc FileType unite inoremap <silent><buffer><expr> s unite#do_action('vsplit')
let g:neomru#time_format ='%Y/%m/%d %H:%M:%S'
noremap <C-r> :Unite -toggle -silent -vertical -winwidth=30 -wrap menu:shortcut<CR>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.shortcut = {'description' : 'shortcut',}
let g:unite_source_menu_menus.shortcut.command_candidates = [
            \[ '[Git]GitStatus',         'Gstatus'],
            \[ '[Git]GitAdd',            'Gwrite'],
            \[ '[Git]GitCommit',         'Gcommit'],
            \[ '[Git]GitPush',           'Git push'],
            \[ '[Git]GitDiff',           'Gdiff'],
            \[ '[Git]GitBlame',          'Gblame'],
            \[ '[Git]GitAddCommitPush',  "Gwrite | Gcommit -am 'Update' | Git push"],
            \[ '[web]localhost:8000',    'OpenBrowser http://localhost:8000'],
            \[ '[web]Github',            'OpenBrowser https://github.com/zipperr'],
            \[ '[web]Google',            'OpenBrowser https://www.google.co.jp'],
            \[ '[web]Qiita',             'OpenBrowser https://qiita.com'],
            \[ '[web]Wiki',              'OpenBrowser https://ja.wikipedia.org'],
            \[ '[w3m]5ch',               'W3mVSplit http://menu.5ch.net/bbsmenu.html'],
            \[ '[w3m]Qiita',             'W3mVSplit https://qiita.com'],
            \[ '[w3m]Wiki',              'W3mVSplit https://ja.wikipedia.org'],
            \[ '[w3m]Google',            'W3mVSplit https://www.google.co.jp'],
            \[ '[Twitter]Timeline',      'FriendsTwitter'],
            \[ '[Twitter]Tweet',         'PosttoTwitter'],
            \[ '[Twitter]Setup',         'SetLoginTwitter'],
            \[ '[vim]FileTree',          'NERDTreeToggle'],
            \[ '[File]Tab > Space',      'set expandtab|retab 4'],
            \[ '[File]Space > Tab',      'set noexpandtab | retab! 4'],
            \[ '[File]Open_UTF8',        'e ++enc=utf-8'],
            \[ '[File]Open_ShiftJis',    'e ++enc=cp932'],
            \[ '[File]Open_euc-jp',      'e ++enc=euc-jp'],
            \[ '[File]Open_iso-2022-jp', 'e ++enc=iso-2022-jp'],
            \[ '[File]Open_Dos',         'e ++ff=dos'],
            \[ '[File]Open_Mac',         'e ++ff=mac'],
            \[ '[File]Open_Unix',        'e ++ff=unix'],
            \[ '[File]Set_UTF8',         'set fenc=utf-8'],
            \[ '[File]Set_ShiftJis',     'set fenc=cp932'],
            \[ '[File]Set_euc-jp',       'set fenc=euc-jp'],
            \[ '[File]Set_iso-2022-jp',  'set fenc=iso-2022-jp'],
            \[ '[File]Set_Dos',          'set ff=dos'],
            \[ '[File]Set_Mac',          'set ff=mac'],
            \[ '[File]Set_Unix',         'set ff=unix'],
            \[ '[File]^M delete',        '%s///g'],
            \[ '[File]^M replace',       '%s//\r/g'],
            \[ '[File]RemoveSpace',      'RemoveUnwantedSpaces'],
            \[ '[File]EOLdelete',        'set binary noeol|wq'],
            \[ '[Edit]vimrc',            'edit $MYVIMRC'],
            \[ '[Edit]zshrc',            'edit ~/.zshrc'],
            \[ '[Edit]bashrc',           'edit ~/.bashrc'],
            \[ '[Edit]gitconf',          'edit ~/.gitconfig'],
            \]
"}}}
"{{{----- Neocomplcache -----
let g:neocomplcache_enable_at_startup               = 1
let g:neocomplcache_max_list                        = 10
let g:neocomplcache_auto_completion_start_length    = 1
let g:neocomplcache_manual_completion_start_length  = 1
let g:neocomplcache_min_keyword_length              = 1
let g:neocomplcache_min_syntax_length               = 1
let g:neocomplcache_enable_ignore_case              = 1
let g:neocomplcache_enable_smart_case               = 1
let g:neocomplcache_enable_camel_case_completion    = 1
let g:neocomplcache_enable_underbar_completion      = 1
let g:neocomplcache_enable_insert_char_pre          = 1
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
"}}}
"{{{----- Neosnippet -----
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
"}}}
"{{{----- Quickrun -----
nnoremap <C-q> :QuickRun<CR>
let g:quickrun_config = {'_' : {
            \'runner': 'job',
            \'outputter' : 'error','outputter/error/success' : 'buffer','outputter/error/error' : 'buffer',
            \'outputter/buffer/split' : ':vertical 35','outputter/buffer/close_on_empty' : 0
            \}}
"}}}
"{{{----- gruvbox -----
colorscheme gruvbox
"}}}
"{{{----- snipmate -----
let g:neosnippet#disable_runtime_snippets = {'_' : 1}
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/dein/repos/github.com/honza/vim-snippets/snippets'
"}}}
"{{{----- Switch -----
nnoremap - :Switch<CR>
let g:switch_custom_definitions =
            \[
            \{'foo'           : 'bar'},
            \{'bar'           : 'foo'},
            \{'on'            : 'off'},
            \{'off'           : 'on'},
            \{'ON'            : 'OFF'},
            \{'OFF'           : 'ON'},
            \{'true'          : 'false'},
            \{'false'         : 'true'},
            \{'<'             : '>'},
            \{'>'             : '<'},
            \{'<\(.\{-}\)>'   : '(\1)'},
            \{'(\(.\{-}\))'   : '{\1}'},
            \{'{\(.\{-}\)}'   : '<\1>'},
            \{'\(\k\+\)'      : '''\1'''},
            \{'''\(.\{-}\)''' : '"\1"'},
            \{'"\(.\{-}\)"'   : '\1'},
            \]
"}}}
"{{{----- W3m -----
nnoremap <silent><C-g> :W3mVSplit<CR>
let g:w3m#homepage = 'http://www.google.co.jp/'
if (has('win64') || has('win32unix') || has('win32'))
    let g:w3m#command = '/c/Users/'.$USERNAME.'/dotfiles/w3m.exe'
endif
"}}}
"{{{----- ALE -----
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
nnoremap <C-k> <Plug>(ale_nprevious_wrap)
nnoremap <C-j> <Plug>(ale_next_wrap)
"}}}
"{{{----- vim-template -----
let s:load_templates_dir='~/.vim/dein/repos/github.com/zipperr/vim-template/templates'
let s:load_templates_command='0read '.s:load_templates_dir
autocmd vimrc BufNewFile *.c                        execute s:load_templates_command."/template.c"
autocmd vimrc BufNewFile *.coffee                   execute s:load_templates_command."/template.coffee"
autocmd vimrc BufNewFile *.cpp                      execute s:load_templates_command."/template.cpp"
autocmd vimrc BufNewFile *.cs                       execute s:load_templates_command."/template.cs"
autocmd vimrc BufNewFile *.css                      execute s:load_templates_command."/template.css"
autocmd vimrc BufNewFile *.d                        execute s:load_templates_command."/template.d"
autocmd vimrc BufNewFile Dockerfile                 execute s:load_templates_command."/template.Dockerfile"
autocmd vimrc BufNewFile *.erl                      execute s:load_templates_command."/template.erl"
autocmd vimrc BufNewFile *.f90                      execute s:load_templates_command."/template.f90"
autocmd vimrc BufNewFile *.go                       execute s:load_templates_command."/template.go"
autocmd vimrc BufNewFile *.html                     execute s:load_templates_command."/template.html"
autocmd vimrc BufNewFile *.java                     execute s:load_templates_command."/template.java"
autocmd vimrc BufNewFile *.js                       execute s:load_templates_command."/template.js"
autocmd vimrc BufNewFile *.php                      execute s:load_templates_command."/template.php"
autocmd vimrc BufNewFile *.pl                       execute s:load_templates_command."/template.pl"
autocmd vimrc BufNewFile *.py                       execute s:load_templates_command."/template.py"
autocmd vimrc BufNewFile *.rb                       execute s:load_templates_command."/template.rb"
autocmd vimrc BufNewFile *.sh                       execute s:load_templates_command."/template.sh"
autocmd vimrc BufNewFile *.xml                      execute s:load_templates_command."/template.xml"
autocmd vimrc BufNewFile *.{md,mdwn,mkd,mkdn,mark*} execute s:load_templates_command."/template.md"
autocmd vimrc BufNewFile *.bat                      execute s:load_templates_command."/template.bat"
autocmd vimrc BufNewFile *.json                     execute s:load_templates_command."/template.json"
autocmd vimrc BufNewFile *.yml                      execute s:load_templates_command."/template.yml"
"}}}
"{{{----- Openbrowser -----
let g:openbrowser_use_vimproc=0
nnoremap <Leader>h :OpenBrowserSearch<Space>
"}}}
"----- General Settings -----
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
set nofixendofline
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent
set breakindent
set runtimepath+=$HOME/.vim,$HOME/.vim/after
set list
set listchars=tab:>-,trail:-
set updatetime=300
set nobackup
set noswapfile
set viminfo+=n~/.vim/viminfo.txt
set undodir=~/.vim
set undofile
set wrap
set display=lastline
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set scrolloff=5
set splitright
set clipboard=unnamed,autoselect
nnoremap x "_x
nnoremap dd "_dd
vnoremap pp "0p
set showmatch
set matchtime=0
set matchpairs+=<:>,「:」,『:』,（:）,【:】,《:》,〈:〉,［:］,‘:’,“:”
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault
syntax on
set t_Co=256
autocmd vimrc ColorScheme * highlight Normal ctermbg=none
autocmd vimrc ColorScheme * highlight LineNr ctermbg=none
set background=dark
hi Comment    gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE term=NONE ctermfg=59 ctermbg=NONE
hi LineNr     gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE term=NONE ctermfg=59 ctermbg=NONE
hi SpecialKey gui=NONE font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE term=NONE ctermfg=59 ctermbg=NONE
set laststatus=2
set number
set showcmd
set wildmenu
set history=100
set infercase
set timeout timeoutlen=700 ttimeoutlen=1
set visualbell t_vb=
set nrformats=alpha,octal,hex
set lazyredraw
set ttyfast
set shellslash
set pumheight=5
set helplang=ja,en
set foldmethod=marker

"----- Key Mapping -----
let g:mapleader = "\<Space>"
"NormalMode+VisualMode
noremap J 20j
noremap K 20k
noremap L $
noremap H 0
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <Tab> %
noremap <C-k><C-d> ggVG=
"NormalMode
nnoremap <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
nnoremap <C-w> <C-w><C-w>
nnoremap r <C-r>
nnoremap Y y$
nnoremap p p`]
nnoremap O o<Esc>
nnoremap wj 10<C-W>+
nnoremap wk 10<C-W>-
nnoremap wh 10<C-W>>
nnoremap wl 10<C-W><
nnoremap <C-s> :w<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :<C-u>new<CR>
nnoremap <Leader>v :<C-u>vne<CR>
nnoremap <Leader>" ciw""<Esc>P
nnoremap <Leader>' ciw''<Esc>P
nnoremap <Leader>` ciw``<Esc>P
nnoremap <Leader>( ciw()<Esc>P
nnoremap <Leader>{ ciw{}<Esc>P
nnoremap <Leader>[ ciw[]<Esc>P
nnoremap <Leader>/ :%s/置換前/置換後/<Left>
"InsertMode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap jj <ESC>
inoremap , ,<space>
"VisualMode
vnoremap v $h
vnoremap <bs> d
vnoremap <delete> d
vnoremap * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>
vnoremap / "xy:%s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//<Left>
vnoremap [ "zdi[<C-R>z]<ESC>
vnoremap ( "zdi(<C-R>z)<ESC>
vnoremap { "zdi{<C-R>z}<ESC>
vnoremap < "zdi<<C-R>z><ESC>
vnoremap " "zdi"<C-R>z"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>
vnoremap ` "zdi`<C-R>z`<ESC>
"CommandlineMode
cmap w!!<CR> w !sudo tee % > /dev/null<CR>
cmap wb<CR> set binary noeol<CR>:wq<CR>
cmap W<CR> wa<CR>
cmap Q<CR> qa<CR>
cmap WQ<CR> wqa<CR>
cmap <C-P> <C-R>"
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
"grep
autocmd vimrc QuickFixCmdPost *grep* cwindow
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
nnoremap <Leader>g :vimgrep //j **/*<left><left><left><left><left><left><left>
nnoremap <Leader>G :sil grep!  .* *<left><left><left><left><left>

"----- Omni Completion -----
autocmd vimrc FileType java              setlocal omnifunc=javacomplete#Complete
autocmd vimrc FileType css               setlocal omnifunc=csscomplete#CompleteCSS
autocmd vimrc FileType html,markdown     setlocal omnifunc=htmlcomplete#CompleteTags
autocmd vimrc FileType javascript,coffee setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd vimrc FileType python            setlocal omnifunc=pythoncomplete#Complete completeopt-=preview
autocmd vimrc FileType xml               setlocal omnifunc=xmlcomplete#CompleteTags
autocmd vimrc Filetype php               setlocal omnifunc=phpcomplete#CompletePHP
autocmd vimrc FileType c                 setlocal omnifunc=ccomplete#Complete
autocmd vimrc FileType ruby              setlocal omnifunc=rubycomplete#Complete
autocmd vimrc FileType go                setlocal omnifunc=gocomplete#Complete
if has('autocmd') && exists('+omnifunc')
    autocmd vimrc Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
endif

"----- Scripts -----
"HiglightZenkakuSpase
hi ZenkakuSpace term=underline cterm=reverse ctermfg=Red gui=reverse guifg=Red
autocmd vimrc BufNewFile,BufRead * match ZenkakuSpace /　/

"CursorRetune
autocmd vimrc BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

"C-v = v
xnoremap <expr> I MultipleInsersion('I')
xnoremap <expr> A MultipleInsersion('A')
function! MultipleInsersion(next_key)
    if mode() ==# 'v'
        return "\<C-v>" . a:next_key
    elseif mode() ==# 'V'
        return "\<C-v>0o$" . a:next_key
    else
        return a:next_key
    endif
endfunction

" DeleteFile
function! DeleteMe(force)
    if a:force || !&modified
        let filename = expand('%')
        bdelete!
        call delete(filename)
    else
        echomsg 'File modified'
    endif
endfunction
command! -bang -nargs=0 DeleteMe call DeleteMe(<bang>0)

" RenamemeFile
function! RenameMe(newFileName)
    let currentFileName = expand('%')
    execute 'saveas ' . a:newFileName
    call delete(currentFileName)
endfunction
command! -nargs=1 RenameMe call RenameMe(<q-args>)

" Removeunwantedspaces
function! RemoveUnwantedSpaces()
    let pos_save = getpos('.')
    try
        keeppatterns %s/\s\+$//e
        while 1
            let lastline = getline('$')
            if lastline =~# '^\s*$' && line('$') != 1
                $delete
            else
                break
            endif
        endwhile
    finally
        call setpos('.', pos_save)
    endtry
endfunction
command! -nargs=0 RemoveUnwantedSpaces call RemoveUnwantedSpaces()

" Copyfullpath
command! CopyFullPath let @+ = expand(%:p)

" OpenAnyFile
command! -bang -bar -complete=file -nargs=? Utf8 edit<bang> ++enc=utf-8       <args>
command! -bang -bar -complete=file -nargs=? Jis  edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Sjis edit<bang> ++enc=cp932       <args>
command! -bang -bar -complete=file -nargs=? Euc  edit<bang> ++enc=euc-jp      <args>
command! -bang -bar -complete=file -nargs=? Unix edit<bang> ++fileformat=unix <args>
command! -bang -bar -complete=file -nargs=? Dos  edit<bang> ++fileformat=dos  <args>
command! -bang -bar -complete=file -nargs=? Mac  edit<bang> ++fileformat=mac  <args>
command! DeleteCR %s///g

" CloseAnyOther
if (has('win64')|| has('win32unix')||has('win32'))
    let &t_ti .= "\e[?7727h"
    let &t_te .= "\e[?7727l"
    noremap <special> <Esc>O[ <Esc>
    noremap! <special> <Esc>O[ <Esc>
    nnoremap <special> <Esc>O[<Esc>O[ :<C-u>call CloseAnyOther()<CR>
else
    nnoremap <Esc><Esc> :<C-u>call CloseAnyOther()<CR>
endif
function! CloseAnyOther()
    let w = 0
    let w:current_win = 1
    for w in reverse(range(1, winnr('$')))
        let ft = getwinvar(w, '&filetype')
        let bt = getwinvar(w, '&buftype')
        let bufnr = winbufnr(w)
        let name = bufname(bufnr)
        if (ft ==# 'quickrun' && name ==# 'QuickRunOut')||(ft ==# 'NERDTree')||(ft ==# 'unite')||(ft ==# 'twitvim')||(ft ==# 'gitcommit')
                    \||(name =~# '^fugitive:')||(name =~# 'fugitiveblame')||(name ==# '')||(bt ==# 'help')||(bt ==# 'quickfix')||(bt ==# 'nofile')
            execute w . 'wincmd w'
            q
            break
        endif
    endfor
    for w in range(1, winnr('$'))
        let was_current = getwinvar(w, 'current_win')
        if was_current
            execute w . 'wincmd w'
            unlet w:current_win
            break
        endif
    endfor
endfunction
