" Set the current script encoding.
scriptencoding utf-8

" keybinds {{{
let mapleader=" "               " Make <space> the leader key.

" Better esc with 'jj'
inoremap jk <esc>
"inoremap kj <esc>              " Disabled because k is commonly cut off the end of words when leaving insert mode.
inoremap jj <esc>
inoremap kk <esc>

" Better write/quit/Exit
nmap <leader>q :q<CR>
nmap <leader>qq :q<CR>
nmap <leader>qa :qa<CR>
nmap <leader>x :x<CR>
nmap <leader>ww :w<CR>
nmap <leader>wq :wq<CR>
nmap <leader>wa :wal<CR>

" Move up/down viusal lines by default
nnoremap j gj
nnoremap k gk

" Buffers
"nnoremap <tab> :bn<CR>
"nnoremap <s-tab> :bp<CR>
"nnoremap <leader>bd :bd<CR>

" Move though grep results
nnoremap <leader> <right> :cnext<CR>
nnoremap <leader> <left> :cprev<CR>

" Split navigation using single key combination.
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Toggles 
nnoremap <leader>t<space> :set invlist<CR>
nnoremap <leader>tn :set invnumber<CR>
nnoremap <leader>tr :set invrelativenumber<CR>

" Config
nmap <leader>mme :e ~/.config/nvim/init.vim<CR>
nmap <leader>mmr :so ~/.config/nvim/init.vim<CR>

" Syntax
nnoremap <leader>mms :syntax sync fromstart<CR>

" Working Directory
nmap <silent> <leader>cwd :cd %:p:h <bar> :echo "Changed global working directory"<CR>
nmap <silent> <leader>cwdt :tcd %:p:h <bar> :echo "Changed tab working directory"<CR>
nmap <silent> <leader>cwdw :lcd %:p:h <bar> :echo "Changed window working directory"<CR>
nmap <silent> <leader>cwdp :pwd<CR>

" Makes <C-BS> delete word
:imap <C-BS> <C-W>
