return {
    -- 图标(icons)
    { "kyazdani42/nvim-web-devicons", require("nvim-web-devicons").setup({}) },

    -- tabs(标签)
    "romgrk/barbar.nvim",

    -- 状态栏lsp
    { "SmiteshP/nvim-gps", require("nvim-gps").setup() },

    -- 状态栏
    {
        "nvim-lualine/lualine.nvim",
        config = require("lualine").setup({
            options = {
                theme = "OceanicNext",
            },
            sections = {
                lualine_c = {
                    -- "require'lsp-status'.status()"
                    { require("nvim-gps").get_location, cond = require("nvim-gps").is_available },
                },
            },
        }),
    },

    -- 通知menu
    {
        "rcarriga/nvim-notify",
        config = 'vim.notify = require("notify")',
    },

    -- highlight /
    "kevinhwang91/nvim-hlslens",

    -- highlight cursor pairs
    "Yggdroot/hiPairs",

    -- highlight identline
    {
        "lukas-reineke/indent-blankline.nvim",
        -- vim.opt.list = true
        -- vim.opt.listchars:append("space:⋅")
        -- vim.opt.listchars:append("eol:↴")
        require("indent_blankline").setup({
            space_char_blankline = " ",
            show_current_context = true,
            -- 下划线
            -- show_current_context_start = true,
        }),
    },

    -- highlight yank
    {
        "machakann/vim-highlightedyank",
        vim.cmd([[let g:highlightedyank_highlight_duration = 300]]),
    },
    -- highlight cursor word
    "RRethy/vim-illuminate",

    -- highlight color
    { "norcalli/nvim-colorizer.lua", require("colorizer").setup() },

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
                -- /home/tz/.local/share/nvim/sessions
                auto_session_root_dir = "~/.config/nvim/sessions",
                -- auto_session_suppress_dirs = {'~/.config/nvim/sessions'}
            })
        end,
    },

    --registers menu
    'tversteeg/registers.nvim',

    -- 打字机声音
    "skywind3000/vim-keysound",

    --在浏览器嵌入nvim
    --  'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } },

    --  {
    --     'ray-x/navigator.lua',
    --     requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    --     config = require'navigator'.setup()
    -- },
}
