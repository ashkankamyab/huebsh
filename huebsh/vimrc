" Environment {
    set nocompatible    " Must be first line. Disable vi compatibality 
    set background=dark " Assume a light background
" }

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
    " color solarized     " Load a color schema
" }

" Key (re)Mappings {
    nnoremap Y y$         " Yank from cursor to the end of line
" }


" Remember last position(.viminfo must be writable) {
    set viminfo='10,\"100,:20,%,n~/.viminfo
    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction
    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END
" }
