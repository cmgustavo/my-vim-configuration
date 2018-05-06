" ========== Vim Basic Settings ============="

" Syntax hightlight
syntax on

" Keep more info in memory to speed things up
set hidden
set history=50

" Have some logic when indenting
filetype indent on
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
"set smartindent
"set autoindent

" More Common Settings
set encoding=utf8
"set scrolloff=2
"set visualbell
"set ruler
"set ttyfast
set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3
set autoread
"set backspace=indent,eol,start
"set pastetoggle=<F3>

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
if has("gui_running")
  " Cancel search with ESC
  nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>
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
"set wrap
"set textwidth=120
"set formatoptions=qrn1
"set colorcolumn=120

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

" =========== END Advanced Vim Settings ===========

" =========== Gvim Settings =============

set background=dark
if has("gui_running")
  colorscheme solarized
"  set guifont=Robotomono\ Nerd\ Font:h12
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
if has("gui_running")
  Plugin 'Valloric/YouCompleteMe.git'
endif
Plugin 'Valloric/MatchTagAlways.git'
"Plugin 'maksimr/vim-jsbeautify'
"Plugin 'editorconfig/editorconfig-vim'
Plugin 'majutsushi/tagbar'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'leafgarland/typescript-vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'markdown'] }

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

" YouCompleteMe
if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

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
"autocmd vimenter * NERDTree
" Mapping to NERDTree
nnoremap <c-n> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Custom file listing command
let g:ctrlp_user_command = 'find %s -type f'
" Ignore gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Tagbar
nmap <leader>t :TagbarToggle<CR>


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
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! LightlineModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! LightlineFilename()
  let fname = expand('%:t')
  return fname == '__Tagbar__' ? g:lightline.fname :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ &ft == 'unite' ? unite#get_status_string() :
        \ &ft == 'vimshell' ? vimshell#get_status_string() :
        \ ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  try
    if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
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
  return fname == '__Tagbar__' ? 'Tagbar' :
        \ fname == '__Gundo__' ? 'Gundo' :
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
    return ' '.line('.').':'. col('.')
  else
    return ''
  endif
endfunction
