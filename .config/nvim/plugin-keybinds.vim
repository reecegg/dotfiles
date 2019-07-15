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

" Browse files in current directory.
nnoremap <silent> <C-p> :<C-u>Denite file/rec -winrow=1 -start-filter<CR>
" Browse open buffers.
nnoremap <silent> <leader>s :Denite buffer -winrow=1 <CR>
" Search current directory for word under cursor.
nnoremap <silent> <leader>8 :<C-u>DeniteCursorWord grep:. -winrow=1<CR>
" Search current directory for term and close window if no results.
nnoremap <silent> <leader>g :<C-u>Denite grep:.<CR>
" TODO
nnoremap <silent> <leader><Space>/ :<C-u>DeniteBufferDir grep:.<CR>
" TODO
nnoremap <silent> <leader>d :<C-u>DeniteBufferDir file/rec -start-filter<CR>
" TODO
nnoremap <silent> <leader>r :<C-u>Denite -resume -cursor-pos=+1<CR>
" TODO
nnoremap <silent> <leader><C-r> :<C-u>Denite register:.<CR>
" References source from LanguageClient.
nnoremap <silent> <leader>lr :<C-u>Denite references<CR>

" Denite window keybinds
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  " Open.
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  " Delete Buffer.
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  " Preview.
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  " Quit.
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  " Filter.
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  " Select.
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
  " Open in new tab.
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  " Open in vertical split.
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  " open in horizontal split.
  nnoremap <silent><buffer><expr> h
  \ denite#do_map('do_action', 'split')
endfunction

" Denite filter window keybinds.
autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
  " Close filter from insert mode.
  imap <silent><buffer> <C-c>
  \ <Plug>(denite_filter_quit)
  " Open selected on confirm filter.
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  " Open in new tab.
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  " Open in vertical split.
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  " open in horizontal split.
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
  " Open in new tab.
  nnoremap <silent><buffer><expr> t
  \ denite#do_map('do_action', 'tabopen')
  " Open in vertical split.
  nnoremap <silent><buffer><expr> v
  \ denite#do_map('do_action', 'vsplit')
  " open in horizontal split.
  nnoremap <silent><buffer><expr> h
  \ denite#do_map('do_action', 'split')
endfunction


" ==============================================================================
" neoclide/coc.nvim
" ==============================================================================
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" Use <tab> to trigger completion and move to next complete item.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
