"undo tree 历史修改树
nnoremap <Leader>tu :MundoToggle <CR>

" vim-which-key 按键提示
" nnoremap <silent> <leader> :WhichKey ','<CR>

" translator 翻译
" let g:translator_history_enable = 1
let g:translator_default_engines = get(g:, 'translator_default_engines', ['google'])
" let g:translator_proxy_url = ''
let g:translator_window_type = 'popup'

nmap <C-q> :Translate 
nmap <silent> <Leader>te <Plug>Translate
vmap <silent> <Leader>te <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <Leader>tx <Plug>TranslateX

"floaterm
hi FloatermNF guibg=#282828
hi FloatermBorderNF guibg=#282828 guifg=#504945
command! Ranger FloatermNew ranger
command! Broot FloatermNew broot -sdpw
command! Lazygit FloatermNew lazygit
command! Lazydocker FloatermNew lazydocker
command! Ptpython FloatermNew ptpython
let g:floaterm_height = 0.9
let g:floaterm_width = 0.9
let g:floaterm_wintype = 'normal'
" autocmd FileType floaterm wincmd H
let g:floaterm_autoclose = 2
let g:floaterm_position = 'center'
" 取消边框
let g:floaterm_borderchars = '        '
let g:floaterm_title = ''

nmap <Leader>tp :Ptpython<CR>
nmap <Leader>tg :terminal mytop.sh<CR>
nmap <Leader>fr :Ranger<CR>
