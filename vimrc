" ========== Vim Basic Settings ============="

" Syntax hightlight
syntax on

" Keep more info in memory to speed things up
set hidden
set history=50

" Add a bit extra margin to the left
"set foldcolumn=1

" No newline at the end of file
set nofixendofline

" Have some logic when indenting
filetype indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set nowrap
set smartindent
set autoindent
set cindent

" More Common Settings
"set encoding=utf8
set encoding=utf-8
set scrolloff=5
set ttyfast
set ruler
set undofile
set shell=/bin/zsh
set lazyredraw
set matchtime=3
set autoread
set backspace=indent,eol,start
"set pastetoggle=<F3>

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
  autocmd GUIEnter * set vb t_vb=
endif

" Line Number
"set relativenumber
"set number
"set norelativenumber

" Better Search
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set ignorecase
set incsearch
set smartcase
"set gdefault

" " Disable highlight or Cancel search with ESC
if has("gui_running")
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
else
  map <silent> <leader><cr> :noh<cr>
endif
"nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" Show Matching Parenthesis
set showmatch

" Changing Leader Key
let mapleader = ","

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" No swap file in current folder
set backupdir=/tmp

" Map : to ; also in command mode.
nnoremap ; :

" Make Vim to handle long lines nicely.
"set textwidth=120
"set formatoptions=qrn1
"set colorcolumn=120

" For vimwiki
au BufRead,BufNewFile *.txt setlocal textwidth=80

" When editing a text file, if you want word wrapping, but only want line breaks inserted when you explicitly press the Enter key
"set wrap
"set linebreak
"set nolist  " list disables linebreak

" Prevent Vim from automatically inserting line breaks in newly entered text
"set textwidth=0
"set wrapmargin=0

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Misc
set autochdir

" =========== END Basic Vim Settings ===========

" =========== Advanced Vim Settings ===========

