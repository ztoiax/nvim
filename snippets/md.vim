"""""" all """"""
" inoremap
autocmd Filetype * inoremap <buffer> ,, <Esc>/<++><CR>:nohlsearch<CR>"_c4l

"""""" py """"""
" autocmd Filetype python noremap ,xb ofrom ipdb import set_trace<enter>set_trace()<esc>
autocmd Filetype python noremap ,xl osetup_logging(debug=True, logfile='/tmp/debug')<esc>
autocmd Filetype python noremap ,xp oLOG.debug(f"variable: '{}'")<esc>blp

autocmd Filetype python vnoremap ,xt <esc>`>a<enter>end = time()<enter>print('%.12f秒' % (end - start))<esc>`<ifrom time import time<enter>start = time()<enter><esc>

"""""" markdown """"""
" vnoremap
" autocmd vnoremap ,s <esc>`>a<enter>}<esc>`<iif (true)<enter>{<enter><esc>
"
" autocmd Filetype markdown vnoremap <buffer> ,d "zdi`<c-r>z`<esc>
autocmd Filetype markdown vnoremap ,d <esc>`>a`<esc>`<i`<esc>
autocmd Filetype markdown vnoremap ,c <esc>`>a<enter>```<esc>`<i```<enter><esc>kA
autocmd Filetype markdown vnoremap ,i <esc>`>a*<esc>`<i*<esc>
autocmd Filetype markdown vnoremap ,b <esc>`>a**<esc>`<i**<esc>
autocmd Filetype markdown vnoremap ,<space> <esc>`>a<space><esc>`<i<space><esc>
autocmd Filetype markdown vnoremap ,a <esc>`>a]()<esc>`<i[<esc>$F(a
autocmd Filetype markdown vnoremap ,k <esc>`>a</kbd><esc>`<i<kbd><esc>
