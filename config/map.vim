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
" remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

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
" nmap <Leader>k <C-i>
" nmap <Leader>j <C-o>
nmap <Leader>w :w<CR>

nmap <Leader><Leader> <esc>ysiw
imap <Leader><Leader> <esc>ysiw

" Run the current line
nnoremap <leader>ee :execute getline(line('.'))<cr>
" Run the current line in sh
" nnoremap <leader>el :execute '!'.getline('.')<cr>

" tags
" noremap <F5> :!ctags -R .

tnoremap <A-[> <C-\><C-n>

nmap <space> `
nnoremap ' "
nnoremap Q q
nmap q :q <CR>

"关闭高亮
nmap <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>

" git
nnoremap <Leader>gg :Lazygit<CR>
nnoremap <Leader>gd :Lazydocker<CR>
nnoremap <Leader>gm :Magit<CR>
nnoremap <Leader>gl :GV <CR>

"align
xmap <Leader>ia <Plug>(EasyAlign)
nmap <Leader>ia <Plug>(EasyAlign)

"asyncrun
nmap <Leader>ii :.!
nmap <Leader>io :AsyncRun! -mode=term 
" Run the current line in terminal
nmap <leader>il :execute 'AsyncRun! -mode=term '.getline('.')<cr>
