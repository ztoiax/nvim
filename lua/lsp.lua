-- luasnip
-- require("luasnip/loaders/from_vscode").load({ include = { "python" } }) -- Load only python snippets
require("luasnip/loaders/from_vscode").load({
    paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" },
}) -- 加载friendly-snippets

local luasnip = require("luasnip")

--- lspkind
require("lspkind").init({
    with_text = true,
    symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",
        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "了",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
    },
})

-- hrsh7th/nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    formatting = {
        format = require("lspkind").cmp_format({
            with_text = true,
            menu = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                latex_symbols = "[Latex]",
            },
        }),
    },
    snippet = {
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-tab>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ['<tab>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        -- ['<Tab>'] = function(fallback)
        --   if cmp.visible() then
        --     cmp.select_next_item()
        --   else
        --     cmp.mapping.complete()
        --   end
        -- end,
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<leader><esc>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    -- snip
    sources = {
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "path" },
        { name = "buffer" },
        { name = "treesitter" },
    },
})

-- lspconfig
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    init_options = {
        clangdFileStatus = true,
    },
})

lspconfig.gopls.setup({})
-- lspconfig.pyright.setup({})
lspconfig.pylsp.setup({
    settings = { python = { workspaceSymbols = { enabled = true } } },
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
lspconfig.rust_analyzer.setup({})

-- java
lspconfig.jdtls.setup({})
-- js and ts
lspconfig.eslint.setup({})
-- go
lspconfig.gopls.setup({
    on_attach = function(client)
        -- [[ other on_attach code ]]
        -- illuminate highlight cursor word
        require("illuminate").on_attach(client)
    end,
})

lspconfig.cmake.setup({})
lspconfig.diagnosticls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.sqls.setup({
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require("sqls").setup({})
    end,
})

-- lsp_signature
require("lsp_signature").setup({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = "rounded",
    },
})

-- formatter
-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
require("formatter").setup({
    filetype = {
        python = {
            function()
                return {
                    exe = "python3 -m autopep8",
                    args = {
                        "--in-place --aggressive --aggressive",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = false,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = {
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        -- "-",
                    },
                    stdin = false,
                }
            end,
        },
    },
})

-- symbols-outline.nvim
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = "right",
    relative_width = true,
    width = 40,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = "Pmenu",
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = { "<Esc>", "q" },
        goto_location = "<Cr>",
        focus_location = "i",
        hover_symbol = "o",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = { icon = "", hl = "TSURI" },
        Module = { icon = "", hl = "TSNamespace" },
        Namespace = { icon = "", hl = "TSNamespace" },
        Package = { icon = "", hl = "TSNamespace" },
        Class = { icon = "𝓒", hl = "TSType" },
        Method = { icon = "ƒ", hl = "TSMethod" },
        Property = { icon = "", hl = "TSMethod" },
        Field = { icon = "", hl = "TSField" },
        Constructor = { icon = "", hl = "TSConstructor" },
        Enum = { icon = "ℰ", hl = "TSType" },
        Interface = { icon = "ﰮ", hl = "TSType" },
        Function = { icon = "", hl = "TSFunction" },
        Variable = { icon = "", hl = "TSConstant" },
        Constant = { icon = "", hl = "TSConstant" },
        String = { icon = "𝓐", hl = "TSString" },
        Number = { icon = "#", hl = "TSNumber" },
        Boolean = { icon = "⊨", hl = "TSBoolean" },
        Array = { icon = "", hl = "TSConstant" },
        Object = { icon = "⦿", hl = "TSType" },
        Key = { icon = "🔐", hl = "TSType" },
        Null = { icon = "NULL", hl = "TSType" },
        EnumMember = { icon = "", hl = "TSField" },
        Struct = { icon = "𝓢", hl = "TSType" },
        Event = { icon = "🗲", hl = "TSType" },
        Operator = { icon = "+", hl = "TSOperator" },
        TypeParameter = { icon = "𝙏", hl = "TSParameter" },
    },
}

-- -- coq complete
-- local lsp = require "lspconfig"
-- local coq = require "coq" -- add this

-- -- kite
-- let g:kite_tab_complete=1
-- let g:kite_supported_languages = ['*']
