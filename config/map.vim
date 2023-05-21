if has("nvim")
  command! W w! !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again" else
  command! W w! !sudo tee % > /dev/null
end

nmap S  :source % <CR>
nmap \  :%s//g<Left><Left>
vmap \  :s//g<Left><Left>

" nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
map <leader><leader> %
" remove unwanted space
nnoremap <silent> <leader><F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

imap <C-n> <Esc>ui
imap <C-p> <Esc><C-r>i
nmap <C-e> <C-u>
nmap <C-y> "0p
vmap <C-y> "0p
nmap Y y$
nmap yu v0y
nmap du d0
nmap E v$h
nmap B vb
nmap <Leader>w :w<CR>

nmap <Leader>. <esc>ysiw
imap <Leader>. <esc>ysiw

tnoremap <A-[> <C-\><C-n>

nmap <space> `
" nnoremap ' "
nnoremap Q q
nmap q :q <CR>

" git
nnoremap <Leader>gd :Gvdiffsplit<CR>
nnoremap <Leader>gb :GBrowse<CR>

"align
xmap <Leader>ia <Plug>(EasyAlign)
nmap <Leader>ia <Plug>(EasyAlign)

"asyncrun
" Run the current line
nmap <leader>ie :execute getline(line('.'))<cr>
" Run the current line in sh
" nmap <leader>el :execute '!'.getline('.')<cr>
" nmap <Leader>ii :.!
nmap <Leader>io :AsyncRun! -mode=term 
nmap <Leader>ii :AsyncRun! 
" Run the current line in terminal
nmap <leader>il :execute 'AsyncRun! -mode=term '.getline('.')<cr>

" registers
nmap <silent> <leader>" :Registers<cr>

" nvim-treehopper
omap     <leader><enter> :<C-U>lua require('tsht').nodes()<CR>
vnoremap <leader><enter> :lua require('tsht').nodes()<CR>
nnoremap <leader><enter> :lua require('tsht').nodes()<CR>

" auto execute
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %
au FileType python set makeprg=python\ %

" 编译
" map <F5>:make && ./a.out<CR>

" 运行
nmap <F6> :!%:p<CR>
imap <F6> <ESC>:!%:p<CR>
nmap <leader><F6> :read!%:p<CR>
imap <leader><F6> <ESC>:read!%:p<CR>

vmap <F6> :SnipRun<CR>

" 测试
nmap <F8> :lua require("neotest").run.run()

" 调试
" au FileType python nmap  <F5> :Pudb<CR>
" au FileType python imap  <F5> <ESC>:Pudb<CR>

" 静态检查
" au FileType python nmap <F7> :!mypy %:p<CR>
" au FileType python imap <F7> <ESC>:!mypy %:p<CR>

" miniyank
map p <Plug>(miniyank-autoput)
map <leader>p <Plug>(miniyank-startput)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

" lspsaga
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" iswap
nmap <leader>is :ISwapWith<CR>

"undo tree 历史修改树
nnoremap <Leader>tu :MundoToggle <CR>

" translator 翻译
nmap <silent> <Leader>te <Plug>Translate
vmap <silent> <Leader>te <Plug>TranslateV
" Display translation in a window
nmap <silent> <Leader>tw <Plug>TranslateW
vmap <silent> <Leader>tw <Plug>TranslateWV
" Replace the text with translation
nmap <silent> <Leader>tr <Plug>TranslateR
vmap <silent> <Leader>tr <Plug>TranslateRV
" Translate the text in clipboard
nmap <silent> <C-q> <Plug>TranslateX


" floaterm
nmap <Leader>tp :Ptpython<CR>
nmap <Leader>tt :terminal mytop.sh<CR>
nmap <Leader>fr :Ranger<CR>
nmap <Leader>gg :Lazygit<CR>
nmap <Leader>td :Lazydocker<CR>

" hop
nmap <Leader>f1 :HopChar1<CR>
nmap <Leader>f2 :HopChar2<CR>
nmap <Leader>fl :HopLine<CR>
nmap <Leader>fw :HopWord<CR>

" vim-visual-multi
let g:VM_maps = {}
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
nmap <Leader>i <Plug>(VM-Select-All)

" markdown-preview.nvim
nmap <Leader>rr <Plug>MarkdownPreview

" vim-markdown-toc 自动生成目录
nmap <Leader>rd :GenTocGFM<cr>

" markdown tab
let g:table_mode_tableize_map = '<leader>m'
