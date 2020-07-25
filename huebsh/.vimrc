set nocompatible              " required
filetype off                  " required
set background=dark " Assume a light background
set t_Co=256
" MyConf
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
    " set foldenable      " Autofold code
    " set list            "   
    " set cursorline      " Show current line
    " color solarized     " Load a color schema went end of the file
    let python_highlight_all=1
" }
"Split 
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99

" PEP8 for python
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" FullStack Development
au BufNewFile,BufRead *.js, *.html, *.css, *.yml, *.yaml
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flaggin Unnecessary Whitespaces
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

" UTF-8 Support
set encoding=utf-8

"Docsctring for folded code
let g:SimpylFold_docstring_preview=1

"YouCompleteMe Customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" solarized colorscheme switch with F5
"call togglebg#map("<F5>")

"nerdtree Ignore pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" GUI Idempotency
if has('gui_running')
  color solarized
else
  color zenburn
endif
