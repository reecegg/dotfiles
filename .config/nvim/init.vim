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
    Plug 'airblade/vim-gitgutter'                      " Show git diff in gutter (git diff indicator).
    Plug 'autozimu/LanguageClient-neovim'              " Language-Server protocal client (language client, completion, diagnostic).
    Plug 'chaoren/vim-wordmotion'                      " Improved word motions.
    Plug 'chriskempson/base16-vim'                     " Base16 colorscheme collection (colorscheme).
    Plug 'cohama/lexima.vim'                           " Autocomplete bracket pairs (pair completion).
    Plug 'ctrlpvim/ctrlp.vim'                          " TODO
    Plug 'godlygeek/tabular'                           " Tubularize via pattern function.
    Plug 'guns/vim-sexp'                               " TODO
    Plug 'itchyny/lightline.vim'                       " Lightweight status line (status line).
    Plug 'junegunn/fzf'                                " Fuzzy file
    Plug 'mattn/emmet-vim'                             " HTML, CSS, JS snippets.
    Plug 'neomake/neomake'                             " Asynchronous lint and make (lint ,make)
    Plug 'scrooloose/nerdtree'                         " Project Draw (project draw)
    Plug 'terryma/vim-multiple-cursors'                " Multiple cursors
    Plug 'tmux-plugins/vim-tmux-focus-events'          " Make vim and tmux work well together, effects 'FocusGained' and 'FocusLost' events.
    Plug 'tommcdo/vim-exchange'                        " Swap text regions with 'cx'.
    Plug 'tpope/vim-abolish'                           " :Abolish, :Subvert, Coercion 'cr' special functionality.
    Plug 'tpope/vim-apathy'                            " Set path for misc file types.
    Plug 'tpope/vim-characterize'                      " 'ga' character information.
    Plug 'tpope/vim-commentary'                        " 'gc' commenting (commenting).
    Plug 'tpope/vim-dadbod'                            " Database interface.
    Plug 'tpope/vim-dotenv'                            " Load .env.
    Plug 'tpope/vim-endwise'                           " End certian structures automatically.
    Plug 'tpope/vim-eunuch'                            " Helpers for unix.
    Plug 'tpope/vim-fugitive'                          " Git interface.
    Plug 'tpope/vim-jdaddy'                            " JSON text objects.
    Plug 'tpope/vim-obsession'                         " Vim session mangement.
    Plug 'tpope/vim-ragtag'                            " Ghetto html/xml mappings.
    Plug 'tpope/vim-repeat'                            " Repeat that which default repeat can not.
    Plug 'tpope/vim-rhubarb'                           " Github functionality for fugitive.vim.
    Plug 'tpope/vim-projectionist'                     " Project configured 'Projections'.
    Plug 'tpope/vim-sensible'                          " Sensible defaults.
    Plug 'tpope/vim-sexp-mappings-for-regular-people'  " Better mappings for sexp.vim.
    Plug 'tpope/vim-speeddating'                       " Date manipulation with <C-a> and <Ctrl-x>.
    Plug 'tpope/vim-surround'                          " Surround text object.
    Plug 'tpope/vim-tbone'                             " Tmux functionality for vim.
    Plug 'tpope/vim-unimpaired'                        " Useful backet mappings.
    Plug 'tpope/vim-vinegar'                           " Fast file access with improved netrw.
" Order Important Plugins {{{
    Plug 'sheerun/vim-polyglot'                        " Support for many languages.
    Plug 'tpope/vim-sleuth'                            " Set indentation based off simular files.
    Plug 'editorconfig/editorconfig-vim'               " Set settings based off editor config project file.
" }}} Order Important Plugins
call plug#end()

" Auto-install missing plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

" }}} Plugins


" Colors {{{
syntax enable                   " Enable syntax highlighting.
syntax sync minlines=10000      " Sets lines to highlight (Unknown performance)
set redrawtime=10000            " Sets maximum time spent trying to highlight
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
set backspace=indent,eol,start  " Let backspace go though more characters.
set timeout
set ttimeout
set timeoutlen=500              " Milliseconds to wiat for mapped sequence to complete.
set ttimeoutlen=1               " Milliseconds to wiat for key code sequency to complete.
set virtualedit=                " Set no vitural edit.
set autoread                    " Reload file when changed outside vim.
au CursorHold,CursorHoldI * checktime " Check for autoread changes to a file when the cursor stops moving.
au FocusGained,BufEnter * :checktime  " Check for autoread changes to a file on buffer change or terminal focus.
set updatetime=100              " Delay before CursorHold triggers.
" }}}


