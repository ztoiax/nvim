"fzf
nmap <Leader>fh :History <CR>
nmap <Leader>ff :Files  <CR>
nmap <Leader>a  :Ag <CR>
nmap <Leader>fc :Colors<CR>
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
nmap <Leader>fb :<C-U><C-R>=printf("Leaderf --regexMode buffer %s", "")<CR><CR>
nmap <Leader>fm :<C-U><C-R>=printf("Leaderf --regexMode mru %s", "")<CR><CR>
nmap <Leader>ft :<C-U><C-R>=printf("Leaderf --regexMode bufTag %s", "")<CR><CR>
nmap <Leader>f/ :<C-U><C-R>=printf("Leaderf --regexMode line %s", "")<CR><CR>
nmap <F2> :LeaderfFunction<cr>
"normal mode
" noremap <F2> :LeaderfFunction!<cr>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", Leaderf#Rg#visual())<CR>
nmap  go :<C-U>Leaderf! ag --recall<CR>

let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
nmap <Leader>fe :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
nmap <Leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nmap <Leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
nmap <Leader>fn :<C-U><C-R>=printf("Leaderf  gtags --next %s", "")<CR><CR>
nmap <Leader>fp :<C-U><C-R>=printf("Leaderf  gtags --previous %s", "")<CR><CR>
" unmap <Leader>f
