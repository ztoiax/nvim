function! OpenAnimatedmytop() abort
  " Open a mytop in terminal
  " new term://mytop.sh
  FloatermNew mytop.sh
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(1)
endfunction

command! Mytop call OpenAnimatedmytop()
