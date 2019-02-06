" Compatibilty and functionality {{{
set nocompatible                " Enable features that require 'nocompatible'.
filetype plugin indent on       " Enable filetype detection ,plugins and indent.
set encoding=utf-8              " Set output encoding for terminal.
set fileencoding=utf-8          " Set output encoding for writing files.
scriptencoding utf-8            " Set current script encoding.
" }}} Compatibility and functionality


" Plugins {{{

" Auto-install vim-plug (for neovim).
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'scrooloose/nerdtree'
    Plug 'chriskempson/base16-vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdcommenter'
    Plug 'scrooloose/syntastic'
    Plug 'tommcdo/vim-exchange'
    Plug 'mattn/emmet-vim'
    Plug 'junegunn/fzf'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'posva/vim-vue'
    Plug 'jwalton512/vim-blade'
    Plug 'jiangmiao/auto-pairs'
    Plug 'chaoren/vim-wordmotion'
"    Plug 'vim-airline/vim-airline'
"    Plug 'tpope/vim-fugitive'
"    Plug 'airblade/vim-gitgutter'
"    Plug 'valloric/youcompleteme'
"    Plug 'w0rp/ale'
"    Plug 'plasticboy/vim-markdown'
call plug#end()

" Auto-install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" }}} Plugins


" Colors {{{
syntax enable                   " Enable syntax highlighting.
set t_Co=256                    " Enable 8bit color (256 color).
set termguicolors               " Enable 24bit color (True color).
set background=dark             " Set background theme (used by some themes).
colorscheme base16-atelier-dune " Set color scheme.
" }}} Colors


" Indentation {{{
set tabstop=4                   " Number of visual spaces per tab.
set softtabstop=4               " Number of space in tab when editing.
set shiftwidth=4                " Number of space used for autoindent.
set expandtab                   " Tabs are expanded to spaces.
set smarttab                    " Enable backspacing though spaces like they were tabs.
set autoindent                  " Automatic indentation.
set copyindent                  " Indentation copied from previos line.
" }}} Indentaion


" User Interface {{{
set hidden                      " Files are hidden instead of closed when opening another.
set number                      " Show line number.
set showcmd                     " Show command in bottom bar.
set cursorline                  " Highlight the current line.
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
" }}} User Interface


" Search {{{
set incsearch                   " Search as characters are entered.
set hlsearch                    " Highlight search matches.
set ignorecase                  " Ignore case when searching.
set smartcase                   " Ignore case if search pattern is lowercase, otherwise case-sensitive.
" }}} Search


" Functionality {{{
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join.
set autoread                    " Reload file when changed outside vim.
set backspace=indent,eol,start  " Let backspace go though more characters.
set timeout
set ttimeout
set timeoutlen=500              " Milliseconds to wiat for mapped sequence to complete.
set ttimeoutlen=1               " Milliseconds to wiat for key code sequency to complete.
set virtualedit=                " Set no vitural edit.
" }}}


" keybinds {{{
let mapleader=" "               " Make <space> the leader key.

" Better esc with 'jj'
inoremap jk <esc>
inoremap kj <esc>
inoremap jj <esc>
inoremap kk <esc>

" Better write/quit/Exit
cmap w!! w !sudo tee > /dev/null %
nmap <leader>q :q<CR>
nmap <leader>qa :qa<CR>
nmap <leader>qa! :qa!<CR>
nmap <leader>q! :q!<CR>
nmap <leader>x :x<CR>
nmap <leader>w :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>wsu :w!!<CR>

" Move up/down viusal lines by default
nnoremap j gj
nnoremap k gk

" Buffers
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

" Edit/reload config
nmap <leader>ev :e $VIMCONFIG/init.vim<CR>
nmap <leader>sv :so $VIMCONFIG/init.vim<CR>

" Move though grep results
nnoremap <leader> <right> :cnext<CR>
nnoremap <leader> <left> :cprev<CR>

" Split navigation
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Toggles 
nnoremap <leader>t<space> :set invlist<CR>
nnoremap <leader>tn :set invnumber<CR>
nnoremap <leader>tr :set invrelativenumber<CR>

" }}} Keybinds 


" Plugin keybinds {{{

" NERDTree mappings
nnoremap <leader>tt :NERDTreeToggle<CR>
" }}} Plugin keybinds

" Filetype Settings {{{
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}} Filetype Settings
