" Set the current script encoding.
scriptencoding utf-8            

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
nmap <leader>ww :w<CR>
nmap <leader>wq :wq<CR>

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

" Split navigation
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
