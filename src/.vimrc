set nocompatible              " required
filetype off                  " required
set number                    " set Line Number

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
" SimplyFold refer to line 13
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"Colorized vim"
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"set clipboard=unnamed        " OSx access vim's clipboard from outside
" Spilit and Spilit Navigation

set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8
set termguicolors

" From P.Hooshmandi
" Formatting {
    set nowrap          " Disable text wrapping
    set autoindent      " Indent at the same level of the previous line
    set shiftwidth=4    " Use indet of 4 spaces
    set expandtab       " Use spaces instead of tabs
    set tabstop=4       " An indentation every 4 columns
    set softtabstop=4   " Let backspace delete indent
" }
" General {
    syntax on           " Syntax highlighting
    set mouse=a         " Enable mouse usage
    set autowrite       " Automatically write a file when leaving a modified buffer
    set history=500    " Store a ton of history. Default is 20
    " set backup          " Backup is always good
    set showmode        " Show current mode
    set showcmd         " Show partial command
    set ruler           " Show ruler    
    set linespace=0     " Line spacing
    set nu              " Show line numbers
    set incsearch       " Find as you type search
    set hlsearch        " Highlight search terms
    set ignorecase      " Case insensitive search
    set wildmenu        " Show list instead of completing
    set wildmode=list:longest,full
    set scrolloff=3     " Minimum lines to keep above and below cursor
    set scrolljump=5    " lines to scroll when cursor leaves screen

" Python PEP8
au BufNewFile, BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
" YCM Customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Red Flas for tailing white spaces # see it it works
"python with virtualenv support Needs to betest
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Python highlight
let python_highlight_all=1
syntax on

" NERDTree .pyc does not show *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree


" JS, HTML, CSS, YAML, JSON
au BufNewFile, BufRead *.js, *.html, *.css, *.yml, *.yaml, *.json
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2
au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"Color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  colorscheme zenburn
endif
