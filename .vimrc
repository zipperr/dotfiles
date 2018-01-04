set encoding=utf-8
scriptencoding utf-8
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
call dein#add('Shougo/vimproc.vim', {'build' : 'make'}) " 非同期処理
call dein#add('Shougo/unite.vim')                       " ランチャー
call dein#add('scrooloose/nerdtree')                    " ファイルツリー
call dein#add('tyru/open-browser.vim')                  " ブラウザを開く
" Programming Support
call dein#add('Shougo/neocomplcache.vim')               " 補完
call dein#add('Shougo/neosnippet.vim')                  " スニペット
call dein#add('Shougo/neosnippet-snippets')             " デフォルトスニペット
call dein#add('Townk/vim-autoclose')                    " 閉じ括弧補完
call dein#add('ujihisa/neco-look')                      " 英単語補完
call dein#add('scrooloose/syntastic')                   " 構文チェック
call dein#add('thinca/vim-quickrun')                    " コードを実行
call dein#add('tomtom/tcomment_vim')                    " コメントアウトトグル
call dein#add('AndrewRadev/switch.vim')                 " リテラル変換
call dein#add('junegunn/vim-easy-align')                " 整形
call dein#add('aperezdc/vim-template')                  " テンプレート
call dein#add('kannokanno/previm')                      " Markdownプレビュー
call dein#add('vim-scripts/YankRing.vim')               " ヤンク履歴補完
" Theme / Interface
call dein#add('itchyny/lightline.vim')                  " ステータスライン
call dein#add('w0ng/vim-hybrid')
call dein#add('nanotech/jellybeans.vim')
call dein#add('jpo/vim-railscasts-theme')
call dein#add('AlessandroYorba/Sierra')
call dein#add('sickill/vim-monokai')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('AlessandroYorba/Despacio')
" Git Support
call dein#add('airblade/vim-gitgutter')                 " 差分表示
call dein#add('tpope/vim-fugitive')                     " Git操作
" Twitter
call dein#add('twitvim/twitvim')                        " Twitter
call dein#end()
call dein#save_state()
endif
if dein#check_install()|call dein#install()|endif

"##### BasicSetting #####
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
colorscheme monokai
" hybrid, jellybeans, railscasts, Sierra, monokai, lucius, despacio
set background=dark
hi Comment      gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
hi LineNr       gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
hi CursorLineNR gui=NONE      font=NONE guifg=#000000 guibg=#dadada guisp=NONE cterm=NONE   term=NONE      ctermfg=16   ctermbg=253
hi SpecialKey   gui=NONE      font=NONE guifg=#5f5f5f guibg=NONE guisp=NONE cterm=NONE      term=NONE      ctermfg=59   ctermbg=NONE
" hi IncSearch    gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
" hi Search       gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
" hi MatchParen   gui=underline font=NONE guifg=NONE    guibg=NONE guisp=NONE cterm=underline term=underline ctermfg=NONE ctermbg=NONE
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
nnoremap <Leader>v :<C-u>vsp<CR>z+ :set scrollbind<CR><C-w><C-w>:set scrollbind<CR>
nnoremap <Leader>b :,$s/検索文字/置換後文字/gc<Left><Left><Left>
"InsertMode
inoremap jj <ESC>
inoremap , ,<space>
"VisualMode
vnoremap v $h
vnoremap * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n','g')<CR><CR>
vnoremap / "xy:,$s/<C-R>=escape(@x, '\\/.*$^~[]')<CR>//gc<Left><Left><Left>
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

"##### Neocomplcache #####
let g:neocomplcache_enable_at_startup               = 1
let g:NeoComplCache_SmartCase                       = 1
let g:neocomplcache_enable_underbar_completion      = 1
let g:NeoComplCache_PreviousKeywordCompletion       = 1
let g:NeoComplCache_EnableCamelCaseCompletion       = 1
let g:NeoComplCache_EnableUnderbarCompletion        = 1
let g:neocomplcache_max_list                        = 10
let g:neocomplcache_auto_completion_start_length    = 1
let g:neocomplcache_manual_completion_start_length  = 0
let g:neocomplcache_min_keyword_length              = 2
let g:neocomplcache_min_syntax_length               = 3
let g:neocomplcache_enable_ignore_case              = 1
let g:neocomplcache_enable_smart_case               = 1
let g:neocomplcache_enable_camel_case_completion    = 0
let g:neocomplcache_enable_at_startuple_auto_select = 1
let g:neocomplcache_enable_insert_char_pre          = 1
let g:neocomplcache_text_mode_filetypes             = {
	\'rst':1,'markdown':1,'gitrebase':1,'gitcommit':1,'vcs-commit':1,'text':1,'tex': 1,
	\'plaintex': 1,'help':1,'vim' :1,'zsh':1,'python':1,
\}

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

