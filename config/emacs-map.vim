" incert keymap like emacs
imap <C-h> <BS>
imap <C-d> <Del>
imap <C-w> <Esc>diwi
imap <C-k> <Esc>lDa
imap <C-u> <Esc>d0xi

" imap <C-j> <Down>
" imap <C-k> <Up>
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-a> <Home>
imap <C-e> <End>
imap <C-n> <Down>
imap <C-p> <Up>
imap <C-y> <Esc>ui
imap <C-_> <Esc>xi
imap <C-o> <Esc>o
imap <C-s> <esc>:w<CR>
imap <C-q> <esc>:wq<CR>

imap <A-f> <Esc>wa
imap <A-b> <Esc>bi

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

