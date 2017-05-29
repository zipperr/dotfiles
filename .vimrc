"##### Plugin #####{{{1

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

"##### PluginList #####{{{1
call dein#add('Shougo/dein.vim')                        "プラグイン管理
call dein#add('Shougo/vimproc.vim', {'build': 'make'})  "非同期処理
call dein#add('Shougo/neosnippet.vim')                  "スニペット
call dein#add('Shougo/neosnippet-snippets')             "スニペットの定義ファイル
call dein#add('Shougo/unite.vim')                       "カレントディレクトリ以下にあるファイルの一覧を開く
call dein#add('Shougo/neomru.vim')                      "unit.vimで最近使ったファイルを表示できるようにする
call dein#add('Townk/vim-autoclose')                    " カッコを自動で閉じる
call dein#add('w0ng/vim-hybrid')                        " カラースキーム
call dein#add('itchyny/lightline.vim')                  "ステータスバーをオシャレに
call dein#add('thinca/vim-quickrun')                    "vim上で\rでコードを実行
call dein#add('tyru/open-browser.vim')                  "URLをクリックで開けるようにする
call dein#add('vim-syntastic/syntastic')                "構文チェック
call dein#add('scrooloose/nerdtree')                    "ツリー型でディレクトリ表示
call dein#add('tpope/vim-fugitive')                     "vim上でGitを操作する
call dein#add('rhysd/accelerated-jk')                   "j,kキーの移動速度を上げる
call dein#add('Yggdroot/indentLine')                    "インデント表示
call dein#add('othree/html5.vim')                       "HTML5色付け
call dein#add('hail2u/vim-css3-syntax')                 "css3色付け
call dein#add('jelera/vim-javascript-syntax')           "javascript色付け
call dein#add('Shougo/neocomplcache.vim')               "自動補完
call dein#add('Shougo/neocomplete.vim', {
    \ 'if' : has('lua')
    \ })                                                "自動補完
call dein#add('ujihisa/neco-look', {
    \ 'depends': ['neocomplete.vim'],
    \ 'if' : has('lua')
    \ })                                                "英単語自動補完
call dein#add('vim-scripts/javacomplete', {
    \ 'build': {
    \ 'cygwin': 'javac autoload/Reflection.java',
    \ 'mac': 'javac autoload/Reflection.java',
    \ 'unix': 'javac autoload/Reflection.java',
    \ },
    \})                                                 "java補完

"TweetVim関係
call dein#add('basyura/TweetVim')
call dein#add('mattn/webapi-vim')
call dein#add('basyura/twibill.vim')
call dein#add('h1mesuke/unite-outline')
call dein#add('basyura/bitly.vim')


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

"##### NeocompleteとNeocomplcacheの設定 #####
if has('lua')                                       "luaがある場合はcompleteを使う
let g:neocomplete#enable_at_startup = 1             "起動時に有効化
let g:neocomplete#auto_completion_start_length = 2  "補完が自動で開始される文字数
let g:neocomplete#enable_smart_case = 1             "大文字が入力されるまで大文字小文字の区別を無視
let g:neocomplete#enable_camel_case_completion = 1  "大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_underbar_completion = 1    " _(アンダーバー)区切りの補完を有効化
let g:neocomplete#min_syntax_length = 3             " シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#enable_quick_match = 1            " -入力による候補番号の表示
let g:neocomplete#enable_auto_select = 1            " 補完候補の一番先頭を選択状態にする
let g:neocomplete#max_list = 20                     "ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#sources#syntax#min_keyword_length = 3 " シンタックスをキャッシュするときの最小文字長
let g:neocomplete#enable_auto_close_preview = 0     " preview window を閉じない
let g:neocomplete#max_keyword_width = 10000
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size = 30000000
let g:neocomplete#enable_fuzzy_completion = 1       "曖昧検索
let g:neocomplete#enable_auto_delimiter = 1         "区切り文字まで補完する
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*' "自動的にロックするバッファ名のパターン

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

else                                                    "luaがない場合はcomplcacheを使う
let g:acp_enableAtStartup = 0                           "AutoComplPopを無効化
let g:neocomplcache_enable_at_startup = 1               "起動時に有効化
let g:neocomplcache_auto_completion_start_length = 2    "自動補完を行う入力数
let g:neocomplcache_enable_smart_case = 1               "大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_camel_case_completion = 1    "大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_underbar_completion = 1      "_区切りの補完を有効化
let g:neocomplcache_enable_ignore_case = 1              "大文字小文字を無視
let g:neocomplcache_min_syntax_length = 3               "シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*' "自動的にロックするバッファ名のパターン
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

"##### Neosnippetの設定 #####
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

"##### lightlineの設定 #####
set laststatus=2 "ステータスラインを常時表示
set t_Co=256 "色
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'component': {
    \ 'readonly': '%{&readonly?"\u2b64":""}',
    \ }
    \ }

