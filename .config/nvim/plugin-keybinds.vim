" Set the current script encoding.
scriptencoding utf-8

" ==============================================================================
" scrooloose/nerdtree
" ==============================================================================

nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <leader>nf :NERDTreeFind<CR>


" ==============================================================================
" iamcco/markdown-preview.nvim
" ==============================================================================

nmap <leader>mp <Plug>MarkdownPreview
nmap <leader>ms <Plug>MarkdownPreviewStop
nmap <leader>mt <Plug>MarkdownPreviewToggle


" ==============================================================================
" shougo/denite
" ==============================================================================

" Denite command keybinds.
" Search current directory files.
nnoremap <silent>       <C-p>               :<C-u>Denite file/rec -start-filter<CR>
" Browse buffers.
nnoremap <silent>       <leader>db          :<C-u>Denite buffer<CR>
" Search current directory for word under cursor.
nnoremap <silent>       <leader>d8          :<C-u>DeniteCursorWord grep:.<CR>
" Search current directory for line pattern.
nnoremap <silent>       <leader>dg          :<C-u>Denite grep:.<CR>
" Search buffer directory for line pattern.
nnoremap <silent>       <leader>d/          :<C-u>DeniteBufferDir grep:.<CR>
" Search buffer directory for files.
nnoremap <silent>       <leader>dd          :<C-u>DeniteBufferDir file/rec -start-filter<CR>
" Browse register content
nnoremap <silent>       <leader>d"          :<C-u>Denite register<CR>
" Browse :changes
nnoremap <silent>       <leader>d;          :<C-u>Denite change<CR>
" Browse commands
nnoremap <silent>       <leader>dc          :<C-u>Denite command<CR>
" Browse command history
nnoremap <silent>       <leader>d:          :<C-u>Denite command_history<CR>
" Browse help
nnoremap <silent>       <leader>dh          :<C-u>Denite help<CR>
" Browse lines
nnoremap <silent>       <leader>dl          :<C-u>Denite line<CR>
" Browse :marks
nnoremap <silent>       <leader>dm          :<C-u>Denite mark<CR>
" Browse custom menus
nnoremap <silent>       <leader>du          :<C-u>Denite menu<CR>
" Browse sources
nnoremap <silent>       <leader>ds          :<C-u>Denite source<CR>
" Resume.
nnoremap <silent>       <leader>dr          :<C-u>Denite -resume<CR> 
" Resume and refresh.
nnoremap <silent>       <leader>dt          :<C-u>Denite -resume -refresh<CR> 
" Open next position.
nnoremap <silent>       <leader>dn          :<C-u>Denite -resume -cursor-pos=+1 -immediately<CR>
" Open prev position.
nnoremap <silent>       <leader>dp          :<C-u>Denite -resume -cursor-pos=-1 -immediately<CR>
"" Browse :jump
"nnoremap <silent>       <leader>dj          :<C-u>Denite jump<CR>
"" References source from LanguageClient.
"nnoremap <silent>       <leader>lr          :<C-u>Denite references<CR>

" Search for line patterns without respecting .gitignore
nnoremap <silent>       <leader>dx          :<C-u>DeniteProjectDir grep/noignore:.<CR>

" Search for file without respecting .gitignore
nnoremap <silent>       <leader>di          :<C-u>Denite file_rec/noignore -start-filter<CR>

" Denite window keybinds
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    " Open.
    nnoremap <silent><buffer><expr>     <CR>        denite#do_map('do_action')
    " Delete Buffer.
    nnoremap <silent><buffer><expr>     d           denite#do_map('do_action', 'delete')
    " Preview.
    nnoremap <silent><buffer><expr>     p           denite#do_map('do_action', 'preview')
    " Quit.
    nnoremap <silent><buffer><expr>     q           denite#do_map('quit')
    " Filter.
    nnoremap <silent><buffer><expr>     i           denite#do_map('open_filter_buffer')
    " Select.
    nnoremap <silent><buffer><expr>     <Space>     denite#do_map('toggle_select').'j'
    " Open in new tab.
    nnoremap <silent><buffer><expr>     t           denite#do_map('do_action', 'tabopen')
    " Open in vertical split.
    nnoremap <silent><buffer><expr>     v           denite#do_map('do_action', 'vsplit')
    " open in horizontal split.
    nnoremap <silent><buffer><expr>     h           denite#do_map('do_action', 'split')
    " Dont jump via jumplist.
    nnoremap <silent><buffer><expr>     <C-o>       denite#do_map('nop')
endfunction

" Denite filter window keybinds.
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort

    """ Filter Insert mode.
    " Close filter.
    imap <silent><buffer>               <C-o>       <Plug>(denite_filter_update)
    " Close denite.
    inoremap <silent><buffer><expr>     <C-c>       denite#do_map('quit')
    " Open.
    inoremap <silent><buffer><expr>     <CR>        denite#do_map('do_action')
    " Open in new tab.
    inoremap <silent><buffer><expr>     <C-t>       denite#do_map('do_action', 'tabopen')
    " Open in vertical split.
    inoremap <silent><buffer><expr>     <C-v>       denite#do_map('do_action', 'vsplit')
    " Open in horizontal split.
    inoremap <silent><buffer><expr>     <C-h>       denite#do_map('do_action', 'split')
    " Move to next line.
    inoremap <silent><buffer>           <C-j>       <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    inoremap <silent><buffer>           <C-n>       <Esc><C-w>p:call cursor(line('.')+1,0)<CR><C-w>pA
    " Move to prev line.
    inoremap <silent><buffer>           <C-k>       <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA
    inoremap <silent><buffer>           <C-p>       <Esc><C-w>p:call cursor(line('.')-1,0)<CR><C-w>pA

    """ Filter normal mode.
    " Open in new tab.
    nnoremap <silent><buffer><expr>     t           denite#do_map('do_action', 'tabopen')
    " Open in vertical split.
    nnoremap <silent><buffer><expr>     v           denite#do_map('do_action', 'vsplit')
    " open in horizontal split.
    nnoremap <silent><buffer><expr>     h           denite#do_map('do_action', 'split')
endfunction


" ==============================================================================
" neoclide/coc.nvim
" ==============================================================================
nmap <silent>       <leader>cd      <Plug>(coc-definition)
nmap <silent>       <leader>cr      <Plug>(coc-references)
nmap <silent>       <leader>cj      <Plug>(coc-implementation)

" Use <TAB> to trigger completion and move to next complete item.
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr>     <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
" Use <S-TAB> to trigger completion and move to prev complete item.
inoremap <silent><expr>     <S-TAB>
            \ pumvisible() ? "\<C-p>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()


" ==============================================================================
" mattn/emmet.vim
" ==============================================================================

let g:user_emmet_leader_key = '<C-e>'
imap <C-e>e <plug>(emmet-expand-abbr)
imap <C-e><C-e> <plug>(emmet-expand-abbr)
imap <C-e>l <plug>(emmet-expand-abbr)


" ==============================================================================
" junegunn/rainbow_parentheses.vim
" ==============================================================================

nnoremap <leader>tp :RainbowParentheses!!<CR>
