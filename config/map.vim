if has("nvim")
  command! W w! !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again" else
  command! W w! !sudo tee % > /dev/null
end

cmap p!  PlugInstall <CR>
nmap S  :source % <CR>
nmap \  :%s//g<Left><Left>
vmap \  :s//g<Left><Left>

" nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
nmap s  ys
vmap s  S
nmap <leader>' %
" remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

imap <C-n> <Esc>ui
imap <C-p> <Esc><C-r>i
nmap <C-e> <C-u>
nmap <C-y> "0p
vmap <C-y> "0p
nmap Y y$
nmap yu y0
nmap du d0
nmap E v$h
nmap B vb
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nmap <Leader>w :w<CR>
nmap <Leader>p "0p

nmap <Leader><Leader> <esc>ysiw
imap <Leader><Leader> <esc>ysiw

tnoremap <A-[> <C-\><C-n>

nmap <space> `
" nnoremap ' "
nnoremap Q q
nmap q :q <CR>

"关闭高亮
nmap <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>

" git
nnoremap <Leader>gg :Lazygit<CR>
nnoremap <Leader>gd :Lazydocker<CR>

"align
xmap <Leader>ia <Plug>(EasyAlign)
nmap <Leader>ia <Plug>(EasyAlign)

"asyncrun
" Run the current line
nmap <leader>ie :execute getline(line('.'))<cr>
" Run the current line in sh
" nmap <leader>el :execute '!'.getline('.')<cr>
" nmap <Leader>ii :.!
nmap <Leader>io :AsyncRun! -mode=term 
" Run the current line in terminal
nmap <leader>il :execute 'AsyncRun! -mode=term '.getline('.')<cr>