"##### NERDTreeの設定 #####
nnoremap <silent><C-e> :NERDTreeToggle<CR>  "ctrl+eでNERDTreeを開く
let NERDTreeShowHidden = 1 "可視化ファイルを表示する
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTreeだけが残る場合はvim終了

"##### accelerated-jkの設定 #####
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"##### Open-Browser設定 #####
" カーソル下のURLや単語をブラウザで開く
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)

"##### syntasticの設定 #####
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1 "他のプラグインと競合するのを防ぐ
let g:syntastic_enable_signs = 1  "構文エラー行に>>を表示
let g:syntastic_auto_loc_list = 1 "構文エラーリストを表示
let g:syntastic_check_on_open = 0 "ファイルを開いたときにチェックしない
let g:syntastic_check_on_save = 1 "ファイル保存時にはチェックを実施
let g:syntastic_check_on_wq = 0   "wqで終了時にもチェック

"##### TweetVimの設定 #####
" フレームにアイコンを表示しない
let g:tweetvim_display_icon = 0
" 1ページのツイート数
let g:tweetvim_tweet_per_page = 60

nnoremap <silent><Leader>tw :<C-u>tabnew <Bar> TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tl :<C-u>TweetVimHomeTimeline<CR>
nnoremap <silent><Leader>tm :<C-u>TweetVimMentions<CR>
nnoremap <Leader>ts :<C-u>TweetVimSay<CR>

augroup TweetVimSetting
    autocmd!
    " マッピング
    " 挿入・通常モードでsayバッファを閉じる
    autocmd FileType tweetvim_say nnoremap <buffer><silent><C-g>    :<C-u>q!<CR>
    autocmd FileType tweetvim_say inoremap <buffer><silent><C-g>    <C-o>:<C-u>q!<CR><Esc>
    " 各種アクション
    autocmd FileType tweetvim     nnoremap <buffer>s                :<C-u>TweetVimSay<CR>   "ツイート
    autocmd FileType tweetvim     nnoremap <buffer>m                :<C-u>TweetVimMentions<CR>  "メンション"
    autocmd FileType tweetvim     nnoremap <buffer>h                :<C-u>TweetVimHomeTimeline<CR>  "タイムライン
    autocmd FileType tweetvim     nmap     <buffer>c                <Plug>(tweetvim_action_in_reply_to)
    autocmd FileType tweetvim     nnoremap <buffer>t                :<C-u>Unite tweetvim -no-start-insert -quick-match<CR>
    autocmd FileType tweetvim     nmap     <buffer><Leader>F        <Plug>(tweetvim_action_remove_favorite)
    autocmd FileType tweetvim     nmap     <buffer><Leader>d        <Plug>(tweetvim_action_remove_status)
    " リロード
    autocmd FileType tweetvim     nmap     <buffer><Tab>            <Plug>(tweetvim_action_reload)
    " ページの先頭に戻ったときにリロード
    autocmd FileType tweetvim     nmap     <buffer><silent>gg       gg<Plug>(tweetvim_action_reload)
    " ページ移動を ff/bb から f/b に
    autocmd FileType tweetvim     nmap     <buffer>f                <Plug>(tweetvim_action_page_next)
    autocmd FileType tweetvim     nmap     <buffer>b                <Plug>(tweetvim_action_page_previous)
    " favstar や web UI で表示
    autocmd FileType tweetvim     nnoremap <buffer><Leader><Leader> :<C-u>call <SID>tweetvim_favstar()<CR>
    " ブラウザで対象ユーザのホームを開く
    autocmd FileType tweetvim     nnoremap <buffer><Leader>u        :<C-u>call <SID>tweetvim_open_home()<CR>
    " 縦移動（カーソルを常に中央にする）
    autocmd FileType tweetvim     nnoremap <buffer><silent>j        :<C-u>call <SID>tweetvim_vertical_move("gj")<CR>zz
    autocmd FileType tweetvim     nnoremap <buffer><silent>k        :<C-u>call <SID>tweetvim_vertical_move("gk")<CR>zz
    " 不要なマップを除去
    autocmd FileType tweetvim     nunmap   <buffer>ff
    autocmd FileType tweetvim     nunmap   <buffer>bb
    " tweetvim バッファに移動したときに自動リロード
    autocmd BufEnter * call <SID>tweetvim_reload()
augroup END

" セパレータを飛ばして移動する
" ページの先頭や末尾でそれ以上 上/下 に移動しようとしたらページ移動する
function! s:tweetvim_vertical_move(cmd)
    execute "normal! ".a:cmd
    let end = line('$')
    while getline('.') =~# '^[-~]\+$' && line('.') != end
        execute "normal! ".a:cmd
    endwhile
    " 一番下まで来たら次のページに進む
    let line = line('.')
    if line == end
        call feedkeys("\<Plug>(tweetvim_action_page_next)")
    elseif line == 1
        call feedkeys("\<Plug>(tweetvim_action_page_previous)")
    endif
