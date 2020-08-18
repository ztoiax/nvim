source ~/.config/nvim/config/plugset.vim
source ~/.config/nvim/config/function.vim
source ~/.config/nvim/config/vim-buffet.vim
source ~/.config/nvim/config/fzf.vim              "fzf & LeaderF
source ~/.config/nvim/config/markdown-preview.vim
" source ~/.config/nvim/config/keysound.vim
source ~/.config/nvim/config/coc.vim                 "coc
source ~/.config/nvim/config/cocconfig.vim           "coc

" snippets
source  ~/.config/nvim/snippets/md.vim

if has("nvim")
  command! W w! !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again" else
  command! W w! !sudo tee % > /dev/null
end

cmap p!  PlugInstall <CR>
nmap S  :source % <CR>
nmap \  :%s//g<Left><Left>
vmap \  :s//g<Left><Left>
nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
" remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nmap Y y$
nmap E v$
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nmap <Leader>k <C-i>
nmap <Leader>j <C-o>
nmap <Leader>w :w<CR>

imap <Leader><Leader> <Esc>/<++><CR>:nohlsearch<CR>c4i
" Run the current line
nnoremap <leader>ee :execute getline(line('.'))<cr>
" Run the current line in sh
nnoremap <leader>el :execute '!'.getline('.')<cr>

" tags
" noremap <F5> :!ctags -R .

" window
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
nmap <Tab> :wincmd w <cr>
nmap <Leader>sm :only <cr>
nmap <Leader>sh :vsplit <cr>
nmap <Leader>sk :split <cr>
nmap <Leader>sl :belowright vsplit <cr>
nmap <Leader>sj :belo split <cr>
nmap <Leader>sq <C-w>c
nmap <Leader>sz :Goyo <cr>
"animate
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>

" incert keymap like emacs
imap <C-w> <C-[>diwa
imap <C-h> <BS>
imap <C-d> <Del>
" imap <C-k> <ESC>d$a imap <C-u> <C-G>u<C-U>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-z> <ESC>ua
imap <C-s> <esc>:w<CR>
imap <C-q> <esc>:wq<CR>

imap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

nmap <space> `
nmap Q q
nmap q :q <CR>

"关闭高亮
nmap <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>

nnoremap <Leader>tt :tabnew new<CR>
nnoremap <Leader>th :Htop<CR>
nnoremap <Leader>tb :Bashtop<CR>
nnoremap <Leader>tg :Lazygit<CR>
nnoremap <Leader>tp :Ipython<CR>
"git浏览器
nnoremap <Leader>tv :GV <CR>
"undo tree
nnoremap <Leader>tm :MundoToggle <CR>
"align
xmap <Leader>ia <Plug>(EasyAlign)
nmap <Leader>ia <Plug>(EasyAlign)

" vim-easymotion
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <Leader>f2 <Plug>(easymotion-overwin-f2)
nmap <Leader>0  <Plug>(easymotion-overwin-line)
nmap <Leader>fw  <Plug>(easymotion-overwin-w)
" vim-bookmarks
nmap mm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mj <Plug>BookmarkNext
nmap mk <Plug>BookmarkPrev
nmap mc <Plug>BookmarkClear
nmap mC <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
nmap <Leader>fr :Ranger<CR>
" edgemotion
nmap <space>j <Plug>(edgemotion-j)
nmap <space>k <Plug>(edgemotion-k)

" vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=800

