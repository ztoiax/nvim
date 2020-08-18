"coc
nnoremap <Leader>cc :CocCommand 
nnoremap <Leader>fe :CocCommand explorer<CR>
"coc-spell-checker
vmap <leader>cs <Plug>(coc-codeaction-selected)
nnoremap <leader>cs <Plug>(coc-codeaction-selected)

"coc-translator
" popup
nnoremap <Leader>tr <Plug>(coc-translator-p)
vmap <Leader>tr <Plug>(coc-translator-pv)
" echo
nnoremap <Leader>er <Plug>(coc-translator-e)
vmap <Leader>er <Plug>(coc-translator-ev)
" replace
" nnoremap <Leader>rr <Plug>(coc-translator-r)
" vmap <Leader>rr <Plug>(coc-translator-rv)

"coc-git
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
