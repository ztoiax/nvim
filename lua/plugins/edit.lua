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
    { "numToStr/Comment.nvim", config = true },

    -- instead and replace
    -- "brooth/far.vim",

    {
        "windwp/nvim-spectre",
        config = function ()
            require('spectre').setup({
                mapping={
                    -- 选择/取消
                    ['toggle_line'] = {
                        map = "dd",
                        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
                        desc = "toggle current item"
                    },
                    -- 确认
                    ['replace_cmd'] = {
                        map = "<cr>",
                        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
                        desc = "input replace vim command"
                    },
                }
            })

            vim.cmd([[
                nnoremap <leader>\ viw:lua require('spectre').open_file_search()<cr>
            ]])
        end
    },

    -- enhance di da
    "wellle/targets.vim",

    -- 单词跳转
    { "phaazon/hop.nvim", config = true },

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
        config = true,
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
    { "windwp/nvim-autopairs", config = true },

    -- 参数位置交换
    { 
        "mizlan/iswap.nvim",
        config = true,
        vim.cmd([[
            nmap <leader>rl :ISwapNodeWithRight<cr>
            nmap <leader>rh :ISwapNodeWithLeft<cr>
        ]]),
    },

    -- 函数、语句跳转和块选
    {
        "ziontee113/syntax-tree-surfer",
        config = function() require("edit/map-syntax-tree-surfer") end,
    },

    -- marks
    -- "chentau/marks.nvim",

    -- fzf api
    "vijaymarupudi/nvim-fzf",

    -- fzf
    {
        "ibhagwan/fzf-lua",
        config = function() require("edit/init-fzf") end,
    },


    -- telescope
    -- {
    --     "nvim-telescope/telescope.nvim",
    --     dependencies = {
    --       "nvim-lua/plenary.nvim",
    --       "debugloop/telescope-undo.nvim",
    --     },
    --     config = function()
    --         require("edit/init-telescope")
    --         require("telescope").load_extension("undo")
    --         -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
    --     end,
    -- },

    -- yank历史
    "bfredl/nvim-miniyank",

    -- sudo
    "lambdalisue/suda.vim",

    -- 异步执行shell命令
    "skywind3000/asyncrun.vim",

    -- 部分代码运行
    { "michaelb/sniprun", build = "bash ./install.sh" },

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
