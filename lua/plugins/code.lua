return {
    ------ completion ------

    -- coq
    -- {
    --     "ms-jpq/coq_nvim", branch = "coq",
    --     dependencies = {
    --          "ms-jpq/coq.artifacts", branch = "artifacts" ,
    --          "ms-jpq/coq.thirdparty", branch = "3p" ,
    --     },
    --     config = function() require("completion/init-coq") end,
    -- },

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "lukas-reineke/cmp-rg",

            -- icon
            "onsails/lspkind-nvim",

            -- luasnip
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = function() require("completion/init-cmp") end,

    },

    ------ lsp ------
    {
        "neovim/nvim-lspconfig",
        dependencies = { "nanotee/sqls.nvim" },
        config = function() require("code/init-lsp") end,
    },

    -- 参数提示
    {
        "ray-x/lsp_signature.nvim",
        config = function() require("lsp_signature").setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded",
            },
        })end
    },

    -- lsp侧边栏
    { "simrat39/symbols-outline.nvim", config = function() require("code/symbols-outline") end},

    -- lsp 右下角进度ui
    { "j-hui/fidget.nvim", config = function() require("fidget").setup({}) end},

    -- diagnosis
    {
        "Maan2003/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
            -- 启动lsp_lines
            vim.keymap.set(
              "",
              "<Leader>l",
              require("lsp_lines").toggle,
              { desc = "Toggle lsp_lines" }
            )

            -- 关闭默认的lsp diagnosis
            vim.diagnostic.config({virtual_text = false})
        end,
    },

    -- lsp menu
    -- 'glepnir/lspsaga.nvim'

    -- 'github/copilot.vim',
}