" keybinds {{{
let mapleader=" "               " Make <space> the leader key.

" Better esc with 'jj'
inoremap jk <esc>
"inoremap kj <esc>              " Disabled because k is commonly cut of the end of words.
inoremap jj <esc>
inoremap kk <esc>

" Better write/quit/Exit
nmap <leader>q :q<CR>
nmap <leader>qq :q<CR>
nmap <leader>qa :qa<CR>
nmap <leader>x :x<CR>
nmap <leader>w :w<CR>
nmap <leader>ww :w<CR>
nmap <leader>wq :wq<CR>

" Move up/down viusal lines by default
nnoremap j gj
nnoremap k gk

" Buffers
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>


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

" Meta
nnoremap <leader>mms :syntax sync fromstart<CR>
nmap <leader>mme :e $VIMCONFIG/init.vim<CR>
nmap <leader>mmr :so $VIMCONFIG/init.vim<CR>

" }}} Keybinds 


" Plugin keybinds {{{

" NERDTree mappings
nnoremap <leader>tt :NERDTreeToggle<CR>
" }}} Plugin keybinds

" Plugin Settings {{{

" vim-gitgutter settings
" permanent sign column
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Neomake Settings
if exists('*neomake#configure#automake')
  call neomake#configure#automake('nrwi', 500)
endif

" }}} Plugin Settings

" Filetype Settings {{{
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=2
" }}} Filetype Settings

" Noted
" Noted Plugins
    " Plug 'jiangmiao/auto-pairs'      " Alternative (pair completion).
    " Plug 'jwalton512/vim-blade'      " Replaced (vim-polygot).
    " Plug 'kana/vim-textobj-user'     " Unneeded functionality.
    " Plug 'kana/vim-textobj-entire'   " Requires dependency.
    " Plug 'natebosch/vim-lsc'         " Alternative (language client).
    " Plug 'posva/vim-vue'             " Repalced (vim-polygot).
    " Plug 'powerline/powerline'       " Alternative (status line).
    " Plug 'prabirshrestha/vim-lsp'    " Alternative (language client).
    " Plug 'scrooloose/syntastic'      " Alternative (diagnostic).
    " Plug 'scrooloose/nerdcommenter'  " Alternative (commenting).
    " Plug 'tmux-plugins/vim-tmux' " Replaced (vim-polygot).
    " Plug 'tpope/vim-afterimage'      " Unneeded functionality/unmaintained.
    " Plug 'tpope/vim-bundler'         " Unneeded, 'Gem Bundler' program specific.
    " Plug 'tpope/vim-capslock'        " Unneeded functionality/unmaintained.
    " Plug 'tpope/vim-classpath'       " Unneeded, 'Java' language specific.
    " Plug 'tpope/vim-cucumber'        " Included in vim.
    " Plug 'tpope/vim-dispatch'        " Unneeded functionality.
    " Plug 'tpope/vim-fireplace'       " Unneeded, 'Clojure' language specific.
    " Plug 'tpope/vim-flagship'        " Alternative (status line)/Unmaintained.
    " Plug 'tpope/vim-flatfoot'        " Unneeded functionality/unmaintained.
    " Plug 'tpope/vim-git'             " Replaced (vim-polygot).
    " Plug 'tpope/vim-haml'            " Included in vim.
    " Plug 'tpope/vim-haystack'        " Unneeded functionality/unmaintained.
    " Plug 'tpope/vim-heroku'          " Unneeded, 'Heroku' service specific.
    " Plug 'tpope/vim-liquid'          " Unneeded functionality/unmaintained.
    " Plug 'tpope/vim-markdown'        " Included in vim.
    " Plug 'tpope/vim-pathogen'        " Alternative (plugin manager).
    " Plug 'tpope/vim-rake'            " Unneeded functionality.
    " Plug 'tpope/vim-rails'           " Unneeded, 'Rails' language specific.
    " Plug 'tpope/vim-rsi'             " Unneeded functionality.
    " Plug 'tpope/vim-rvm'             " Unneeded, 'RCM' program specific.
    " Plug 'tpope/vim-salve'           " Unneeded, 'Leiningen'/'Boot' program specific.
    " Plug 'tpope/vim-scriptease'      " Unneeded functionality.
    " Plug 'tpope/vim-vividchalk'      " Alternative (colorscheme).
    " Plug 'vim-airline/vim-airline'   " Alternative (status line).
    " Plug 'w0rp/ale'                  " Alternative (completion, diagnostic).
