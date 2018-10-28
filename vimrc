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
set nowrap
set smartindent
set autoindent

" More Common Settings
set encoding=utf8
set scrolloff=2
set ttyfast
set ruler
set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3
set autoread
"set backspace=indent,eol,start
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
set wrap
set textwidth=120
set formatoptions=qrn1
set colorcolumn=120

" When editing a text file, if you want word wrapping, but only want line breaks inserted when you explicitly press the Enter key
set wrap
set linebreak
set nolist  " list disables linebreak

" Prevent Vim from automatically inserting line breaks in newly entered text
set textwidth=0
set wrapmargin=0

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

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
au BufRead,BufNewFile *.md set filetype=markdown

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" =========== END Advanced Vim Settings ===========

" =========== Gvim Settings =============

set background=dark
if has("gui_running")
  colorscheme solarized
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
  set gfn=IBM\ Plex\ Mono:h12,Hack:h12,Source\ Code\ Pro:h13,Menlo:h13
elseif has("unix")
  set gfn=Monospace\ 11
endif

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
Plugin 'scrooloose/nerdcommenter'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'itmammoth/doorboy.vim' " Autoclose brackets
Plugin 'tpope/vim-fugitive' " Github
Plugin 'itchyny/lightline.vim'
Plugin 'Valloric/YouCompleteMe.git'
Plugin 'Valloric/MatchTagAlways.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown'] }

Plugin 'ervandew/supertab'
Plugin 'yegappan/mru'
Plugin 'sjl/gundo.vim'

" ====== Snippet ===== "
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

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
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Remove new windows auto preview for YouCompleteMe
set completeopt-=preview

" Autoclose brackers
let g:doorboy_nomap_quotations = { 'javascript': ['/'] }
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
if has("gui_running")
  autocmd vimenter * NERDTree
  autocmd VimEnter * wincmd p
endif
" Mapping to NERDTree
map <leader>nn :NERDTreeToggle<cr>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
let g:NERDTreeWinPos = 'left'
let g:NERDTreeWinSize = 35

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Custom file listing command
let g:ctrlp_user_command = 'find %s -type f'
" Ignore gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" GUNDO
nnoremap <leader>- :GundoToggle<CR>
let g:gundo_width = 35
let g:gundo_preview_height = 40
let g:gundo_right = 1

" Typescript
let g:typescript_indent_disable = 1
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" =========== Status Bar =========="
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
      \   'right': [ ['percent'], [ 'fileencoding', 'filetype', 'lineinfo' ] ]
      \ },
      \ 'component_function': {
      \   'percent': 'MyLightLinePercent',
      \   'lineinfo': 'MyLightLineLineInfo',
      \   'fugitive': 'LightlineFugitive',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'fileencoding': 'LightlineFileencoding',
      \   'mode': 'LightlineMode',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'ro' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = '@'  " edit here for cool mark
      let branch = fugitive#head()
      return branch !=# '' ? mark.branch : ''
    endif
  catch
  endtry
  return ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  let fname = expand('%:t')
  return fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
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
