return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSModuleInfo", "TSUpdate", "TSInstall" },

        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "markdown" },
                    additional_vim_regex_highlighting = false, -- highlight 块选, 可能会变卡
                },

                -- textobjects plugin
                textobjects = {
                  select = {
                    enable = true,
                    keymaps = {
                      -- Your custom capture.
                      ["aF"] = "@custom-capture",

                      -- Built-in captures.
                      ["af"] = "@function.outer",
                      ["if"] = "@function.inner",
                    },
                  },
                },

                -- 等于号(=)缩进
                indent = {
                    enable = true
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

                -- matchup plugin
                matchup = {
                    enable = true,
                    -- disable = { "c", "ruby" },
                },
            })
        end,

        vim.cmd([[
        " 折叠
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        ]]),
    },

    -- 语法树库函数
    {
        "nvim-treesitter/playground",
        build = ":TSInstall query",
        cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
    },

    -- 
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

    -- rename, 函数跳转
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        config = function() require("nvim-treesitter.configs").setup({
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

                        list_definitions = "gK",
                        list_definitions_toc = "gk",
                    },
                },
            },
        })end,
    },

    --彩虹括号
    {
        "p00f/nvim-ts-rainbow",
        config = function() require("nvim-treesitter.configs").setup({
            -- 彩虹括号
            rainbow = {
                enable = true,
                extended_mode = true,
            },
        })end
    },

    -- 移动时显示函数上下文
    {
        "romgrk/nvim-treesitter-context",
        config = function() require'treesitter-context'.setup({ enable = true, }) end
    },

    -- highlight if, else语法块
    {
        "andymass/vim-matchup",
        config = function() require("nvim-treesitter.configs").setup({
            matchup = { enable = true, },
        })end
    },

    -- highlight 同一单词
    {
        "David-Kunz/markid",
        config = function() require("nvim-treesitter.configs").setup({
            markid = { enable = true }
        })end
    },

    -- highlight 参数
    { "m-demare/hlargs.nvim", config = true },

    -- highlight if、for语句
    {
        "andymass/vim-matchup",
        config = function()
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end,

    },
}
