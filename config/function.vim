function! OpenAnimatedHtop() abort
  " Open a htop in terminal
  new term://htop
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.66)
endfunction
command! Htop call OpenAnimatedHtop()

function! OpenAnimatedglances() abort
  " Open a glances in terminal
  new term://glances
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.86)
endfunction

command! Glances call OpenAnimatedglances()
