-- lspconfig
-- local coq = require "coq"
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    init_options = {
        clangdFileStatus = true,
    },
})

lspconfig.gopls.setup({})
-- lspconfig.pyright.setup({
--     settings = { python = { workspaceSymbols = { enabled = true } } },
-- })

lspconfig.pylsp.setup({
    settings = { python = { workspaceSymbols = { enabled = true } } },
    -- coq.lsp_ensure_capabilities()
})
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
-- lspconfig.tailwindcss.setup({}) -- css
lspconfig.marksman.setup({})
lspconfig.jsonls.setup({})
lspconfig.yamlls.setup({})
lspconfig.bashls.setup({})
lspconfig.vimls.setup({})
lspconfig.dockerls.setup({})
lspconfig.lua_ls.setup({
    settings = {
        Lua = {
            -- 设置vim是globals的一部分，避免warning
            diagnostics = {
                globals = { 'vim' }
            },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- hints = { enable = true }
        }
    }
})
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
lspconfig.ansiblels.setup({})
lspconfig.sqlls.setup({
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require("sqlls").setup({})
    end,
})
