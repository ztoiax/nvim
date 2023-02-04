return {
    -- 图标(icons)
    {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({})
        end,
    },

    -- tabs(标签)
    "romgrk/barbar.nvim",

    -- 状态栏lsp
    {
        "SmiteshP/nvim-gps",
        config = function()
            require("nvim-gps").setup()
        end,
    },

    -- 状态栏
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "OceanicNext",
                },
                sections = {
                    lualine_c = {
                        -- "require'lsp-status'.status()"
                        { require("nvim-gps").get_location, cond = require("nvim-gps").is_available },
                    },
                },
            })
        end,
    },

    -- 通知menu
    -- { "rcarriga/nvim-notify", config = 'vim.notify = require("notify")' },

    {
        "folke/noice.nvim",
        config = function()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                      ["vim.lsp.util.stylize_markdown"] = true,
                      ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                  bottom_search = true, -- use a classic bottom cmdline for search
                  command_palette = true, -- position the cmdline and popupmenu together
                  long_message_to_split = true, -- long messages will be sent to a split
                  inc_rename = false, -- enables an input dialog for inc-rename.nvim
                  lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    },

    -- highlight /
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup()
            -- map
            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap(
                "n",
                "n",
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap(
                "n",
                "N",
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                kopts
            )
            vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
        end,
    },

    -- highlight cursor pairs
    "Yggdroot/hiPairs",

    -- highlight identline
    {
        "lukas-reineke/indent-blankline.nvim",
        -- vim.opt.list = true
        -- vim.opt.listchars:append("space:⋅")
        -- vim.opt.listchars:append("eol:↴")
        config = function()
            require("indent_blankline").setup({
                space_char_blankline = " ",
                show_current_context = true,
                -- 下划线
                show_current_context_start = false,
            })
        end,
    },

    -- highlight yank
    {
        "machakann/vim-highlightedyank",
        vim.cmd([[let g:highlightedyank_highlight_duration = 300]]),
    },
    -- highlight cursor word
    "RRethy/vim-illuminate",

    -- highlight color
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },

    -- 搜索后自动取消highlight
    "romainl/vim-cool",

    -- awesome主题
    "rafi/awesome-vim-colorschemes",

    -- 沉浸阅读
    "junegunn/goyo.vim",

    -- undo tree
    "simnalamburt/vim-mundo",

    -- 快速移动
    "rhysd/accelerated-jk",

    -- 移动动画
    "psliwka/vim-smoothie",

    -- 窗口动画
    "camspiers/animate.vim",

    -- nvim浮动窗口
    "numToStr/FTerm.nvim",

    -- 浮动窗口
    {
        "voldikss/vim-floaterm",
        vim.cmd([[
            hi FloatermNF guibg=#282828
            hi FloatermBorderNF guibg=#282828 guifg=#504945
            command! Ranger FloatermNew ranger
            command! Broot FloatermNew broot -sdpw
            command! Lazygit FloatermNew lazygit
            command! Lazydocker FloatermNew lazydocker
            command! Ptpython FloatermNew ptpython
            command! Pudb FloatermNew python -m pudb %
            let g:floaterm_height = 0.9
            let g:floaterm_width = 0.9
            let g:floaterm_wintype = 'normal'
            " autocmd FileType floaterm wincmd H
            let g:floaterm_autoclose = 2
            let g:floaterm_position = 'center'
            let g:floaterm_opener = 'edit'

            " 取消边框
            let g:floaterm_borderchars = '        '
            let g:floaterm_title = ''
        ]]),
    },

    -- 翻译
    {
        "voldikss/vim-translator",
        vim.cmd([[
            " let g:translator_history_enable = 1
            let g:translator_default_engines = get(g:, 'translator_default_engines', ['bing'])
            " let g:translator_proxy_url = ''
            let g:translator_window_type = 'popup'
        ]]),
    },

    -- markdown侧边栏
    {
        "liuchengxu/vista.vim",
        vim.cmd([[
            let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
            let g:vista#renderer#enable_icon = 1
            " nnoremap T :SymbolsOutline<cr>
            nnoremap T :Vista!!<cr>
        ]]),
    },

    -- command补全
    "gelguy/wilder.nvim",

    -- 启动时恢复会话
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                log_level = "info",
                auto_session_enable_last_session = false,
                -- /home/tz/.local/share/nvim/sessions
                auto_session_root_dir = "~/.config/nvim/sessions",
                -- auto_session_suppress_dirs = {'~/.config/nvim/sessions'}
            })
        end,
    },

    --registers menu
    "tversteeg/registers.nvim",

    -- focusing current part
    {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup({})
        end,
    },

    -- 折叠代码
    { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" },

    -- 打字机声音
    "skywind3000/vim-keysound",

    -- 主题
    "rebelot/kanagawa.nvim",

    -- visual模式下使用Norm命令，可以实时显示
    {
        "smjonas/live-command.nvim",
        -- live-command supports semantic versioning via tags
        -- tag = "1.*",
        config = function()
            require("live-command").setup({
                commands = {
                    Norm = { cmd = "norm" },
                },
            })
        end,
    },

    -- 显示快捷键
    -- {
    --     "folke/which-key.nvim",
    --       config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup {
    --           -- your configuration comes here
    --           -- or leave it empty to use the default settings
    --           -- refer to the configuration section below
    --         }
    --       end
    -- },

    --在浏览器嵌入nvim
    --  'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } },

    --  {
    --     'ray-x/navigator.lua',
    --     requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    --     config = require'navigator'.setup()
    -- },
}
