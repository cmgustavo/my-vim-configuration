" ========== Vim Basic Settings ============="

" Syntax hightlight "
syntax on

"TAB settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set visualbell
set ruler
set ttyfast
set undofile
set shell=/bin/bash
set lazyredraw
set matchtime=3
set hidden
set autoindent
set relativenumber
set number
set norelativenumber

set backspace=indent,eol,start
set pastetoggle=<F3>

"Changing Leader Key
let mapleader = ","

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" No swap file in current folder
set backupdir=/tmp

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Make Vim to handle long lines nicely.
set wrap
set textwidth=120
set formatoptions=qrn1
set colorcolumn=120

" Syntax highlight for github .md files "
au BufRead,BufNewFile *.md set filetype=markdown

" Rope settings."
inoremap <leader>j <ESC>:RopeGotoDefinition<cr>

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
nnoremap ; :

" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =

" Wildmenu completion "
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

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" =========== END Basic Vim Settings ===========

" =========== Gvim Settings =============

syntax enable

" Removing scrollbars
if has("gui_running")
  set guitablabel=%-0.12t%M
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
  set guioptions+=a
  set guioptions-=m
  set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
  set transparency=1
  set background=dark
  colorscheme solarized
  set cursorline
  set mouse=a
else
  set t_Co=256
  colorscheme badwolf
endif

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" required! 
Plugin 'gmarik/vundle'

Plugin 'git@github.com:scrooloose/nerdtree.git'
Plugin 'git@github.com:corntrace/bufexplorer.git'
if has("gui_running")
  Plugin 'git@github.com:Valloric/YouCompleteMe.git'
endif
"Plugin 'git@github.com:digitaltoad/vim-jade.git'
"Plugin 'git@github.com:scrooloose/syntastic.git'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'gcmt/breeze.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-fugitive'
Plugin 'git@github.com:scrooloose/nerdcommenter.git'
"Plugin 'https://github.com/vim-perl/vim-perl.git'
Plugin 'Raimondi/delimitMate'
"Plugin 'mileszs/ack.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'bling/vim-airline'
Plugin 'git@github.com:Valloric/MatchTagAlways.git'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on

" =========== END Plugin Settings =========="
"

" =========== Custom Settings =========="
"
map <D-*>  :b#<CR>
map <D-S-BS> :bdelete<CR>
map <D-¿>  :BufExplorer<CR>

function! InsertConsoleLog()
  let word = expand("<cword>")
  let linenumber = line(".")
  execute "normal A \<BS>\<CR>\<ESC>0Aconsole.log('[" . expand('%:t'). ":" .linenumber. "]',".word."); //TODO"
endfunction

map <silent> ,v :call InsertConsoleLog()<CR>bbbbi

map <silent> ,F  :Autoformat<CR>
" autoformat when save
"au BufWritePost *.js :Autoformat

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

map <F2> :! /usr/local/bin/ctags --recurse=yes --exclude=node_modules --exclude=android  --exclude=bin --exclude=browser-extensions --exclude=css --exclude=dist --exclude=font --exclude=img --exclude=lib --exclude=mobile --exclude=shell --exclude=sound --exclude=test --exclude=util --exclude=views --exclude=webapp . <CR>


"syntax highlighting for TT
"au BufNewFile,BufRead *.tt setf tt2
":let b:tt2_syn_tags = '\[% %] <!-- -->'



" =========== Status Bar =========="
"
set laststatus=2

