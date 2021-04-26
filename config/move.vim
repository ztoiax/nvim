" edgemotion
" nmap <space>j <Plug>(edgemotion-j)
" nmap <space>k <Plug>(edgemotion-k)
nmap <space>j ]m
nmap <space>k [m

" vim-easymotion
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <Leader>f2 <Plug>(easymotion-overwin-f2)
nmap <Leader>0 <Plug>(easymotion-overwin-line)
nmap <Leader>fw <Plug>(easymotion-overwin-w)

" clever-f
" Ignore case (忽略大小写)
let g:clever_f_ignore_case = 1
let g:clever_f_chars_match_any_signs = ';'
let g:clever_f_not_overwrites_standard_mappings = 1

nmap ; <Plug>(clever-f-repeat-forward)
nmap ' <Plug>(clever-f-repeat-back)

nmap f <Plug>(clever-f-f)
xmap f <Plug>(clever-f-f)
omap f <Plug>(clever-f-f)
nmap F <Plug>(clever-f-F)
xmap F <Plug>(clever-f-F)
omap F <Plug>(clever-f-F)

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

" bookmarks
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1
" let g:bookmark_no_default_key_mappings = 1

" nmap mm <Plug>BookmarkToggle
" nmap ma <Plug>BookmarkAnnotate
" nmap ml <Plug>BookmarkShowAll
" nmap mj <Plug>BookmarkNext
" nmap mk <Plug>BookmarkPrev
" nmap mc <Plug>BookmarkClear
" nmap mC <Plug>BookmarkClearAll
