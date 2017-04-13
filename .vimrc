"##### Plugin #####

"プラグインの場所とdein.vim本体の場所
let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

"dein.vimが無ければインストールする
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    endif

"設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

"##### PluginList #####
call dein#add('Shougo/dein.vim')        "プラグイン管理
call dein#add('Shougo/neocomplete.vim') " 補完
call dein#add('Shougo/neosnippet.vim')      "スニペット
call dein#add('Shougo/neosnippet-snippets') "スニペットの定義ファイル
call dein#add('Townk/vim-autoclose')    " カッコを自動で閉じる
call dein#add('w0ng/vim-hybrid')        " カラースキーム
call dein#add('Shougo/unite.vim')       "カレントディレクトリ以下にあるファイルの一覧を開く
call dein#add('Shougo/neomru.vim')      "unit.vimで最近使ったファイルを表示できるようにする
call dein#add('itchyny/lightline.vim')  "ステータスバーをオシャレに
call dein#add('thinca/vim-quickrun')    "vim上で\rでコードを実行
call dein#add('tyru/open-browser.vim')  "URLをクリックで開けるようにする
call dein#add('vim-syntastic/syntastic') "構文チェック
call dein#add('scrooloose/nerdtree')    "ツリー型でディレクトリ表示
call dein#add('tpope/vim-fugitive')     "vim上でGitを操作する
call dein#add('Shougo/vimproc.vim', {'build': 'make'}) "非同期処理
call dein#add('vim-scripts/javacomplete', {
            \   'build': {
            \       'cygwin': 'javac autoload/Reflection.java',
            \       'mac': 'javac autoload/Reflection.java',
            \       'unix': 'javac autoload/Reflection.java',
            \   },
            \}) "java補完(javacomplete2の方が良さそう?)

    " 設定終了
    call dein#end()
    call dein#save_state()
  endif

  " 未インストールのものがあったらインストール
  if dein#check_install()
    call dein#install()
  endif

"##### Uniteの設定 ######
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"##### Neosnippetの設定 #####
" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
"set snippet file dir
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/snippets'

"##### lightlineの設定 #####
set laststatus=2 "ステータスラインを常時表示
set t_Co=256 "色
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'component': {
      \   'readonly': '%{&readonly?"\u2b64":""}',
      \ }
      \ }

"##### NERDTreeの設定 #####
nnoremap <silent><C-e> :NERDTreeToggle<CR> "Ctrl+eでNERDTreeを開く
let NERDTreeShowHidden = 1 "可視化ファイルを表示する

"##### Open-Browser設定 #####
" カーソル下のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)

"##### syntasticの設定 #####
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
let g:syntastic_check_on_wq = 0

"##### 基本設定 #####
set encoding=utf-8 "ファイル読み込み時の文字コードの設定
scriptencoding utf-8 "Vim script内でマルチバイト文字を使う場合の設定
set fenc=utf-8 "文字コードをUFT-8に設定
set title "編集中のファイル名を表示
set showmatch "括弧に対応する括弧を表示
set mouse=a "マウスモードオン
inoremap <silent> jj <ESC>          "インサートモードで素早くjjと入力するとノーマルモードへ移行
autocmd BufWritePre * :%s/\s\+$//ge "末尾の空白を消す
set clipboard=unnamed,autoselect "ヤンクした文をクリップボードへコピー
set nobackup                     " バックアップをしない
set noswapfile                   " スワップファイルを作らない
autocmd FileType * setlocal formatoptions-=ro " 勝手にコメントアウトされるのを防ぐ
set nocompatible                "これいる?

"##### 文字コード #####
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"##### タブ・インデント #####
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 " 連続した空白に対してタブキーやBSKeyでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

"クリップボードからのコピペをインデントしない
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

"##### 検索 #####
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"##### カーソル #####
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set number " 行番号を表示
set cursorline " カーソルラインをハイライト
" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソルを移動する
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
vnoremap <down> gj
vnoremap <up> gk
set backspace=indent,eol,start " バックスペースキーの有効化

"##### 補完機能 #####
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"##### 色設定#####
syntax on "色付けオン
set background=dark
colorscheme hybrid
