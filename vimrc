runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set nu
set nocompatible	 " not compatible with the old-fashion vi mode
set bs=2	         " allow backspacing over everything in insert mode
set history=50	     " keep 50 lines of command line history
set ruler	         " show the cursor position all the time
set autoread	     " auto read when file is changed from outside

set expandtab        "replace <TAB> with spaces
set shiftwidth=4
set tabstop=4
set softtabstop=3
au FileType Makefile set noexpandtab

filetype plugin indent on

syntax on	         " syntax highlight
set hlsearch	     " search highlighting

set cursorline
set cursorcolumn
highlight cursorline cterm=none ctermbg=7 ctermfg=0

set clipboard=unnamed   " yank to the system register (*) by default
set showmatch	     " Cursor shows matching ) and }
set showmode	     " Show current mode
set wildchar=<TAB>	 " start wild expansion in the command line using <TAB>
set wildmenu         " wild char completion menu
set wildignore=*.o,*.class,*.pyc

set autoindent	     " auto indentation
set incsearch	     " incremental search
set nobackup	     " no *~ backup files
"set copyindent	     " copy the previous indentation on autoindenting
set ignorecase	     " ignore case when searching
set smartcase	     " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab	     " insert tabs on the start of a line according to context

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \
set statusline+=\ \ \ [%{&ff}/%Y]
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

"}
