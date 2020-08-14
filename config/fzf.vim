"fzf
noremap  <Leader>fh :History <CR>
noremap  <Leader>ff :Files  <CR>
" noremap  <Leader>f<Space> :Marks  <CR>
" let g:fzf_layout = {
"  \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
"  \ }

command! -bang -complete=dir -nargs=* LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))
"LeaderF
let $GTAGSLABEL = 'native-pygments'
let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
noremap <Leader>fb :<C-U><C-R>=printf("Leaderf --regexMode buffer %s", "")<CR><CR>
noremap <Leader>fm :<C-U><C-R>=printf("Leaderf --regexMode mru %s", "")<CR><CR>
noremap <Leader>ft :<C-U><C-R>=printf("Leaderf --regexMode bufTag %s", "")<CR><CR>
noremap <Leader>f/ :<C-U><C-R>=printf("Leaderf --regexMode line %s", "")<CR><CR>
noremap <F2> :LeaderfFunction<cr>
"normal mode
" noremap <F2> :LeaderfFunction!<cr>

" search visually selected text literally
noremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", Leaderf#Rg#visual())<CR>
noremap  go :<C-U>Leaderf! ag --recall<CR>

let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <Leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <Leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <Leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <Leader>fn :<C-U><C-R>=printf("Leaderf  gtags --next %s", "")<CR><CR>
noremap <Leader>fp :<C-U><C-R>=printf("Leaderf  gtags --previous %s", "")<CR><CR>
unmap <Leader>f
