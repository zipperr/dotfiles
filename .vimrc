set encoding=utf-8
scriptencoding utf-8
filetype on
let g:vimproc#download_windows_dll = 1
augroup vimrc
    autocmd!
augroup END

"##### Plugin #####
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
if !isdirectory(s:dein_repo_dir)|execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir|endif
execute 'set runtimepath^=' . s:dein_repo_dir
    endif
    if dein#load_state(s:dein_dir)
call dein#begin(s:dein_dir)

"##### PluginList #####
call dein#add("Shougo/dein.vim")                        " プラグイン管理
" Utility
call dein#add("Shougo/vimproc.vim", {'build' : 'make'}) " 非同期処理
call dein#add("Shougo/unite.vim")                       " ランチャー
call dein#add("Shougo/neomru.vim")                      " 最近開いたファイルリスト
call dein#add("scrooloose/nerdtree")                    " ファイルツリー
call dein#add("tyru/open-browser.vim")                  " ブラウザを開く
" Programming Support
call dein#add("Shougo/neocomplcache.vim")               " 補完
call dein#add("Shougo/neosnippet.vim")                  " スニペット
call dein#add("Shougo/neosnippet-snippets")             " デフォルトスニペット
call dein#add("Townk/vim-autoclose")                    " 閉じ括弧補完
call dein#add("ujihisa/neco-look")                      " 英単語補完
call dein#add("scrooloose/syntastic")                   " 構文チェック
call dein#add("thinca/vim-quickrun")                    " コード実行
call dein#add("Yggdroot/indentLine")                    " インデント可視化
call dein#add("elzr/vim-json")                          " json用インデント
call dein#add("tomtom/tcomment_vim")                    " コメントアウトトグル
call dein#add("AndrewRadev/switch.vim")                 " リテラル変換
call dein#add("junegunn/vim-easy-align")                " 整形
call dein#add("kannokanno/previm")                      " Markdownプレビュー
call dein#add("kchmck/vim-coffee-script")               " coffeescriptのシンタックスハイライト
" Theme / Interface
call dein#add("itchyny/lightline.vim")                  " ステータスライン
call dein#add("w0ng/vim-hybrid")                        " hybrid
call dein#add("sickill/vim-monokai")                    " monokai
" Git Support
call dein#add("airblade/vim-gitgutter")                 " 差分表示
call dein#add("tpope/vim-fugitive")                     " Git操作
" Twitter
call dein#add("twitvim/twitvim")                        " Twitter
call dein#end()
call dein#save_state()
endif
if dein#check_install()|call dein#install()|endif

"##### BasicOption #####
"Encoding
set fileencodings=utf-8,cp932,euc-jp,sjis
set fileformats=unix,dos,mac
set ambiwidth=double
if v:version >= 704|set nofixeol|endif
"Indent
set expandtab
set smarttab
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
set viminfo+=n~/.vim/tmp/viminfo.txt
set undodir=~/.vim/tmp
set undofile
"Move
set wrap
set display=lastline
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set scrolloff=5
set splitright
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
set hlsearch
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
colorscheme monokai
" hybrid, jellybeans, railscasts, Sierra, monokai, lucius, despacio
set background=dark
hi Comment      gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
hi LineNr       gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
" hi CursorLineNR gui=NONE      font=NONE guifg=#000000 guibg=#dadada guisp=NONE cterm=NONE   term=NONE      ctermfg=16   ctermbg=253
" hi SpecialKey   gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
" hi IncSearch    gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
" hi Search       gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
" hi MatchParen   gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
" hi Pmenu ctermbg=8
" hi PmenuSel ctermbg=1
" hi PmenuSbar ctermbg=0
"StatusLine
set laststatus=2
" set statusline=%F%h\%m%r%w%=\[%{&ff},%{&fenc!=''?&fenc:&enc},%Y][%3l/%3L][%{strftime('%k:%M')}]
" au vimrc VimEnter    * hi StatusLine gui=NONE guifg=Black guibg=DarkCyan  cterm=NONE ctermfg=Black ctermbg=DarkCyan
" au vimrc InsertEnter * hi StatusLine gui=NONE guifg=Black guibg=DarkGreen cterm=NONE ctermfg=Black ctermbg=DarkGreen
" au vimrc InsertLeave * hi StatusLine gui=NONE guifg=Black guibg=DarkCyan  cterm=NONE ctermfg=Black ctermbg=DarkCyan
"CursorLine
set cursorline
hi clear CursorLine
set number
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
set pumheight=5
set helplang=ja,en
if v:version >= 704 | set cm=blowfish2 | elseif | set cm=zip | endif

