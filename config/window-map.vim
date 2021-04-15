" window
nnoremap <C-p> <Tab>
nmap <C-h> :wincmd h <cr>
nmap <C-j> :wincmd j <cr>
nmap <C-k> :wincmd k <cr>
nmap <C-l> :wincmd l <cr>
nmap <Tab> :wincmd w <cr>

" nmap <C-w>o :only <cr>
" nmap <C-w>q <C-w>c
" nmap <C-w>x <C-w>c
" nmap <C-w>h :vsplit <cr>
" nmap <C-w>k :split <cr>
" nmap <C-w>l :belowright vsplit <cr>
" nmap <C-w>j :belo split <cr>
" nmap <C-w>s :Goyo <cr>

nmap <Leader>sw :only <cr>
nmap <Leader>so :only <cr>
nmap <Leader>sh :vsplit <cr>
nmap <Leader>sk :split <cr>
nmap <Leader>sl :belowright vsplit <cr>
nmap <Leader>sj :belo split <cr>
nmap <Leader>ss :Goyo <cr>

" animate 窗口移动动画
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

