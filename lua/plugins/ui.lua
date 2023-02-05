return {
    -- 主题
    {
        "glepnir/oceanic-material",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- 默认为50
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme oceanic_material]])
        end,
    },


    -- {
    --     "rebelot/kanagawa.nvim",
    --     lazy = false, -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         -- load the colorscheme here
    --         -- vim.cmd([[colorscheme kanagawa]])
    --     end,
    -- },

    -- 图标(icons)
    { "kyazdani42/nvim-web-devicons", config = true },

    -- tabs(标签)
    {
        "romgrk/barbar.nvim",
        config = function()
            local map = vim.api.nvim_set_keymap
            local opts = { noremap = true, silent = true }

            map('n', '<C-t>', '<Cmd>tabnew<CR>', opts)

            -- Re-order to previous/next
            map('n', '<leader><<', '<Cmd>BufferMovePrevious<CR>', opts)
            map('n', '<leader>>>', '<Cmd>BufferMoveNext<CR>', opts)

            -- Move to previous/next
            map('n', 'H', '<Cmd>BufferPrevious<CR>', opts)
            map('n', 'L', '<Cmd>BufferNext<CR>', opts)

            -- Goto buffer in position...
            map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
            map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
            map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
            map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
            map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
            map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
            map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
            map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
            map('n', '<A-9>', '<Cmd>BufferLast<CR>', opts)

            -- Magic buffer-picking mode
            map('n', '<A-0>', '<Cmd>BufferPick<CR>', opts)
            -- Pin/unpin buffer
            map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
            -- Close buffer
            map('n', '<C-w>', '<Cmd>BufferClose<CR>', opts)
            -- 恢复最后一个关闭的buffer
            map('n', 'X', '<C-^>', opts)
            -- 只保留当前buffer
            map('n', '<C-o>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)
        end,
    },

    -- 状态栏lsp
    { "SmiteshP/nvim-gps", config = true },

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
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
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
    -- {
    --     "rmagatti/auto-session",
    --     config = function()
    --         require("auto-session").setup({
    --             log_level = "info",
    --             auto_session_enable_last_session = false,
    --             -- /home/tz/.local/share/nvim/sessions
    --             auto_session_root_dir = "~/.config/nvim/sessions/",
    --             -- auto_session_suppress_dirs = {'~/.config/nvim/sessions/s'}
    --         })
    --     end,
    -- },

    -- registers menu
    { "tversteeg/registers.nvim", config = true },

    -- focusing current part
    { "folke/twilight.nvim", config = true },

    -- 折叠代码
    { 
        "kevinhwang91/nvim-ufo",
        lazy = true,
        dependencies = "kevinhwang91/promise-async",

        config = function ()
            -- Option 3: treesitter as a main provider instead
            require('ufo').setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            })

            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
            vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
            vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
            vim.keymap.set('n', 'K', function()
                local winid = require('ufo').peekFoldedLinesUnderCursor()
                if not winid then
                    -- choose one of coc.nvim and nvim lsp
                    vim.fn.CocActionAsync('definitionHover') -- coc.nvim
                    vim.lsp.buf.hover()
                end
            end)
        end
    },

    -- 打字机声音
    "skywind3000/vim-keysound",

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
}
