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
nmap <F8> :Ultest<CR>
nmap <leader><F8> :UltestSummary<CR>

" 调试
au FileType python nmap  <F5> :Pudb<CR>
au FileType python imap  <F5> <ESC>:Pudb<CR>

" 静态检查
" au FileType python nmap <F7> :!mypy %:p<CR>
" au FileType python imap <F7> <ESC>:!mypy %:p<CR>

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
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<leader><esc>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
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

" lsp_signature
lua << EOF
cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = "🐼 ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

-- recommanded:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
require'lsp_signature'.on_attach(cfg, bufnr)
EOF

let g:LanguageClient_serverCommands = {
\ 'text': ['unified-language-server', '--parser=retext-english', '--stdio'],
\ 'markdown': ['unified-language-server', '--parser=remark-parse', '--stdio'],
\ }

" lsp
lua <<EOF
-- lsp-status
local lsp_status = require('lsp-status')
lsp_status.register_progress()
local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
  handlers = lsp_status.extensions.clangd.setup(),
  init_options = {
    clangdFileStatus = true
  },
  on_attach = lsp_status.on_attach,
  capabilities = lsp_status.capabilities
})

lspconfig.gopls.setup({})
-- lspconfig.pyright.setup({})
lspconfig.pylsp.setup({
    settings = { python = { workspaceSymbols = { enabled = true }}},
    on_attach = lsp_status.on_attach,
    capabilities = lsp_status.capabilities
})
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.yamlls.setup({})
lspconfig.bashls.setup({})
lspconfig.vimls.setup({})
lspconfig.dockerls.setup({})
lspconfig.sumneko_lua.setup({})

-- lspconfig.rust_analyzer.setup({
--   on_attach = lsp_status.on_attach,
--   capabilities = lsp_status.capabilities
-- })

-- java
lspconfig.jdtls.setup({})
-- js and ts
lspconfig.eslint.setup({})
-- go
lspconfig.gopls.setup {
on_attach = function(client)
  -- [[ other on_attach code ]]
  -- illuminate highlight cursor word
  require 'illuminate'.on_attach(client)
end,
}

lspconfig.cmake.setup({})
lspconfig.diagnosticls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.sqls.setup{
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require'sqls'.setup({})
    end
}
EOF

let g:LanguageClient_serverCommands = {
\ 'text': ['unified-language-server', '--parser=retext-english', '--stdio'],
\ 'markdown': ['unified-language-server', '--parser=remark-parse', '--stdio'],
\ }


" lsp-status
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
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

lua << EOF
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
      -- Provide as ID strings or tables with "id" and "size" keys
      {
        id = "scopes",
        size = 0.25, -- Can be float or integer > 1
      },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 00.25 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})
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
"

" coq complete
" lua <<EOF
" local lsp = require "lspconfig"
" local coq = require "coq" -- add this
" EOF

" lspsaga
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>

" formatter
" https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
lua << EOF
require("formatter").setup({
  filetype = {
    python = {
      function()
        return {
          exe = "python3 -m autopep8",
          args = {
            "--in-place --aggressive --aggressive",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))
          },
          stdin = false
        }
      end
    }
  }
})
EOF

" vim-ultest
let test#python#pytest#options = "--color=yes"
let test#javascript#jest#options = "--color=always"
let test#javascript#reactscripts#options = "--watchAll=false"
let g:ultest_use_pty = 1
