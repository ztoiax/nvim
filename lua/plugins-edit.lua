return {
    -- 快速块选
    "gcmt/wildfire.vim",

    -- 语法树块选
    "mfussenegger/nvim-treehopper",

    {
        "LeonHeidelbach/trailblazer.nvim",
        config = function()
            require("trailblazer").setup({
                -- mappings = { -- rename this to "force_mappings" to completely override default mappings and not merge with them
                --         nv = { -- Mode union: normal & visual mode. Can be extended by adding i, x, ...
                --             motions = {
                --                 new_trail_mark = '<A-l>',
                --                 track_back = '<A-b>',
                --                 peek_move_next_down = '<A-J>',
                --                 peek_move_previous_up = '<A-K>',
                --                 toggle_trail_mark_list = '<A-m>',
                --             },
                --             actions = {
                --                 delete_all_trail_marks = '<A-L>',
                --                 paste_at_last_trail_mark = '<A-p>',
                --                 paste_at_all_trail_marks = '<A-P>',
                --                 set_trail_mark_select_mode = '<A-t>',
                --                 switch_to_next_trail_mark_stack = '<A-.>',
                --                 switch_to_previous_trail_mark_stack = '<A-,>',
                --                 set_trail_mark_stack_sort_mode = '<A-s>',
                --             },
                --         },
                --     },
            })
        end,
    },

    -- 注释
    {
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    },

    -- instead and replace
    "brooth/far.vim",

    -- enhance di da
    "wellle/targets.vim",

    -- 单词跳转
    {
        "phaazon/hop.nvim",
        config = function()
            require("hop").setup()
        end,
    },

    -- extends f
    {
        "rhysd/clever-f.vim",
        vim.cmd([[
            let g:clever_f_ignore_case = 1 " Ignore case (忽略大小写)
            let g:clever_f_chars_match_any_signs = ';'
            let g:clever_f_not_overwrites_standard_mappings = 1
        ]]),
    },

    -- 快速添加特殊符号--(<[]>)--'
    -- "tpope/vim-surround",

    {
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({})
        end,
        vim.cmd([["
            nmap s  ys
            vmap s  S
        ]])
    },

    -- 替换和驼峰命名
    "tpope/vim-abolish",

    -- 可重复插件操作
    "tpope/vim-repeat",

    -- 多行对齐
    "junegunn/vim-easy-align",

    -- 光标多选
    "mg979/vim-visual-multi",

    -- autopairs
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end,
    },

    -- 参数位置交换
    {
        "mizlan/iswap.nvim",
        config = function()
            require("iswap").setup({})
        end,
    },

    { "ziontee113/syntax-tree-surfer" },

    -- marks
    -- "chentau/marks.nvim",

    -- fzf api
    "vijaymarupudi/nvim-fzf",

    -- fzf
    "ibhagwan/fzf-lua",

    -- telescope
    --  {
    --     "nvim-telescope/telescope.nvim",
    -- },

    -- yank历史
    "bfredl/nvim-miniyank",

    -- sudo
    "lambdalisue/suda.vim",

    -- 异步执行shell命令
    "skywind3000/asyncrun.vim",

    -- 部分代码运行
    { "michaelb/sniprun", run = "bash ./install.sh" },

    -- csv file format
    "chrisbra/csv.vim",

    -- 数据库
    "tpope/vim-dadbod",
    {
        "kristijanhusak/vim-dadbod-ui",
        -- 数据库路径
        vim.cmd([[
            let g:dbs = [
            \ { 'name': 'sqlite-search.db', 'url': 'sqlite:/home/tz/.mybin/search.db' },
            \ ]
        ]]),
    },
    "tami5/sqlite.lua",
}
