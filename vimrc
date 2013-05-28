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

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

set nobackup	     " no *~ backup files
set nowb
set noswapfile

set expandtab        "replace <TAB> with spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab	     " insert tabs on the start of a line according to context
set list
set listchars=tab:>-,trail:-
au FileType Makefile set noexpandtab

set scrolloff=5

filetype plugin indent on
set copyindent	     " copy the previous indentation on autoindenting

syntax on	         " syntax highlight
set hlsearch	     " search highlighting
"colorscheme torte evening
colorscheme desert
set background=dark

set cursorline
set cursorcolumn
highlight cursorline cterm=none ctermbg=7 ctermfg=none
highlight cursorcolumn cterm=none ctermbg=7 ctermfg=none

set clipboard=unnamed   " yank to the system register (*) by default
set showmatch	     " Cursor shows matching ) and }
set showmode	     " Show current mode
set wildchar=<TAB>	 " start wild expansion in the command line using <TAB>
set wildmenu         " wild char completion menu
set wildignore=*.o,*.class,*.pyc

set autoindent	     " auto indentation
set smartindent

set incsearch	     " incremental search
set ignorecase	     " ignore case when searching
set smartcase	     " ignore case if search pattern is all lowercase,case-sensitive otherwise

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,latin1

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

"set cmdheight=2
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

"imap ∆ <ESC><Down>
"imap ˙ <ESC><Left>
"imap ˚ <ESC><Up>
"imap ¬ <ESC><Right>

let mapleader=","
let g:mapleader=","

map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <S-h> gT
map <S-L> gt

map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR>
" Useful mappings for managing tabs
map <leader>tt :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tw :tabclose<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

nnoremap j gj
nnoremap k gk

map <leader>cd :cd %:p:h<CR>:pwd<CR>

nmap <leader>p :set paste!<BAR>set paste?<CR>

vnoremap < <gv
vnoremap > >gv

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" yankring
nnoremap <silent><F11> :YRShow<CR>

" easymotion
let g:EasyMotion_leader_key='<Leader><leader>'

" tagbar
nmap <F9> :TagbarToggle<CR>
