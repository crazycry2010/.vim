" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Must be first line
set nocompatible	 " not compatible with the old-fashion vi mode 

set nu
set bs=2	         " allow backspacing over everything in insert mode
set history=2000	 " keep 50 lines of command line history
set ruler	         " show the cursor position all the time
set autoread	     " auto read when file is changed from outside
" set autowirte     " Automatically write a file when leaving a modified buffer
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility 

" 修改leader键
let mapleader = ','
let g:mapleader = ','

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

set nobackup	     " no *~ backup files
set nowb
set noswapfile

set nowrap

" 去掉输入错误的提示声音
set title
set novisualbell
set noerrorbells
set t_vb=
set tm=500

set expandtab        "replace <TAB> with spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab	     " insert tabs on the start of a line according to context
set list
set listchars=tab:>-,trail:-,extends:#,nbsp:.
au FileType Makefile set noexpandtab

"set splitright                  " Puts new vsplit windows to the right of the current
"set splitbelow                  " Puts new split windows to the bottom of the current

set scrolljump=8                " Lines to scroll when cursor leaves screen
set scrolloff=8                 " Minimum lines to keep above and below cursor

"检测文件类型
filetype on
"针对不同的文件类型采用不同的缩进格式
filetype indent on
"允许插件
filetype plugin on
"启动自动补全
filetype plugin indent on

set copyindent	     " copy the previous indentation on autoindenting

" set mouse=a        " Automatically enable mouse usage
set mousehide        " Hide the mouse cursor while typing

set t_ti= t_te=      " when quit vim, text on shell

syntax on	         " syntax highlight
set background=dark  " Assume a dark background
"colorscheme solarized
colorscheme molokai
"colorscheme desert

set cursorline
set cursorcolumn
"highlight clear SignColumn
"highlight clear LineNr
"highlight cursorline cterm=none ctermbg=7 ctermfg=none
"highlight cursorcolumn cterm=none ctermbg=7 ctermfg=none

set clipboard=unnamed   " yank to the system register (*) by default
set showmatch	     " Cursor shows matching ) and }
set showmode	     " Show current mode
set wildchar=<TAB>	 " start wild expansion in the command line using <TAB>
set wildmenu         " wild char completion menu
set wildignore=*.o,*.class,*.pyc,*.swp,*.bak
set spell               " Spell checking on

set autoindent	     " auto indentation
set smartindent

set hlsearch	     " search highlighting
set incsearch	     " incremental search
set ignorecase	     " ignore case when searching
set smartcase	     " ignore case if search pattern is all lowercase,case-sensitive otherwise

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,latin1

set tags+=/usr/include/sys.tags

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
"set statusline=%{HasPaste()}%<%f\        " Filename
"set statusline+=%w%h%m%r                 " Options
"set statusline+=%{fugitive#statusline()} " Git Hotness
"set statusline+=\ [%{&ff}/%Y]            " Filetype
"set statusline+=\ [%{CurDir()}]          " Current dir
"set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info


"function! CurDir()
    "let curdir = substitute(getcwd(), $HOME, "~", "")
    "return curdir
"endfunction

"function! HasPaste()
    "if &paste
        "return '[PASTE]'
    "else
        "return ''
    "endif
"endfunction

"}

"imap ∆ <ESC><Down>
"imap ˙ <ESC><Left>
"imap ˚ <ESC><Up>
"imap ¬ <ESC><Right>


map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

map <S-h> gT
map <S-L> gt

" select all
nnoremap <leader>va ggVG
" select block
nnoremap <leader>vb V`}

" Useful mappings for managing tabs
map <leader>tt :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tw :tabclose<cr>

" normal模式下切换到确切的tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"nnoremap j gj
"nnoremap k gk

map <leader>cd :cd %:p:h<CR>:pwd<CR>

nmap <leader>p :set paste!<BAR>set paste?<CR>
set pastetoggle=<F4>

vnoremap < <gv
vnoremap > >gv

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" nerdtree
nnoremap <silent> <F8> :NERDTreeToggle<CR>
" open a NERDTree automatically when vim starts up if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" yankring
nnoremap <silent><F10> :YRShow<CR>

" easymotion
let g:EasyMotion_leader_key='<Leader><leader>'

" tagbar
nmap <F9> :TagbarToggle<CR>

" Ctrlp
let g:ctrlp_map = '<leader>cp'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" powerline
let Powerline_symbols='fancy'
let g:airline_powerline_fonts=1
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'skwp'
set t_Co=256

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" vim-multiple-cursors 
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
