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
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
nmap <Leader>fb :<C-U><C-R>=printf("Leaderf --regexMode buffer %s", "")<CR><CR>
nmap <Leader>fm :<C-U><C-R>=printf("Leaderf --regexMode mru %s", "")<CR><CR>
nmap <Leader>ft :<C-U><C-R>=printf("Leaderf --regexMode bufTag %s", "")<CR><CR>
nmap <Leader>f/ :<C-U><C-R>=printf("Leaderf --regexMode line %s", "")<CR><CR>
nmap <Leader>f. :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
nmap <Leader>fa :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf rg -F -e %s ", Leaderf#Rg#visual())<CR><CR>
nmap  go :<C-U>Leaderf rg --recall<CR><CR>

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
" let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'

nmap <Leader>fe :<C-U><C-R>=printf("Leaderf  gtags -r %s --auto-jump", expand("<cword>"))<CR>
nmap <Leader>fd :<C-U><C-R>=printf("Leaderf  gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
nmap <Leader>fo :<C-U><C-R>=printf("Leaderf  gtags --recall %s", "")<CR><CR>
nmap <Leader>fj :<C-U><C-R>=printf("Leaderf  gtags --next %s", "")<CR><CR>
nmap <Leader>fk :<C-U><C-R>=printf("Leaderf  gtags --previous %s", "")<CR><CR>
