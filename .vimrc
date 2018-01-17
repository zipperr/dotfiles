n
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
        \||(name =~# '^fugitive:')
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

"##### Openbrowser #####
let g:openbrowser_use_vimproc=0
nnoremap <Leader><Leader> :OpenBrowserSearch<Space>

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

"##### Previm #####
autocmd vimrc BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
nnoremap <Leader>p :PrevimOpen<CR>

"#####Commentout #####
nmap ,, gcc
vmap ,, gcc

"##### Swith #####
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

"##### Easy-Align #####
vmap <Enter> <Plug>(EasyAlign)*

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

"##### Netrw ######
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 12
" augroup ProjectDrawer
"   autocmd!
"   autocmd vimrc VimEnter * :Vexplore
" augroup END

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
    \[ "[web]Github",               "OpenBrowser https://github.com/zipperr" ],
    \[ "[web]GitPage",              "OpenBrowser https://zipperr.github.io" ],
    \[ "[web]Google",               "OpenBrowser https://www.google.co.jp" ],
    \[ "[web]GoogleDrive",          "OpenBrowser https://drive.google.com" ],
    \[ "[web]Qiita",                "OpenBrowser https://qiita.com" ],
    \[ "[web]Wiki",                 "OpenBrowser https://ja.wikipedia.org" ],
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
