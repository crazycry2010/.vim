" ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src
" Environment {
    runtime bundle/vim-pathogen/autoload/pathogen.vim
    call pathogen#infect()
    call pathogen#helptags()

    " auto reload vimrc when editing it
    autocmd! bufwritepost .vimrc source ~/.vimrc

    " Must be first line
    set nocompatible	 " not compatible with the old-fashion vi mode 
" }

" General {
    set background=dark         " Assume a dark background
    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    "set mouse=a                 " Automatically enable mouse usage
    set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    set clipboard=unnamed   " yank to the system register (*) by default

    set nobackup	     " no *~ backup files
    set nowb
    set noswapfile

    set t_ti= t_te=      " when quit vim, text on shell

    " Most prefer to automatically switch to the current file directory when
    " a new buffer is opened
    " Always switch to the current file directory
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
    " set autowirte     " Automatically write a file when leaving a modified buffer
    set autoread
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility 
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=2000	 " keep 50 lines of command line history
    set spell               " Spell checking on

    " Return to last edit position when opening files (You want this!)
    autocmd BufReadPost *
         \ if line("'\"") > 0 && line("'\"") <= line("$") |
         \   exe "normal! g`\"" |
         \ endif
    " Remember info about open buffers on close
    set viminfo^=%

    " Undo {
        " ================ Persistent Undo ==================
        " Keep undo history across sessions, by storing in file.
        " Only works all the time.
        silent !mkdir ~/.vim/backups > /dev/null 2>&1
        set undodir=~/.vim/backups
        set undofile
        set undolevels=1000 "maximum number of changes that can be undone
        set undoreload=10000 "maximum number lines to save for undo on a buffer reload"
    " }

    " bell {
        set title
        set novisualbell
        set noerrorbells
        set t_vb=
        set tm=500
    " }
" }

" Vim UI {
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    "colorscheme solarized
    colorscheme molokai
    "colorscheme desert

    set showmode	     " Show current mode

    set cursorline
    set cursorcolumn
    highlight clear SignColumn      " SignColumn should match background
    highlight clear LineNr          " Current line number row will have same ba#
    "highlight clear CursorLineNr    " Remove highlight color from current line#
    "highlight cursorline cterm=none ctermbg=7 ctermfg=none
    "highlight cursorcolumn cterm=none ctermbg=7 ctermfg=none
    highlight cursorline term=underline cterm=underline guibg=#202020
    set ruler                   " Show the ruler                            
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    "set cmdheight=2
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
    " statusline {
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                     " Filename
        set statusline+=%w%h%m%r                 " Options
        set statusline+=%{fugitive#statusline()} " Git Hotness
        set statusline+=\ [%{&ff}/%Y]            " Filetype
        set statusline+=\ [%{getcwd()}]          " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
    " }

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set winminheight=0              " Windows can be 0 line high
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, t#
    set wildignore=*.o,*.class,*.pyc,*.swp,*.bak
    set wildchar=<TAB>              " start wild expansion in the command line using <TAB>
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=5                " Lines to scroll when cursor leaves screen 
    set scrolloff=3                 " Minimum lines to keep above and below cur#
    "set foldenable                  " Auto fold code
    set list
    set listchars=tab:>-,trail:-,extends:#,nbsp:.
" }

" Formatting {
    "set nowrap                      " Do not wrap long lines
    set wrap
    set copyindent                  " copy the previous indentation on autoindenting
    set autoindent                  " Indent at the same level of the previous #
    set smartindent
    set shiftwidth=4                " Use indents of 4 spaces
    set expandtab                   " Tabs are spaces, not tabs
    set tabstop=4                   " An indentation every four columns
    set softtabstop=4               " Let backspace delete indent
    set smarttab                    " insert tabs on the start of a line according to context
    set nojoinspaces                " Prevents inserting two spaces after punct#
    set splitright                  " Puts new vsplit windows to the right of t#
    set splitbelow                  " Puts new split windows to the bottom of t#
    "set matchpairs+=<:>             " Match, to be used with %
    set pastetoggle=<F4>           " pastetoggle (sane indentation on pastes)

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " Preparation: save last search, and cursor position.
        let _s=@/
        let l = line(".")
        let c = col(".")
        " do the business:
        %s/\s\+$//e
        " clean up: restore previous search history, and cursor position
        let @/=_s
        call cursor(l, c)
    endfunction
    " }

    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> | call StripTrailingWhitespace()

" }

" Key (re)Mappings {
    let mapleader = ','
    let g:mapleader = ','
    " Move in tabs and windows {
        map <C-J> <C-W>j<C-W>_
        map <C-K> <C-W>k<C-W>_
        map <C-L> <C-W>l<C-W>_
        map <C-H> <C-W>h<C-W>_

        map <S-h> gT
        map <S-L> gt
    " }

    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    "UPPERCASE and lowsercase conversion
    nnoremap gu gUiW
    nnoremap gl guiW     

   "go to first and last char of line
    nnoremap H ^
    nnoremap L g_
    vnoremap H ^
    vnoremap L g_

    "use ; to go to command line
    nnoremap ; :
    vnoremap ; :

    "Change Working Directory to that of the current file
    map <leader>cd :cd %:p:h<CR>:pwd<CR>

    vnoremap < <gv
    vnoremap > >gv

    " For when you forget to sudo.. Really Write the file.
    cmap w!! w !sudo tee % >/dev/null

    "imap ∆ <ESC><Down>
    "imap ˙ <ESC><Left>
    "imap ˚ <ESC><Up>
    "imap ¬ <ESC><Right>

    " tab {
        " Useful mappings for managing tabs
        map <leader>tt :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tw :tabclose<cr>

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
    " }

    " select all
    nnoremap <leader>va ggVG
    " select block
    nnoremap <leader>vb V`}

    " Visual mode pressing * or # searches for the current selection
    " Super useful! From an idea by Michael Naumann
    vnoremap <silent> * :call VisualSelection('f')<CR>
    vnoremap <silent> # :call VisualSelection('b')<CR>

    map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
" }

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936,big5,latin1


" Plugins {
    " Ctags {
        set tags=./tags;/,~/.vimtags
        set tags+=/usr/include/sys.tags
    " }

    " NerdTree {
        nnoremap <silent> <F8> :NERDTreeFind<CR>

        let NERDTreeShowBookmarks=1
        let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
        let NERDTreeChDirMode=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeMouseMode=2
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=1
        let g:nerdtree_tabs_open_on_gui_startup=0
        " close vim if the only window left open is a NERDTree
        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " }
    
    " ctrlp {
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_map = '<leader>cp'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_custom_ignore = {
                        \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                        \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

    " }
    
    " TagBar {
        nmap <F9> :TagbarToggle<CR>
    " }

    " vim-airline {
        set t_Co=256
        "let g:airline_powerline_fonts=1
        let g:airline_theme = 'solarized'
        "let Powerline_symbols='fancy'
        if !exists('g:airline_powerline_fonts')
            " Use the default set of separators with a few customizations
            let g:airline_left_sep='›'  " Slightly fancier than '>'
            let g:airline_right_sep='‹' " Slightly fancier than '<'
        endif
    " }

    " yankring {
        nnoremap <silent><F10> :YRShow<CR>
    " }
    
    " easymotion {
        let g:EasyMotion_leader_key='<Leader><leader>'
    " }

    " syntastic {
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0
    " }

    " vim-multiple-cursors {
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-n>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
    " }

" }