"##### KeyMapping #####
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
"NormalMode
nnoremap <C-L> :noh<C-L><CR>
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
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>s :<C-u>sp<CR>
nnoremap <Leader>v :<C-u>vsp<CR>
nnoremap <Leader>/ :,$s/検索文字/置換後文字/gc<Left><Left><Left>
"InsertMode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap jj <ESC>
inoremap , ,<space>
"VisualMode
vnoremap v $h
vnoremap * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>
vnoremap / "xy:,$s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
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
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <expr> /  getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?  getcmdtype() == '?' ? '\?' : '?'
"ArrowKeys
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
"grep
autocmd vimrc QuickFixCmdPost *grep* cwindow
set grepprg=grep\ -rnIH\ --exclude-dir=.svn\ --exclude-dir=.git
nnoremap <expr> <Leader>g ':vimgrep /\<' . expand('<cword>') . '\>/j **/*.' . expand('%:e')
nnoremap <expr> <Leader>G ':sil grep! ' . expand('<cword>') . ' .* *'

"##### Omnicompletion #####
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
if has("autocmd") && exists("+omnifunc")
    autocmd vimrc Filetype *
    \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
    \endif
endif

"##### Template #####
let s:load_templates_dir='~/.vim/templates'
let s:load_templates_command="0read ".s:load_templates_dir
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

"##### Script #####
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
    if lastline =~ '^\s*$' && line('$') != 1
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
command! CopyFullPath let @+ = expand('%:p')

