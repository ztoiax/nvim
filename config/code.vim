" autopairs
lua require('nvim-autopairs').setup()

" complete
autocmd BufEnter * lua require'completion'.on_attach()
imap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <expr> <C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
imap <expr> <C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"

" imap <tab> <Plug>(completion_smart_tab)

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
require'lspconfig'.pyls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.dockerls.setup{}
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