" Wildmenu completion
set wildmenu
set wildmode=longest:full,full
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=package-lock.json "Javascript"
set wildignore+=*/node_modules "Javascript"
set wildignore+=*/plugins "Javascript"
set wildignore+=*/platforms "Javascript"
set wildignore+=*/coverage "Javascript"
set wildignore+=*/desktop "NW.js"
set wildignore+=*/cache "NW.js"
set wildignore+=*/resources "Copay"
set wildignore+=*/www "Copay"
set wildignore+=*/dist "Copay"
set wildignore+=*/tmp/*,*.so,*.zip

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Switch to latest buffer opened
map <D-*> :b#<CR>
nnoremap <silent> <D-+> :BufExplorer<CR>

" Syntax highlight for github .md files "
"au BufRead,BufNewFile *.md set filetype=markdown

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" =========== END Advanced Vim Settings ===========

" =========== Gvim Settings =============

if has("gui_running")
  set background=dark
  colorscheme gruvbox
  set cursorline
  set mouse=a
  " Removing scrollbars
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  set listchars=tab:▸\ ,eol:¬
else
  colorscheme badwolf
  set t_Co=256
endif

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set font according to system
if has("gui_running") && (has("mac") || has("macunix"))
"  set gfn=Mononoki:h12,Menlo:h12,Consolas:h14,Source\ Code\ Pro:h13,Hack:h14
  set gfn=Hack\ Nerd\ Font:h14
elseif has("unix")
  set gfn=Monospace\ 11
endif

" ========== Python 3 support ==========
" Python Setting {
  set pythondll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
  set pythonhome=/usr/local/Frameworks/Python.framework/Versions/3.7
  set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.7/Python
  set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.7
" }

" ========== END Gvim Settings ==========

" ========== Plugin Settings =========="

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree.git'
Plugin 'preservim/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'bling/vim-bufferline' " list buffer in command line
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-fugitive' " Git
Plugin 'junegunn/gv.vim' " Show commits
Plugin 'itchyny/lightline.vim'
Plugin 'ycm-core/YouCompleteMe.git'
Plugin 'Valloric/MatchTagAlways.git'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'prettier/vim-prettier', {
"  \ 'do': 'npm install',
"  \ 'for': ['javascript', 'typescript', 'scss'] }
Plugin 'yegappan/mru'
Plugin 'mbbill/undotree'
"Plugin 'bumaociyuan/vim-swift'
Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'vim-syntastic/syntastic'
Plugin 'dense-analysis/ale'

Plugin 'Xuyuanp/nerdtree-git-plugin'
"Plugin 'ryanoasis/vim-devicons'

Plugin 'vimwiki/vimwiki'

" Android
"Plugin 'hsanson/vim-android'

"====== ReactJS ====== "
Plugin 'pangloss/vim-javascript'
Plugin 'maxmellon/vim-jsx-pretty'

"====== Emmet ====== "
Plugin 'mattn/emmet-vim'

"====== Snippet ===== "
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" === Git ==== "
"Plugin 'airblade/vim-gitgutter.git'

" === Spell checker === "
Plugin 'kamykn/spelunker.vim'

" === Solidity === "
Plugin 'tomlion/vim-solidity'

call vundle#end()
filetype plugin indent on

" =========== END Plugin Settings =========="

" =========== Custom Settings =========="
function! InsertConsoleLog()
  let word = expand("<cword>")
  let linenumber = line(".")
  execute "normal A \<BS>\<CR>\<ESC>0Aconsole.log('[" . expand('%:t'). ":" .linenumber. "]',".word."); \/* TODO *\/"
endfunction

map <silent> ,v :call InsertConsoleLog()<CR>bbbbi

" Fix for fugitive and editorconfig
"let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Jump to HTML tag
nnoremap <leader>% :MtaJumpToOtherTag<cr>

" jsbeautify
"map <c-f> :call JsBeautify()<cr>

" autoformat when save (jsbeautify)
"au BufWritePost *.js :call JsBeautify()<cr>

" MRU plugin
let MRU_Max_Entries = 50
map <leader>f :MRU<CR>

" YouCompleteMe
"if !exists("g:ycm_semantic_triggers")
  "let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']

" YouCompleteMe and UltiSnips compatibility
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<C-n>'
let g:UltiSnipsJumpBackwardTrigger     = '<C-m>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" Remove new windows auto preview for YouCompleteMe
set completeopt-=preview

" Autoclose brackers
"let g:doorboy_nomap_quotations = { 'javascript': ['/'] }
let g:doorboy_additional_brackets = { 'html': ['<>'] }

" find files and populate the quickfix list
fun! FindFiles(filename)
  let error_file = tempname()
  silent exe '!find . -name "'.a:filename.'" | xargs file | sed "s/:/:1:/" > '.error_file
  set errorformat=%f:%l:%m
  exe "cfile ". error_file
  copen
  call delete(error_file)
endfun
command! -nargs=1 FindFile call FindFiles(<q-args>)

" Start nerdtree
"if has("gui_running")
"  autocmd vimenter * NERDTree
"  autocmd VimEnter * wincmd p
"endif
" Mapping to NERDTree
map <leader>nn :NERDTreeToggle<cr>
map <leader>nc :NERDTreeToggle Copay<cr>
map <leader>nf :NERDTreeFocus<cr>
nnoremap <silent> <Leader>mm :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', 'node_modules']
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 30
"let g:NERDTreeMinimalUI = 1

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Custom file listing command
let g:ctrlp_user_command = 'find %s -type f'
" Ignore gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" UndoTree
nnoremap <leader>- :UndotreeToggle<CR>
if !exists('g:undotree_WindowLayout')
  let g:undotree_WindowLayout = 4
endif
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 20
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0

" Typescript
"let g:typescript_indent_disable = 1
"autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost    l* nested lwindow
"autocmd FileType typescript setlocal completeopt-=menu
"let g:tsuquyomi_completion_detail = 1
"if has("gui_running")
"  set ballooneval
"  autocmd FileType typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
"else
"  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
"endif
"let g:tsuquyomi_disable_quickfix = 1
"let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker.
"let g:tsuquyomi_tsserver_path = '/Users/gustavo/.npm-global/bin'


" Syntastic initial configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" Plugin auto-pairs
"let g:AutoPairsFlyMode = 1
"let g:AutoPairsShortcutBackInsert = '<M-b>'
"au Filetype typescript let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
au Filetype html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->', '<' : '>'})
au Filetype txt let b:AutoPairs = {"(": ")"}
"let g:AutoPairs['<']='>'

" ALE
"let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1
let g:ale_hover_cursor = 0
let g:ale_set_highlights = 0
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
"let g:ale_fixers = ['prettier', 'eslint']
"\   '*': ['remove_trailing_lines', 'trim_whitespace'],
let g:ale_fixers = {
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['prettier']
\}
let g:ale_fix_on_save = 1
nnoremap <leader>aa :ALEGoToDefinition<CR>
nnoremap <leader>av :ALEGoToDefinitionInVSplit<CR>
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
augroup VimDiff
  autocmd!
  autocmd VimEnter,BufEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END
let g:ale_pattern_options = {
\   '.*\.json$': {'ale_enabled': 0},
\   '.*\.java$': {'ale_enabled': 0},
\   '.*\.m$': {'ale_enabled': 0},
\   '.*\.h$': {'ale_enabled': 0},
\   '.*\.xml$': {'ale_enabled': 0},
\   '.*\.md$': {'ale_enabled': 0},
\   '.*\.txt$': {'ale_enabled': 0},
\   '.*www/.*\.js$': {'ale_enabled': 0},
\}
let g:ale_set_ballons = 0

" Adds current datetime
nnoremap <F5> "=strftime("%a %d %b %Y")<CR>P
inoremap <F5> <C-R>=strftime("%a %d %b %Y")<CR>

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gC :Gcommit -n<CR> " commit but ignore hooks
nnoremap <leader>gP :Gpush<CR>
nnoremap <leader>gfP :Gpush --force-with-lease<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gl :GV!<CR> " Git log for the current file
nnoremap <leader>gL :GV<CR> " Full git log
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Git checkout master<CR>
nnoremap <leader>g- :Git checkout -<CR>
nnoremap <leader>grm :Grebase -i master<CR>

" Vim Wiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'default': 'markdown', 'ext': '.txt'}]
"let g:vimwiki-option-auto_toc = 1
"let g:vimwiki-option-list_margin = 0

" Tabs window
if has("gui_macvim")
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>

  " Switch to specific tab numbers with Command-number
  noremap <D-1> :tabn 1<CR>
  noremap <D-2> :tabn 2<CR>
  noremap <D-3> :tabn 3<CR>
  noremap <D-4> :tabn 4<CR>
  noremap <D-5> :tabn 5<CR>
  noremap <D-6> :tabn 6<CR>
  noremap <D-7> :tabn 7<CR>
  noremap <D-8> :tabn 8<CR>
  noremap <D-9> :tabn 9<CR>
  " Command-0 goes to the last tab
  noremap <D-0> :tablast<CR>
endif

" Android
let g:android_sdk_path = '/Users/gustavo/Library/Android/sdk'
let g:gradle_path = '/Users/gustavo/.sdkman/candidates/gradle/current/bin'

" Spell checker
set nospell

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1
augroup spelunker
  autocmd!
  autocmd BufWinEnter,BufWritePost *.txt,*.md call spelunker#check()
  " autocmd CursorHold *.txt,*.md call spelunker#check_displayed_words()
augroup END
" Create own custom autogroup to enable spelunker.vim for specific filetypes.
"augroup spelunker
  "autocmd!
  "" Setting for g:spelunker_check_type = 1:
  "autocmd BufWinEnter,BufWritePost *.txt,*.md call spelunker#check()

  "" Setting for g:spelunker_check_type = 2:
  "autocmd CursorHold *.txt,*.md call spelunker#check_displayed_words()
"augroup END
"" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

" Nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"=========== Status Bar =========="
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'linter' ], [ 'filetype', 'fileencoding' ], [ 'lineinfo', 'percent'] ]
      \ },
      \ 'component_function': {
      \   'percent': 'MyLightLinePercent',
      \   'lineinfo': 'MyLightLineLineInfo',
      \   'fugitive': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \   'linter': 'LinterStatus',
      \   'ctrlpmark': 'CtrlPMark'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '' },
      \ 'subseparator': { 'left': '⮁', 'right': '' }
      \ }
" \ 'separator': { 'left': '⮀', 'right': '⮂' },
"\ 'subseparator': { 'left': '⮁', 'right': '⮃' }
"\   'linter': 'LinterStatus',

"let g:bufferline_echo = 0
function! BufferLine()
  let st=g:bufferline#refresh_status()
  return g:bufferline_status_info.before . g:bufferline_status_info.current . g:bufferline_status_info.after
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
        \   '%dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

function! LightlineModified()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction
function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler' && &readonly ? '⭤' : ''
endfunction
function! LightlineFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' && has_key(g:lightline, 'ctrlp_item') ? g:lightline.ctrlp_item :
        \ fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree\|__MRU_Files__\|diffpanel_3\|undotree_2' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|MRU\|Diff\|UndoTree\|Fugitive' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '⭠ '
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == 'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ fname =~ '__MRU_Files__' ? 'MRU' :
        \ fname =~ 'diffpanel_3' ? 'Diff' :
        \ fname =~ 'undotree_2' ? 'UndoTree' :
        \ &ft == 'unite' ? 'Unite' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ &ft == 'vimshell' ? 'VimShell' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyLightLinePercent()
  if &ft !=? 'nerdtree'
    return line('.') * 100 / line('$') . '%'
  else
    return ''
  endif
endfunction

function! MyLightLineLineInfo()
  if &ft !=? 'nerdtree'
    return ''.line('.').':'. col('.')
  else
    return ''
  endif
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

let g:tagbar_status_func = 'TagbarStatusFunc'

function! TagbarStatusFunc(current, sort, fname, ...) abort
  let g:lightline.fname = a:fname
  return lightline#statusline(0)
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
