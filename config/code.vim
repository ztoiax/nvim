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

" 调试
au FileType python nmap  <F5> :Pudb<CR>
au FileType python imap  <F5> <ESC>:Pudb<CR>

" 静态检查
au FileType python nmap <F7> :!mypy %:p<CR>
au FileType python imap <F7> <ESC>:!mypy %:p<CR>

" autopairs
lua require('nvim-autopairs').setup()

" hrsh7th/nvim-cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'
  local lspkind = require('lspkind')

  cmp.setup({
    formatting = {
      format = require("lspkind").cmp_format({with_text = true, menu = ({
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        })}),
    },
    snippet = {
      expand = function(args)
         --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
         vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      -- ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      -- ['<tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      -- ['<Tab>'] = function(fallback)
      --   if cmp.visible() then
      --     cmp.select_next_item()
      --   else
      --     cmp.mapping.complete()
      --   end
      -- end,
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-u>'] = cmp.mapping.scroll_docs(4),
      ['<leader><esc>'] = cmp.mapping.close(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    -- snip
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lua' },
      -- { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = "path"},
      { name = 'buffer' },
      { name = 'treesitter' },
    })
  })
EOF

let g:LanguageClient_serverCommands = {
\ 'text': ['unified-language-server', '--parser=retext-english', '--stdio'],
\ 'markdown': ['unified-language-server', '--parser=remark-parse', '--stdio'],
\ }

" lsp
lua <<EOF
require'lspconfig'.clangd.setup{}
require'lspconfig'.gopls.setup{}
-- require'lspconfig'.pyright.setup{}
require'lspconfig'.pylsp.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.html.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.sumneko_lua.setup{}
-- java
require'lspconfig'.jdtls.setup{}
-- js and ts
require'lspconfig'.eslint.setup{}
-- go
require'lspconfig'.gopls.setup {
on_attach = function(client)
  -- [[ other on_attach code ]]
  -- illuminate highlight cursor word
  require 'illuminate'.on_attach(client)
end,
}

require'lspconfig'.cmake.setup{}
require'lspconfig'.diagnosticls.setup{}
require'lspconfig'.ansiblels.setup{}
require'lspconfig'.sqls.setup{
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup{}
    end
}
EOF

let g:LanguageClient_serverCommands = {
\ 'text': ['unified-language-server', '--parser=retext-english', '--stdio'],
\ 'markdown': ['unified-language-server', '--parser=remark-parse', '--stdio'],
\ }

" lspkind
lua <<EOF
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
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
require('dap-python').test_runner = 'pytest'
EOF

lua <<EOF
local dap = require('dap')
dap.adapters.python = {
  type = 'executable';
  command = '/usr/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
EOF

nnoremap <silent> <leader>dd :lua require('dap').continue()<CR>
nnoremap <silent> <leader>dn :lua require'dap'.step_over()<CR>

nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>dB :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>dl :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dR :lua require'dap'.repl.run_last()<CR>`

" nnoremap <silent> <leader>dt :lua require('dap-python').test_method()<CR>
" nnoremap <silent> <leader>df :lua require('dap-python').test_class()<CR>
" vnoremap <silent> <leader>ds <ESC>:lua require('dap-python').debug_selection()<CR>

" kite
" let g:kite_tab_complete=1
" let g:kite_supported_languages = ['*']
