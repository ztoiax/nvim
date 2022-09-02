-- lspconfig
-- local coq = require "coq"
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
    -- coq.lsp_ensure_capabilities()
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

-- markdown
lspconfig.marksman.setup({})

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

