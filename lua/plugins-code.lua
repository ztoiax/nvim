return {
    ------ completion ------

    -- coq
    {
        { "ms-jpq/coq_nvim", branch = "coq" },
        requires = {
            { "ms-jpq/coq.artifacts", branch = "artifacts" },
            { "ms-jpq/coq.thirdparty", branch = "3p" },
        },
        config = require("completion/init-coq"),
    },

    -- cmp
    {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",

            -- icon
            "onsails/lspkind-nvim",

            -- luasnip
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
        },
        config = require("completion/init-cmp"),
    },

    ------ lsp ------
    {
        "neovim/nvim-lspconfig",
        requires = { "nanotee/sqls.nvim" },
        config = require("code/init-lsp"),
    },

    -- 参数提示
    {
        "ray-x/lsp_signature.nvim",
        config = require("lsp_signature").setup({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "rounded",
            },
        }),
    },

    -- lsp侧边栏
    { "simrat39/symbols-outline.nvim", config = require("code/symbols-outline") },

    -- diagnosis
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        config = function()
            require("trouble").setup({})
        end,
    },

    -- lsp menu
    -- 'glepnir/lspsaga.nvim'

    -- 'kiteco/vim-plugin'             -- kite ai completion
    -- 'codota/tabnine-vim'            -- tabnine ai completion
}
