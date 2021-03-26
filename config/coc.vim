" from thinkvim
let g:coc_snippet_next = '<C-j>'
let g:coc_snippet_prev = '<C-k>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'
filetype

let g:coc_global_extensions =[
    \ 'coc-json',
    \ 'coc-vimlsp',
    \ 'coc-snippets',
    \ 'coc-emmet',
    \ 'coc-pairs',
    \ 'coc-highlight',
    \ 'coc-marketplace',
    \ 'coc-git',
    \ 'coc-lists',
    \ 'coc-gitignore',
    \ 'coc-yank',
    \ 'coc-actions',
    \ 'coc-spell-checker',
    \ 'coc-pyright',
    \ 'coc-clangd',
    \]
augroup MyAutoCmd
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

"Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <C-j>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><C-k> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>sn  <Plug>(coc-codeaction-selected)
nmap <leader>sn <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <Leader>cc :CocCommand 
" 文件浏览器
" nnoremap <Leader>fe :CocCommand explorer<CR>

inoremap <silent><expr> <leader>l coc#refresh()

"coc-spell-checker
vmap <leader>cs <Plug>(coc-codeaction-selected)
nnoremap <leader>cs <Plug>(coc-codeaction-selected)

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gk <Plug>(coc-diagnostic-prev)
nmap <silent> gj <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"coc-yank
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
"coc-translator
" popup
" nnoremap <Leader>tr <Plug>(coc-translator-p)
" vmap <Leader>tr <Plug>(coc-translator-pv)
" echo
" nnoremap <Leader>ee <Plug>(coc-translator-e)
" vmap <Leader>ee <Plug>(coc-translator-ev)
" replace
" nnoremap <Leader>rr <Plug>(coc-translator-r)
" vmap <Leader>rr <Plug>(coc-translator-rv)

"coc-git
" set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

nnoremap <silent> <leader>y  :<C-u>CocList -A yank<cr>

