" 标签
" nmap <leader>1 <Plug>BuffetSwitch(1)
" nmap <leader>2 <Plug>BuffetSwitch(2)
" nmap <leader>3 <Plug>BuffetSwitch(3)
" nmap <leader>4 <Plug>BuffetSwitch(4)
" nmap <leader>5 <Plug>BuffetSwitch(5)
" nmap <leader>6 <Plug>BuffetSwitch(6)
" nmap <leader>7 <Plug>BuffetSwitch(7)
" nmap <leader>8 <Plug>BuffetSwitch(8)
" nmap <leader>9 <Plug>BuffetSwitch(9)
" nmap <leader>0 <Plug>BuffetSwitch(10)

nmap <a-1> <Plug>BuffetSwitch(1)
nmap <a-2> <Plug>BuffetSwitch(2)
nmap <a-3> <Plug>BuffetSwitch(3)
nmap <a-4> <Plug>BuffetSwitch(4)
nmap <a-5> <Plug>BuffetSwitch(5)
nmap <a-6> <Plug>BuffetSwitch(6)
nmap <a-7> <Plug>BuffetSwitch(7)
nmap <a-8> <Plug>BuffetSwitch(8)
nmap <a-9> <Plug>BuffetSwitch(9)
nmap <a-0> <Plug>BuffetSwitch(10)

nnoremap <silent> L :bn<CR>
nnoremap <silent> H :bp<CR>
nnoremap <silent> <Leader>o  :Bonly<CR>
nnoremap <silent> <Leader>x  :Bw<CR>
nnoremap <silent> <Leader>n  :bn<CR>
nnoremap <silent> <Leader>p  :bp<CR>
nnoremap <silent> <Leader>tt :tabnew<CR>*
nnoremap <silent> <C-w>      :Bw<CR>
nnoremap <silent> <C-t>      :tabnew<CR>*

let g:buffet_use_devicons = 1
" let g:buffet_show_index   = 1
let g:buffet_always_show_tabline = 0
let g:buffet_tab_icon = "\uf00a"
" let g:buffet_left_trunc_icon = "\uf0a8"
" let g:buffet_right_trunc_icon = "\uf0a9"
"colors
function! g:BuffetSetCustomColors()
    hi! BuffetCurrentBuffer cterm=NONE ctermbg=106 ctermfg=8 guibg=#b8bb26 guifg=#000000
    hi! BuffetTrunc cterm=bold ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetBuffer cterm=NONE ctermbg=239 ctermfg=8 guibg=#504945 guifg=#000000
    hi! BuffetTab cterm=NONE ctermbg=66 ctermfg=8 guibg=#458588 guifg=#000000
    hi! BuffetActiveBuffer cterm=NONE ctermbg=10 ctermfg=239 guibg=#999999 guifg=#504945
endfunction