endfunction

" filetype が tweetvim ならツイートをリロード
function! s:tweetvim_reload()
    if &filetype ==# "tweetvim"
        call feedkeys("\<Plug>(tweetvim_action_reload)")
    endif
endfunction

" カーソル行のツイートをしたユーザの favstar を開く
function! s:tweetvim_favstar()
    let screen_name = matchstr(getline('.'),'^\s\zs\w\+')
    let path = empty(screen_name) ? "/me" : "/users/" . screen_name

    execute "OpenBrowser http://ja.favstar.fm" . path
endfunction

"
" ツイートしたユーザのホームを開く
function! s:tweetvim_open_home()
    let username = expand('<cword>')
    if username =~# '^[a-zA-Z0-9_]\+$'
        execute "OpenBrowser https://twitter.com/" . username
    endif
endfunction

"##### 基本設定 #####{{{1
set encoding=utf-8 "ファイル読み込み時の文字コードの設定
scriptencoding utf-8 "Vim script内でマルチバイト文字を使う場合の設定
set fenc=utf-8 "文字コードをUFT-8に設定
set title "編集中のファイル名を表示
set showmatch "括弧に対応する括弧を表示
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set mouse=a "マウスモードオン
set vb t_vb= "ビープ音を消す
inoremap <silent> jj <ESC>      "インサートモードで素早くjjと入力するとノーマルモードへ移行
autocmd BufWritePre * :%s/\s\+$//ge "末尾の空白を消す
set clipboard=unnamed,autoselect  "ヤンクした文をクリップボードへコピー
set nobackup            " バックアップをしない
set noswapfile            " スワップファイルを作らない
autocmd FileType * setlocal formatoptions-=ro " 勝手にコメントアウトされるのを防ぐ
set tw=0              "勝手に改行されるのを防ぐ
set formatoptions=q         "同上
set nocompatible          "これいる?
let mapleader = "\<Space>"      "リーダーキーをスペースにする

"##### 文字コード #####{{{1
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決

"##### タブ・インデント・コピペ #####{{{1
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

" 勝手にコメントアウトされるのを防ぐ
autocmd FileType * setlocal formatoptions-=ro

"xキーで文字を削除した際にヤンクの内容を消えないようにする
noremap PP "0p
noremap x "_x

"全角スペース可視化
augroup highlightIdegraphicSpace
    autocmd!
    autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
    autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" 不可視文字の視覚化
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲
"##### 検索 #####{{{1
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"##### カーソル #####{{{1
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

"全角H,J,K,Lで高速移動
noremap J 20j
noremap K 20k
noremap L 10l
noremap H 10h

" インサートモードでもhjklで移動（Ctrl同時押し）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 対応する括弧に移動
nnoremap ( %
nnoremap ) %
"##### 補完機能 #####{{{1
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

" オムニ補完の設定（insertモードでCtrl+oで候補を出す、Ctrl+n Ctrl+pで選択、Ctrl+yで確定）
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType phtml set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType cpp set omnifunc=omni#cpp#complete#Main
" カンマの後に自動的にスペースを挿入
inoremap , ,<Space>

"閉じタグ補完
augroup MyXML
    autocmd!
    autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
    autocmd Filetype eruby inoremap <buffer> </ </<C-x><C-o>
augroup END


"##### 色設定#####{{{1
syntax on "色付けオン
set background=dark "背景を黒にする
autocmd Colorscheme * highlight Normal ctermbg=none
autocmd Colorscheme * highlight LineNr ctermbg=none
colorscheme hybrid

"##### その他 #####{{{1
"Escキーのディレイを無くす
if !has('gui_running')
    set timeout timeoutlen=1000 ttimeoutlen=50
endif

"Escディレイをなくすpart2
set timeout timeoutlen=50

"Escキーを押したときにIMEをオフにする(macのみ)
if has('mac')
let g:imeoff = 'osascript -e "tell application \"System Events\" to key code 102"'
    augroup MyIMEGroup
    autocmd!
    autocmd InsertLeave * :call system(g:imeoff)
    augroup END
endif

"w!! でスーパーユーザーとして保存
cmap w!! w !sudo tee > /dev/null %

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge

" 保存時にtabをスペースに変換する
" autocmd BufWritePre * :%s/\t/  /ge

" 日時の自動入力
inoremap <expr> ,df strftime('%Y/%m/%d %H:%M:%S')
inoremap <expr> ,dd strftime('%Y/%m/%d')
inoremap <expr> ,dt strftime('%H:%M:%S')

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction

"##### モードライン設定 #####{{{1
set modeline "モードラインを有効にする
set modelines=3 "モードライン検索行
" vim: foldmethod=marker
" vim: foldcolumn=3
" vim: foldlevel=0
