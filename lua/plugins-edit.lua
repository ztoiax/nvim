return {
    -- 快速块选
    "gcmt/wildfire.vim",

    -- 语法树块选
    "mfussenegger/nvim-treehopper",

    -- 注释
    { "numToStr/Comment.nvim", require("Comment").setup() },

    -- instead and replace
    "brooth/far.vim",

    -- enhance di da
    "wellle/targets.vim",

    -- 单词跳转
    { "phaazon/hop.nvim", require("hop").setup() },

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
    "tpope/vim-surround",

    -- 替换和驼峰命名
    "tpope/vim-abolish",

    -- 可重复插件操作
    "tpope/vim-repeat",

    -- 多行对齐
    "junegunn/vim-easy-align",

    -- 光标多选
    "mg979/vim-visual-multi",

    -- autopairs
    { "windwp/nvim-autopairs", require("nvim-autopairs").setup() },

    -- 参数位置交换
    { "mizlan/iswap.nvim", require("iswap").setup({}) },

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
    "kristijanhusak/vim-dadbod-ui",
}
