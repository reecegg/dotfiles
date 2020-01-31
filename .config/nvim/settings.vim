" Set the current script encoding.
scriptencoding utf-8

" Compatibilty and functionality
set nocompatible                " Enable features that require 'nocompatible'.
filetype plugin indent on       " Enable filetype detection ,plugins and indent.
set encoding=utf-8              " Set output encoding for terminal.
set fileencoding=utf-8          " Set output encoding for writing files.

" Colors
syntax enable                   " Enable syntax highlighting.
syntax sync minlines=10000      " Sets lines to highlight (Unknown performance)
set redrawtime=10000            " Sets maximum time spent trying to highlight
set t_Co=256                    " Enable 8bit color (256 color).
set termguicolors               " Enable 24bit color (True color).
set background=dark             " Set background theme (used by some themes).
colorscheme base16-atelier-dune " Set color scheme.

" Indentation
set tabstop=4                   " Number of visual spaces per tab.
set softtabstop=4               " Number of space in tab when editing.
set shiftwidth=4                " Number of space used for autoindent.
set expandtab                   " Tabs are expanded to spaces.
set smarttab                    " Enable backspacing though spaces like they were tabs.
set autoindent                  " Automatic indentation.
set copyindent                  " Indentation copied from previous line.

" User Interface
set hidden                      " Files are hidden instead of closed when opening another.
set nonumber                    " Dont show line number.
set noshowcmd                   " Dont show command in bottom bar.
set cursorline                  " Dont highlight the current line.
set nocursorcolumn              " Dont highlight current column.
set wildmenu                    " Enable visual autocomplete for command menu.
set wildmode=list:longest,full  " Mode info and space used by wildmenu.
set showmatch                   " Highlight match braces.
set laststatus=2                " Windows will always have a status line.
set nowrap                      " Dont wrap lines.
set nolist                      " Dont show non-print characters by default.
set listchars=eol:¬,tab:¦\ ,space:·,extends:»,precedes:«,trail:•,nbsp:␣
set splitbelow                  " Horizontal splits below current.
set splitright                  " Vertical splits to right of current.
set scrolloff=5                 " Always show next 3 lines.
set sidescrolloff=10            " Always show next 5 characters.
set sidescroll=1                " Scroll sideways one character at a time.
set nostartofline               " Don't jump to the first character with page commands.
set ruler                       " Enable line/col number on the status bar.
set colorcolumn=                " Set no color columns.
set noshowmode                  " Dont show -- insert -- etc. text.
set showtabline=2               " Always show tabline even when there is only one.

" Search
set incsearch                   " Search as characters are entered.
set hlsearch                    " Highlight search matches.
set ignorecase                  " Ignore case when searching.
set smartcase                   " Ignore case if search pattern is lowercase, otherwise case-sensitive.
set shortmess+=c                " Dont show completion messages like 'match 1 of 2' or 'THe only match'.

" Functionality
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join.
set backspace=indent,eol,start  " Let backspace go indention, line breaks, and though text from before the current insert.
set timeout
set ttimeout
set timeoutlen=500              " Milliseconds to wait for mapped sequence to complete.
set ttimeoutlen=1               " Milliseconds to wait for key code sequency to complete.
set virtualedit=                " Set no vitural edit.
set updatetime=100              " Delay before CursorHold triggers.

" Autoread
set autoread                    " Reload file when changed outside vim.
" Check for autoread changes on terminal focus, buffer change, and cursor stop.
augroup auto_read
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
        \ if mode() == 'n' && getcmdwintype() == '' | checktime | endif
augroup END
