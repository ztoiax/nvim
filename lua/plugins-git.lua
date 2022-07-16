return {
    -- 在 vim 里使用 git
    {
        "tpope/vim-fugitive",
        config = vim.cmd([[ let g:fugitive_no_maps = v:true ]]) },

    -- magit
    "jreybert/vimagit",

    -- 当前行显示commit信息
    {
        "f-person/git-blame.nvim",
        config = vim.cmd([[ let g:gitblame_date_format = '%x, %X']]),
    },

    -- 显示文件变动
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup() end
    },

    -- diff 当前项目
    { "sindrets/diffview.nvim", config = function() require("diffview").setup({}) end},
}
