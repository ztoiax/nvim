" auto execute
au FileType c set makeprg=gcc\ %
au FileType cpp set makeprg=g++\ %
au FileType python set makeprg=python\ %
nmap <F6> :!%:p<CR>
imap <F6> <ESC>:!%:p<CR>a
" map <F5>:make && ./a.out<CR>

" autopairs
lua require('nvim-autopairs').setup()

" complete
let g:completion_matching_ignore_case = 1
let g:completion_matching_smart_case = 1
let g:completion_enable_auto_popup = 1
let g:completion_enable_snippet = 'UltiSnips'
let g:UltiSnipsExpandTrigger=""
autocmd BufEnter * lua require'completion'.on_attach()
imap <silent> <tab> <Plug>(completion_trigger)
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)
imap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" completion-nvim will loop through the list and assign priority from high to low
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" possible value: "length", "alphabet", "none"
let g:completion_sorting = "alphabet"
" ignore case
let g:completion_matching_ignore_case = 1
" smart case matching
let g:completion_matching_smart_case = 1

" trigger on delete
let g:completion_trigger_on_delete = 0

" lsp
lua <<EOF
  require'lspconfig'.gopls.setup {
    on_attach = function(client)
      -- [[ other on_attach code ]]
      -- illuminate highlight cursor word
      require 'illuminate'.on_attach(client)
    end,
  }
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.sqls.setup{
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup{}
    end
}
EOF

" lspkind
lua <<EOF
require('lspkind').init({
    -- with_text = true,
    -- symbol_map = {
    --   Text = '',
    --   Method = 'ƒ',
    --   Function = '',
    --   Constructor = '',
    --   Variable = '',
    --   Class = '',
    --   Interface = 'ﰮ',
    --   Module = '',
    --   Property = '',
    --   Unit = '',
    --   Value = '',
    --   Enum = '了',
    --   Keyword = '',
    --   Snippet = '﬌',
    --   Color = '',
    --   File = '',
    --   Folder = '',
    --   EnumMember = '',
    --   Constant = '',
    --   Struct = ''
    -- },
})
EOF

" miniyank
map p <Plug>(miniyank-autoput)
map <leader>p <Plug>(miniyank-startput)
map <leader>n <Plug>(miniyank-cycle)
map <leader>N <Plug>(miniyank-cycleback)

" dap
lua <<EOF
require('dap-python').setup('/usr/bin.python')
EOF

lua <<EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
EOF

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>dp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.repl.run_last()<CR>`
nnoremap <silent> <leader>dn :lua require('dap-python').test_method()<CR>
vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" kite
" let g:kite_tab_complete=1
" let g:kite_supported_languages = ['*']
