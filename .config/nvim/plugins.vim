" Set the current script encoding.
scriptencoding utf-8

" Auto-install vim-plug (for neovim).
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        autocmd VimEnter * PlugInstall --sync
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" vim-plug plugins
call plug#begin('~/.config/nvim/plugged')
" Plugins
    Plug 'airblade/vim-gitgutter'                                             " Show git diff in gutter (git diff indicator).
    Plug 'chaoren/vim-wordmotion'                                             " Improved word motions.
    Plug 'chriskempson/base16-vim'                                            " Base16 colorscheme collection (colorscheme).
    Plug 'cohama/lexima.vim'                                                  " Autocomplete bracket pairs (pair completion).
    Plug 'dhruvasagar/vim-table-mode'                                         " Automatic table creation and formatter.
    Plug 'godlygeek/tabular'                                                  " Tubularize via pattern function.
    Plug 'guns/vim-sexp'                                                      " S-expression support.
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " Live markdown preview.
    Plug 'itchyny/lightline.vim'                                              " Lightweight status line (status line).
    Plug 'junegunn/rainbow_parentheses.vim'                                   " Rainbow matching bracket highlighting.
    Plug 'mattn/emmet-vim'                                                    " HTML, CSS, JS snippets.
    Plug 'mhinz/vim-startify'                                                 " Editor start page.
    Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install() }}   " Intellisense engine for vim. (language client, completion, diagnostic).
"    Plug 'neomake/neomake'                                                    " Asynchronous lint and make (lint ,make)
    Plug 'scrooloose/nerdtree'                                                " Project Draw (project draw)
    Plug 'shougo/denite.nvim'                                                 " More generic fuzzy finder.
"    Plug 'terryma/vim-multiple-cursors'                                       " Multiple cursors
    Plug 'tmux-plugins/vim-tmux-focus-events'                                 " Make vim and tmux work well together, effects 'FocusGained' and 'FocusLost' events.
    Plug 'tommcdo/vim-exchange'                                               " Swap text regions with 'cx'.
    Plug 'tpope/vim-abolish'                                                  " :Abolish, :Subvert, Coercion 'cr' special functionality.
    Plug 'tpope/vim-apathy'                                                   " Set path for misc file types.
    Plug 'tpope/vim-characterize'                                             " 'ga' character information.
    Plug 'tpope/vim-commentary'                                               " 'gc' commenting (commenting).
    Plug 'tpope/vim-dadbod'                                                   " Database interface.
    Plug 'tpope/vim-dotenv'                                                   " Load .env.
    Plug 'tpope/vim-endwise'                                                  " End certian structures automatically.
    Plug 'tpope/vim-eunuch'                                                   " Helpers for unix.
    Plug 'tpope/vim-fugitive'                                                 " Git interface.
    Plug 'tpope/vim-jdaddy'                                                   " JSON text objects.
    Plug 'tpope/vim-obsession'                                                " Vim session mangement.
    Plug 'tpope/vim-ragtag'                                                   " Ghetto html/xml mappings.
    Plug 'tpope/vim-repeat'                                                   " Repeat that which default repeat can not.
    Plug 'tpope/vim-rhubarb'                                                  " Github functionality for fugitive.vim.
    Plug 'tpope/vim-projectionist'                                            " Project configured 'Projections'.
    Plug 'tpope/vim-sensible'                                                 " Sensible defaults.
    Plug 'tpope/vim-sexp-mappings-for-regular-people'                         " Better mappings for sexp.vim.
    Plug 'tpope/vim-speeddating'                                              " Date manipulation with <C-a> and <Ctrl-x>.
    Plug 'tpope/vim-surround'                                                 " Surround text object.
    Plug 'tpope/vim-tbone'                                                    " Tmux functionality for vim.
    Plug 'tpope/vim-unimpaired'                                               " Useful backet mappings.
    Plug 'tpope/vim-vinegar'                                                  " Fast file access with improved netrw.
"Order Important Plugins
    Plug 'sheerun/vim-polyglot'                                               " Support for many languages.
    Plug 'tpope/vim-sleuth'                                                   " Set indentation based off simular files.
    Plug 'editorconfig/editorconfig-vim'                                      " Set settings based off editor config project file.
call plug#end()
