"""""" all """"""
" inoremap
autocmd Filetype * inoremap <buffer> ,, <Esc>/<++><CR>:nohlsearch<CR>"_c4l
autocmd Filetype * inoremap <buffer> ,# #####  ######<enter><++><esc>kf<space>a

"""""" sh """"""
" vnoremap
autocmd Filetype sh vnoremap ,f <esc>`>a<enter>}<esc>`<ifunction (){<enter><esc>kf(i


"""""" markdown """"""
" inoremap
autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>"_c5l<CR>
autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>

" 斜体
autocmd Filetype markdown inoremap <buffer> ,i **<++><Esc>F*i
" 加粗
autocmd Filetype markdown inoremap <buffer> ,b ****<++><Esc>F*hi
" 划除
autocmd Filetype markdown inoremap <buffer> ,s ~~~~<++><Esc>F~hi
" 下划线
autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
" 代码片段
autocmd Filetype markdown inoremap <buffer> ,d <Space>`` <++><Esc>F`i
autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Esc>3kA
autocmd Filetype markdown inoremap <buffer> ,m - [ ]
autocmd Filetype markdown inoremap <buffer> ,p ![image]()<++><Esc>F)i
autocmd Filetype markdown inoremap <buffer> ,a [](<++>)<Esc>F[a
autocmd Filetype markdown inoremap <buffer> ,s <span id=""></span><Esc>F"i
" 标题
autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA

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
