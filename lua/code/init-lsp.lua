-- lspconfig
-- local coq = require "coq"
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    init_options = {
        clangdFileStatus = true,
    },
})

lspconfig.gopls.setup({})
lspconfig.pyright.setup({
    settings = { python = { workspaceSymbols = { enabled = true } } },
})
-- lspconfig.pylsp.setup({
--     settings = { python = { workspaceSymbols = { enabled = true } } },
--     -- coq.lsp_ensure_capabilities()
-- })
lspconfig.tsserver.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.jsonls.setup({})
lspconfig.yamlls.setup({})
lspconfig.bashls.setup({})
lspconfig.vimls.setup({})
lspconfig.dockerls.setup({})
lspconfig.lua_ls.setup({})
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
lspconfig.ansiblels.setup({})
lspconfig.sqls.setup({
    on_attach = function(client)
        client.resolved_capabilities.execute_command = true

        require("sqls").setup({})
    end,
})

-- formatter
-- https://github.com/sbdchd/neoformat#supported-filetypes
-- nvim0.8自带format()命令-- lua vim.lsp.buf.format()
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
                    stdin = true,
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
                    stdin = true,
                }
            end,
        },
        c = {
            function()
                return {
                    exe = "clang-format -i",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = false,
                }
            end,
        },
        cpp = {
            function()
                return {
                    exe = "clang-format -i",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = false,
                }
            end,
        },
        zsh = {
            function()
                return {
                    exe = "shfmt -w",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        go = {
            function()
                return {
                    exe = "gofmt -w",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        java = {
            function()
                return {
                    exe = "clang-format -i",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = false,
                }
            end,
        },
        js = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        ts = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        xml = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        json = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        yaml = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        html = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        css = {
            function()
                return {
                    exe = "prettierd",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        -- markdown = {
        --     function()
        --         return {
        --             exe = "markdownfmt -w",
        --             args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
        --             stdin = true,
        --         }
        --     end,
        -- },
        sql = {
            function()
                return {
                    exe = "sqlfmt",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        Dockerfile = {
            function()
                return {
                    exe = "dockfmt fmt -w ",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
        nginx = {
            function()
                return {
                    exe = "nginxbeautifier",
                    args = { vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), },
                    stdin = true,
                }
            end,
        },
    }
}
)
