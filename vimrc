" ========== Vim Basic Settings ============="
" Pathogen settings.
filetype off
filetype plugin indent on

" Syntax hightlight "
syntax on

" Make vim incompatbile to vi.
set nocompatible
set modelines=0

"TAB settings.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" More Common Settings.
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
"set wildmenu
"set wildmode=list:longest
set visualbell
"set autochdir

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

set relativenumber
set number
set norelativenumber

"set undofile
"set shell=/bin/bash
"set lazyredraw
"set matchtime=3

"Changing Leader Key
let mapleader = ","

" Set title to window
set title 
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Make pasting done without any indentation break."
"set pastetoggle=<F3>

" Make Vim able to edit corntab fiels again.
set backupskip=/tmp/*,/private/tmp/*"

" No swap file in current folder
set backupdir=/tmp

" Enable Mouse
set mouse=a

"Settings for Searching and Moving
"nnoremap / /\v
"vnoremap / /\v
set ignorecase
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch
"nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %


" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

" Syntax highlight for github .md files "
au BufRead,BufNewFile *.md set filetype=markdown

" pretty print json
"nnoremap <C-S-F> :%!python -mjson.tool<CR> 

"set colorcolumn=79

" To  show special characters in Vim
"set list
set listchars=tab:▸\ ,eol:¬

" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
"nnoremap j gj
"nnoremap k gk

" Rope settings."
inoremap <leader>j <ESC>:RopeGotoDefinition<cr>

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Map : to ; also in command mode.
nnoremap ; :

" Set vim to save the file on focus out.
"au FocusLost * :wa

" Adding More Shorcuts keys using leader kye.
" Leader Kye provide separate namespace for specific commands.
",W Command to remove white space from a file.
"nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" ,ft Fold tag, helpful for HTML editing.
"nnoremap <leader>ft vatzf

" ,q Re-hardwrap Paragraph
"nnoremap <leader>q gqip

" ,v Select just pasted text.
"nnoremap <leader>v V`]

" ,ev Shortcut to edit .vimrc file on the fly on a vertical window.
"nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" jj For Qicker Escaping between normal and editing mode.
"inoremap jj <ESC>


" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


" Wildmenu completion "
"set wildmenu
"set wildmode=list:longest
"set wildignore+=.hg,.git,.svn " Version Controls"
"set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
"set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
"set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
"set wildignore+=*.spl "Compiled speolling world list"
"set wildignore+=*.sw? "Vim swap files"
"set wildignore+=*.DS_Store "OSX SHIT"
"set wildignore+=*.luac "Lua byte code"
"set wildignore+=migrations "Django migrations"
"set wildignore+=*.pyc "Python Object codes"
"set wildignore+=*.orig "Merge resolution files"


" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

"nnoremap g; g;zz

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
"    colo solarized
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
    set transparency=2
    set background=dark
    colorscheme solarized
else
"    set t_Co=256
"    set background=light
    set t_Co=256
    colorschem badwolf
endif

" Special Settings for Consoles
"if !has("gui_running")
"    set t_Co=256
"    colorschem badwolf
"endif
" Source the vimrc file after saving it
"autocmd bufwritepost .vimrc source ~/.vimrc

" ========== END Gvim Settings ==========


" ========== Plugin Settings =========="

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'git@github.com:scrooloose/nerdtree.git'
Bundle 'git@github.com:corntrace/bufexplorer.git'
Bundle 'git@github.com:Valloric/YouCompleteMe.git'
"Bundle 'git@github.com:digitaltoad/vim-jade.git'
Bundle 'git@github.com:scrooloose/syntastic.git'
Bundle 'jelera/vim-javascript-syntax'
"Bundle "mattn/emmet-vim"
Bundle "gcmt/breeze.vim"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "tpope/vim-fugitive"
Bundle "git@github.com:scrooloose/nerdcommenter.git"

" Mapping to NERDTree
nnoremap <C-n> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

map <F2> :! /usr/local/bin/ctags --recurse=yes --exclude=node_modules . <CR>

" =========== END Plugin Settings =========="
"

" =========== Custom Settings =========="
"
map <D-\|>  :b#<CR>
map <D-S-BS> :bdelete<CR>

function! InsertConsoleLog()
    let word = expand("<cword>")
    let linenumber = line(".")
    execute "normal A \<BS>\<CR>\<ESC>0Aconsole.log('[" . expand('%:t'). ":" .linenumber. "]',".word."); //TODO"
endfunction

map <silent> ,v :call InsertConsoleLog()<CR>bbbbi

nmap <D->> :bnext<CR>
nmap <D-<> :bprev<CR>
map <D-+>  :BufExplorer<CR>

