if has("nvim")
  command! W w! !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again" else
  command! W w! !sudo tee % > /dev/null
end

cmap pp  PlugInstall <CR>
nmap S  :source ~/.config/nvim/init.vim <CR>
nmap \  :%s//g<Left><Left>
vmap \  :s//g<Left><Left>
nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
nmap s  ys
vmap s  S
" remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nmap Y y$
nmap yu y0
nmap E v$h
nmap B vb
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
nnoremap <Leader>k <C-i>
nmap <Leader>j <C-o>
nmap <Leader>w :w<CR>

nmap <Leader><Leader> <esc>ysiw
imap <Leader><Leader> <esc>ysiw
" Run the current line
nnoremap <leader>ee :execute getline(line('.'))<cr>
" Run the current line in sh
nnoremap <leader>el :execute '!'.getline('.')<cr>

" tags
" noremap <F5> :!ctags -R .

" window
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
nmap <Tab> :wincmd w <cr>

nmap <C-w>o :only <cr>
nmap <C-w>q <C-w>c
nmap <C-w>x <C-w>c
nmap <C-w>h :vsplit <cr>
nmap <C-w>k :split <cr>
nmap <C-w>l :belowright vsplit <cr>
nmap <C-w>j :belo split <cr>
nmap <C-w>s :Goyo <cr>

" nmap <Leader>sw :only <cr>
" nmap <Leader>so :only <cr>
" nmap <Leader>sh :vsplit <cr>
" nmap <Leader>sk :split <cr>
" nmap <Leader>sl :belowright vsplit <cr>
" nmap <Leader>sj :belo split <cr>
" nmap <Leader>sx <C-w>c
" nmap <Leader>ss :Goyo <cr>

"animate
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(-10)<CR>

" incert keymap like emacs
imap <C-h> <BS>
imap <C-d> <Del>
imap <C-w> <C-[>diwa
imap <C-k> <Esc>lDa
imap <C-u> <Esc>d0xi
imap <C-y> <Esc>Pa

imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-z> <ESC>ua
imap <C-o> <Esc>o
imap <C-s> <esc>:w<CR>
imap <C-q> <esc>:wq<CR>
imap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

imap <leader>j <Esc>wa
imap <leader>k <Esc>bi

" command keymap like emacs
cmap <C-p> <Up>
cmap <C-k> <Up>
cmap <C-n> <Down>
cmap <C-j> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cmap <C-d> <Del>
cmap <C-h> <BS>
cmap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

tnoremap <A-[> <C-\><C-n>

nmap <space> `
nnoremap ' "
nnoremap Q q
nmap q :q <CR>

"关闭高亮
nmap <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>

nnoremap <Leader>th :Htop<CR>
nnoremap <Leader>tg :Glances<CR>
nnoremap <Leader>tp :Ipython<CR>

" git
nnoremap <Leader>gg :Lazygit<CR>
nnoremap <Leader>gl :GV <CR>

"undo tree
nnoremap <Leader>tu :MundoToggle <CR>
"align
xmap <Leader>ia <Plug>(EasyAlign)
nmap <Leader>ia <Plug>(EasyAlign)

" vim-easymotion
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <Leader>f2 <Plug>(easymotion-overwin-f2)
nmap <Leader>ff <Plug>(easymotion-overwin-line)
nmap <Leader>fw <Plug>(easymotion-overwin-w)
nmap <Leader>fr :Ranger<CR>
" vim-bookmarks
" nmap mm <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mj <Plug>BookmarkNext
" nmap mk <Plug>BookmarkPrev
" nmap mc <Plug>BookmarkClear
" nmap mC <Plug>BookmarkClearAll

" edgemotion
nmap <space>j <Plug>(edgemotion-j)
nmap <space>k <Plug>(edgemotion-k)

" vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=800

" clever-f
map ; <Plug>(clever-f-repeat-forward)
map ' <Plug>(clever-f-repeat-back)
" vista
nnoremap tt :Vista!!<cr>
nnoremap T :Vista!!<cr>
"
" Echo translation in the cmdline
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

" vim-visual-multi
let g:VM_maps = {}
let g:VM_leader = ','
let g:VM_maps['Motion ,'] = ',,'
let g:VM_maps["Switch Mode"]                 = '<Tab>'
let g:VM_maps["Find Next"]                   = ']'
let g:VM_maps["Find Prev"]                   = '['
let g:VM_maps["Goto Next"]                   = '}'
let g:VM_maps["Goto Prev"]                   = '{'
let g:VM_maps["Seek Next"]                   = '<C-f>'
let g:VM_maps["Seek Prev"]                   = '<C-b>'
let g:VM_maps["Skip Region"]                 = 'n'
let g:VM_maps["Remove Region"]               = 'q'
let g:VM_maps["Invert Direction"]            = 'o'
let g:VM_maps["Find Operator"]               = "m"
let g:VM_maps["Surround"]                    = 's'
let g:VM_maps["Replace Pattern"]             = 'r'
