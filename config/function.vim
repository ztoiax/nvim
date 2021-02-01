" vim-fcitx
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   " if s:input_status != 2 && g:input_toggle == 1
   if s:input_status == 2
      " let l:a = system("fcitx5-remote -o")
      let l:a = system("fcitx5-remote -c")
      let g:input_toggle = 0
   endif
endfunction

"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()


" function! OpenAnimatedmytop() abort
"   " Open a mytop in terminal
"   " new term://mytop.sh
"   FloatermNew mytop.sh
"   " Send window to bottom and start with small height
"   wincmd J | resize 1
"   " Animate height to 66%
"   call animate#window_percent_height(1)
" endfunction

" command! Mytop call OpenAnimatedmytop()
