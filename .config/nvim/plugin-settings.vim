" vim-gitgutter settings
" permanent sign column
"if exists('&signcolumn')  " Vim 7.4.2201
"  set signcolumn=yes
"else
"  let g:gitgutter_sign_column_always = 1
"endif

" Neomake Settings
"if exists('*neomake#configure#automake')
"  call neomake#configure#automake('nrwi', 500)
"endif

" ==============================================================================
" iamcco/markdown-preview.nvim
" ==============================================================================

let g:mkdp_auto_start = 1      " Automatically open preview for markdown files.
let g:mkdp_auto_close = 1      " Automatically close preview when moving away from buffer.
let g:mkdp_refresh_slow = 0    " Refresh on all changes.
let g:mkdp_browser = 'firefox' " Use firefox for preview.


" ==============================================================================
" neoclide/coc.nvim
" ==============================================================================

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" ==============================================================================
" shougo.denite
" ==============================================================================
try
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
" --files: Print each file that would be searched (but don't search)
" --glob:  Include or exclues files for searching that match the given glob
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'auto_resize': 1,
\ 'prompt': 'λ:',
\ 'direction': 'rightbelow',
\ 'winminheight': '10',
\ 'highlight_mode_insert': 'Visual',
\ 'highlight_mode_normal': 'Visual',
\ 'prompt_highlight': 'Function',
\ 'highlight_matched_char': 'Function',
\ 'highlight_matched_range': 'Normal'
\ }}


" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Error with Denite settings. Try :PlugInstall'
endtry
