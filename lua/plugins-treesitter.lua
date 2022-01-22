return {
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        cmd = { "TSModuleInfo", "TSUpdate", "TSInstall" },
        config = require("nvim-treesitter.configs").setup({
            ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            highlight = {
                enable = true, -- false will disable the whole extension
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "gnr",
                    scope_incremental = "gnc",
                    node_decremental = "gnm",
                },
            },
            additional_vim_regex_highlighting = true,
        }),
        vim.cmd([[
        " 折叠
        " set foldmethod=expr
        " set foldexpr=nvim_treesitter#foldexpr()
        ]]),
    },

    -- 语法树库函数
    {
        "nvim-treesitter/playground",
        run = ":TSInstall query",
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },

    -- rename, 函数跳转
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        config = require("nvim-treesitter.configs").setup({
            refactor = {
                highlight_definitions = { enable = true },
                -- highlight_current_scope = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = ",rw",
                    },
                },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = ",k",
                        goto_next_usage = ",j",
                        -- goto_previous_usage = ",j",

                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                    },
                },
            },
        }),
    },

    --彩虹括号
    {
        "p00f/nvim-ts-rainbow",
        config = require("nvim-treesitter.configs").setup({
            -- 彩虹括号
            rainbow = {
                enable = true,
                extended_mode = true,
            },
        }),
    },

    -- 移动时显示函数上下文
    {
        "romgrk/nvim-treesitter-context",
        cmd = "TSContextToggle",
        -- config = require'treesitter-context'.setup{}
    },

    -- highlight if, else语法块
    {
        "andymass/vim-matchup",
        config = require("nvim-treesitter.configs").setup({
            matchup = {
                enable = true,
            },
        }),
    },
}