" CloseAnyOther
nnoremap <ESC><ESC> :<C-u>call CloseAnyOther()<CR>
function! CloseAnyOther()
let w = 0
let w:current_win = 1
for w in reverse(range(1, winnr('$')))
    let ft = getwinvar(w, '&filetype')
    let bt = getwinvar(w, '&buftype')
    let bufnr = winbufnr(w)
    let name = bufname(bufnr)
        if (ft ==# 'quickrun' && name ==# 'QuickRunOut')
        \||(ft ==# 'NERDTree')
        \||(ft ==# 'unite')
        \||(ft ==# 'twitvim')
        \||(ft ==# 'gitcommit')
        \||(name =~# '^fugitive:')
        \||(name =~# 'fugitiveblame')
        \||(bt ==# 'help')
        \||(bt ==# 'quickfix')
        \||(bt ==# 'nofile')
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

"##### Unite #####
autocmd vimrc FileType unite set noequalalways
let g:neomru#time_format = "%Y/%m/%d %H:%M:%S"
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
nnoremap <F1> :Unite -toggle -silent -vertical -winwidth=30 -wrap menu:shortcut<CR>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.shortcut = {"description" : "shortcut",}
let g:unite_source_menu_menus.shortcut.command_candidates = [
    \[ "[Git]GitStatus",            "Gstatus"],
    \[ "[Git]GitCommit",            "Gcommit"],
    \[ "[Git]GitPush",              "Git push"],
    \[ "[Git]GitDiff",              "Gdiff"],
    \[ "[Git]GitBlame",             "Gblame"],
    \[ "[Git]GitAddCommitPush",     "Gwrite | Gcommit -am 'Update' | Git push"],
    \[ "[Git]GitAdd",               "Gwrite"],
    \[ "[web]localhost:8000",       "OpenBrowser http://localhost:8000" ],
    \[ "[web]Github",               "OpenBrowser https://github.com/zipperr" ],
    \[ "[web]GitPage",              "OpenBrowser https://zipperr.github.io" ],
    \[ "[web]Google",               "OpenBrowser https://www.google.co.jp" ],
    \[ "[web]GoogleDrive",          "OpenBrowser https://drive.google.com" ],
    \[ "[web]Qiita",                "OpenBrowser https://qiita.com" ],
    \[ "[web]Wiki",                 "OpenBrowser https://ja.wikipedia.org" ],
    \[ "[Twitter]Timeline",         "FriendsTwitter"],
    \[ "[Twitter]Tweet",            "PosttoTwitter"],
    \[ "[Twitter]Setup",            "SetLoginTwitter"],
    \[ "[vim]FileTree",             "NERDTreeToggle" ],
    \[ "[vim]SyntaxOn",             "set syntax=on" ],
    \[ "[vim]SyntaxOff",            "set syntax=off" ],
    \[ "[vim]BGdark",               "set background=dark" ],
    \[ "[vim]BGlight",              "set background=light" ],
    \[ "[vim]BrightOn",             "BrightestEnable" ],
    \[ "[vim]BrightOff",            "BrightestDisable" ],
    \[ "[Markdown]PrevimOpen",      "PrevimOpen" ],
    \[ "[Snippet]MakeSnippet",      "vsplit|NeoSnippetEdit" ],
    \[ "[Snippet]DefaultSnippets",  "Unite -silent -vertical -winwidth=30 neosnippet/runtime" ],
    \[ "[Snippet]OriginalSnippets", "Unite -silent -vertical -winwidth=30 neosnippet/user" ],
    \[ "[File]Tab > Space",         "set expandtab|retab 4" ],
    \[ "[File]Space > Tab",         "set noexpandtab | retab! 4" ],
    \[ "[File]Open_UTF8",           "e ++enc=utf-8" ],
    \[ "[File]Open_ShiftJis",       "e ++enc=cp932" ],
    \[ "[File]Open_euc-jp",         "e ++enc=euc-jp" ],
    \[ "[File]Open_iso-2022-jp",    "e ++enc=iso-2022-jp" ],
    \[ "[File]Open_Dos",            "e ++ff=dos" ],
    \[ "[File]Open_Mac",            "e ++ff=mac" ],
    \[ "[File]Open_Unix",           "e ++ff=unix" ],
    \[ "[File]Set_UTF8",            "set fenc=utf-8" ],
    \[ "[File]Set_ShiftJis",        "set fenc=cp932" ],
    \[ "[File]Set_euc-jp",          "set fenc=euc-jp" ],
    \[ "[File]Set_iso-2022-jp",     "set fenc=iso-2022-jp" ],
    \[ "[File]Set_Dos",             "set ff=dos" ],
    \[ "[File]Set_Mac",             "set ff=mac" ],
    \[ "[File]Set_Unix",            "set ff=unix" ],
    \[ "[File]^M delete",           "%s///g" ],
    \[ "[File]^M replace",          "%s//\r/g" ],
    \[ "[File]EOLdelete",           "set binary noeol|wq" ],
    \[ "[Toggle]Number",            "set number!" ],
    \[ "[Toggle]BreakIndent",       "set breakindent!" ],
    \[ "[Toggle]CursorColumn",      "set cursorcolumn!" ],
    \[ "[Toggle]CursorLine",        "set cursorline!" ],
    \[ "[Toggle]HilightSeach",      "set hlsearch!" ],
    \[ "[Toggle]ShowMatch",         "set showmatch!" ],
    \[ "[Toggle]Wrap",              "set wrap!" ],
    \[ "[Edit]vimrc",               "edit $MYVIMRC"],
    \[ "[Edit]zshrc",               "edit ~/.zshrc"],
    \[ "[Edit]bashrc",              "edit ~/.bashrc"],
    \[ "[Edit]gitconf",             "edit ~/.gitconfig"],
    \]

"##### Neocomplcache #####
let g:neocomplcache_enable_at_startup               = 1
let g:neocomplcache_smartcase                       = 1
let g:neocomplcache_enable_underbar_completion      = 1
let g:neocomplcache_previouskeywordcompletion       = 1
let g:neocomplcache_enablecamelcasecompletion       = 1
let g:neocomplcache_enableunderbarcompletion        = 1
let g:neocomplcache_max_list                        = 10
let g:neocomplcache_auto_completion_start_length    = 1
let g:neocomplcache_manual_completion_start_length  = 0
let g:neocomplcache_min_keyword_length              = 2
let g:neocomplcache_min_syntax_length               = 3
let g:neocomplcache_enable_auto_select              = 0
let g:neocomplcache_enable_ignore_case              = 1
let g:neocomplcache_enable_smart_case               = 1
let g:neocomplcache_enable_camel_case_completion    = 1
let g:neocomplcache_enable_at_startuple_auto_select = 1
let g:neocomplcache_enable_insert_char_pre          = 1
let g:neocomplcache_text_mode_filetypes             = {
    \'rst':1,'markdown':1,'gitrebase':1,'gitcommit':1,'vcs-commit':1,'text':1,'tex': 1,
    \'plaintex': 1,'help':1,'vim' :1,'zsh':1,}
if !exists('g:neocomplcache_force_omni_patterns')
    let g:neocomplcache_force_omni_patterns = {}
endif

"##### Neosnippet #####
imap <expr><CR> neosnippet#expandable() ? "<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "<C-y>" : "<CR>"
imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
let g:neosnippet#snippets_directory='~/.vim/snippets/'

"##### syntastic #####
let g:syntastic_loc_list_height          = 1
let g:syntastic_aggregate_errors         = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_auto_loc_list            = 0
let g:syntastic_check_on_open            = 1
let g:syntastic_check_on_wq              = 0

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeDirArrows  = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 30
let g:NERDTreeWinPos   = "left"
let g:NERDTreeIgnore   = ['\.clean$', '\.swp$', '\.bak$', '\~$', '\.DS_Store']
autocmd vimrc vimenter * if !argc() | NERDTree | endif
autocmd vimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### quickrun #####
nnoremap <C-q> :QuickRun<CR>
let g:quickrun_config = {"_" : {
    \"runner" : "vimproc","runner/vimproc/updatetime" : 60,
    \"outputter" : "error","outputter/error/success" : "buffer","outputter/error/error" : "buffer",
    \"outputter/buffer/split" : ":vertical 35","outputter/buffer/close_on_empty" : 0
\}}

"##### swith #####
let g:switch_mapping = "\\"
let g:switch_custom_definitions =
\   [
\   ['on', 'off'],
\   ['0', '1'],
\   ['yes', 'no'],
\   ['before', 'after'],
\   ['visible', 'hidden'],
\   ['block', 'none'],
\   ['enable', 'disable'],
\   {'\(\k\+\)': '''\1''','''\(.\{-}\)''': '"\1"','"\(.\{-}\)"': '\1',},
\   ]

"##### lightline #####
let g:lightline = {
    \'colorscheme': 'wombat',
    \ 'active': {
        \'left':  [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
        \'right': [[ 'youbi', 'syntastic' ], ['lineinfo'],[ 'fileformat', 'fileencoding', 'filetype']]},
    \'component': {'readonly': '%{&readonly?"RO":""}'},
    \'component_function':{
        \'fugitive':     'LightlineFugitive',
        \'filename':     'LightlineFilename',
        \'fileformat':   'LightlineFileformat',
        \'filetype':     'LightlineFiletype',
        \'fileencoding': 'LightlineFileencoding',
        \'syntastic':    'SyntasticStatuslineFlag',
        \'youbi':    'Youbi',
        \'mode':         'LightlineMode'},
    \}
let g:lightline.component = {'lineinfo': '%3l/%L'}

function! LightlineFugitive()
    return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightlineFilename()
if winwidth(0) > 90|let fname = expand("%:p")|else|let fname = expand("%:t")|endif
return fname =~ 'NERD_tree' ? '' :
    \ &ft == 'unite' ? unite#get_status_string() :
    \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightlineFileformat()
    return winwidth(0) > 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) > 80 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
    let fname = expand('%:t')
    return fname =~ 'NERD_tree' ? 'NERDTree' :
        \&ft == 'unite' ? 'Unite' :
        \winwidth(0) > 10 ? lightline#mode() : ''
endfunction

function! Youbi()
    let weeks = [ "(日)", "(月)", "(火)", "(水)", "(木)", "(金)", "(土)" ]
    let wday = strftime("%w")
    return strftime('%Y/%m/%d').weeks[wday].strftime(' %H:%M')
endfunction

"##### Twitvim #####
let twitvim_count = 100
let twitvim_token_file = expand('~/.vim/tmp/.twitvim.token')

if has("mac")|let twitvim_browser_cmd = 'open'|endif
nnoremap <F2> :40vnew<CR>:FriendsTwitter<CR><C-w>j:q<CR>
nnoremap <F3> :PosttoTwitter<CR>
nnoremap <Leader>t :RefreshTwitter<CR>
autocmd vimrc FileType twitvim call s:twitvim_my_settings()
function! s:twitvim_my_settings()
    set nonumber
    set wrap
    set whichwrap=b,s,h,l,<,>,[,]
endfunction

"##### Openbrowser #####
let g:openbrowser_use_vimproc=0
nnoremap <Leader><Leader> :OpenBrowserSearch<Space>
nnoremap <Leader>h :OpenBrowser<Space>http://localhost:8000<CR>

"##### Previm #####
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
nnoremap <Leader>p :PrevimOpen<CR>

"#####Commentout #####
nmap ,, gcc
vmap ,, gcc

"##### Easy-Align #####
vmap <Enter> <Plug>(EasyAlign)*

"##### vim-json #####
let g:vim_json_syntax_conceal = 0
