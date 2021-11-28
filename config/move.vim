" edgemotion
" nmap <space>j <Plug>(edgemotion-j)
" nmap <space>k <Plug>(edgemotion-k)
nmap <space>j ]m
nmap <space>k [m

" neoscroll.nvim
lua << EOF
require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,        -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,              -- Function to run after the scrolling animation ends
})
EOF

" hop
lua require'hop'.setup()
nmap <Leader>f1 :HopChar1<CR>
nmap <Leader>f2 :HopChar2<CR>
nmap <Leader>fl :HopLine<CR>
nmap <Leader>fw :HopWord<CR>

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

" nvim-treehopper
nmap <leader><CR> lua require('tsht').nodes()

" marks
" lua << EOF
" require'marks'.setup {
"   -- whether to map keybinds or not. default true
"   default_mappings = true,
"   -- which builtin marks to show. default {}
"   builtin_marks = { ".", "<", ">", "^" },
"   -- whether movements cycle back to the beginning/end of buffer. default true
"   cyclic = true,
"   -- whether the shada file is updated after modifying uppercase marks. default false
"   force_write_shada = false,
"   -- how often (in ms) to redraw signs/recompute mark positions. 
"   -- higher values will have better performance but may cause visual lag, 
"   -- while lower values may cause performance penalties. default 150.
"   refresh_interval = 250,
"   -- sign priorities for each type of mark - builtin marks, uppercase marks, lowercase
"   -- marks, and bookmarks.
"   -- can be either a table with all/none of the keys, or a single number, in which case
"   -- the priority applies to all marks.
"   -- default 10.
"   sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
"   -- disables mark tracking for specific filetypes. default {}
"   excluded_filetypes = {},
"   -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
"   -- sign/virttext. Bookmarks can be used to group together positions and quickly move
"   -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
"   -- default virt_text is "".
"   bookmark_0 = {
"     sign = "⚑",
"     virt_text = "hello world"
"   },
"   mappings = {
"     toggle = 'mm',
"     next = "mj",
"     prev = "mk",
"     delete_buf = 'md',
"   }
" }
" EOF