"##### quickrun #####
let g:quickrun_config = {"_" : {
	\"runner" : "vimproc","runner/vimproc/updatetime" : 60,
	\"outputter" : "error","outputter/error/success" : "buffer","outputter/error/error" : "buffer",
	\"outputter/buffer/split" : ":vertical 35","outputter/buffer/close_on_empty" : 0
\}}
set splitright
nnoremap <C-q> :QuickRun<CR>
nnoremap <silent><ESC><ESC> :bw! \[quickrun\ output\]<CR>

"##### lightline #####
let g:lightline = {
 	\'colorscheme': 'wombat',
	\ 'active': {
		\'left':  [['mode', 'paste'], ['fugitive', 'readonly', 'filename', 'modified']],
		\'right': [[ 'lineinfo', 'syntastic' ], ['percent'],[ 'fileformat', 'fileencoding', 'filetype']]},
	\'component': {'readonly': '%{&readonly?"RO":""}'},
	\'component_function':{
		\'fugitive':     'LightlineFugitive',
		\'filename':     'LightlineFilename',
		\'fileformat':   'LightlineFileformat',
		\'filetype':     'LightlineFiletype',
		\'fileencoding': 'LightlineFileencoding',
		\'syntastic':    'SyntasticStatuslineFlag',
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

"##### Openbrowser #####
let g:openbrowser_use_vimproc=0
nnoremap <Leader><Leader> :OpenBrowserSearch<Space>

"##### Previm #####
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
nnoremap <Leader>p :PrevimOpen<CR>

"##### Template #####
let g:email = "ktaniuchi@hal21.co.jp"
let g:user = "Kento Taniuchi"

"#####Commentout #####
nmap ,, gcc
vmap ,, gcc

"##### Swith #####
let g:switch_mapping = "\\"
let g:switch_custom_definitions =
\	[
\	{'\(\k\+\)': '''\1''',
\	'''\(.\{-}\)''': '"\1"',
\	'"\(.\{-}\)"': '\1',},
\	]

"##### Easy-Align #####
vmap <Enter> <Plug>(EasyAlign)*

"##### Twitvim #####
let twitvim_count = 100
if has("mac")|let twitvim_browser_cmd = 'open'|endif
nnoremap <F2> :40vnew<CR>:FriendsTwitter<CR><C-w>j:q<CR>
nnoremap <F3> :PosttoTwitter<CR>
autocmd vimrc FileType twitvim nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd vimrc FileType twitvim inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"##### NERDTree #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:NERDTreeWinSize  = 30
let g:NERDTreeWinPos   = "left"
let g:NERDTreeIgnore   = ['\.clean$', '\.swp$', '\.bak$', '\~$', '\.DS_Store']
autocmd vimrc FileType NERDTree nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd vimrc FileType NERDTree inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
autocmd vimrc vimenter * if !argc() | NERDTree | endif
autocmd vimrc bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"##### UniteMenu #####
nnoremap <F1> :Unite -toggle -silent -vertical -winwidth=30 -wrap menu:shortcut<CR>
let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
let g:unite_source_menu_menus.shortcut = {"description" : "shortcut",}
let g:unite_source_menu_menus.shortcut.command_candidates = [
	\[ "[web]Github",               "OpenBrowser https://github.com/zipperr" ],
	\[ "[web]Google",               "OpenBrowser https://www.google.co.jp" ],
	\[ "[web]GoogleDrive",          "OpenBrowser https://drive.google.com" ],
	\[ "[web]Qiita",                "OpenBrowser https://qiita.com" ],
	\[ "[web]Wiki",                 "OpenBrowser https://ja.wikipedia.org" ],
	\[ "[web]Slack",                "OpenBrowser https://vim-jp.slack.com" ],
	\[ "[web]Vim Awesome",          "OpenBrowser https://vimawesome.com" ],
	\[ "[web]ColorSwat",            "OpenBrowser http://colorswat.ch/vim/" ],
	\[ "[web]VimColors",            "OpenBrowser http://vimcolors.com" ],
	\[ "[web]Xterm256 color",       "OpenBrowser http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim" ],
	\[ "[Twitter]Timeline",         "FriendsTwitter"],
	\[ "[Twitter]Tweet",            "PosttoTwitter"],
	\[ "[Twitter]Setup",            "SetLoginTwitter"],
	\[ "[Git]GitStatus",            "Gstatus"],
	\[ "[Git]GitAdd",               "Gwrite"],
	\[ "[Git]GitCommit",            "Gcommit"],
	\[ "[Git]GitPush",              "Git push origin master"],
	\[ "[Git]GitAddCommitPush",     "Gwrite | Gcommit -am 'Update' | Git push origin master"],
	\[ "[Git]GitDiff",              "Gdiff"],
	\[ "[Git]GitBlame",             "Gblame"],
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
autocmd vimrc FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
autocmd vimrc FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
autocmd vimrc FileType unite set noequalalways
