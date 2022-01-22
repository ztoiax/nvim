return {
    -- 折叠
    "masukomi/vim-markdown-folding",

    -- preview
    {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
    },

    -- 自动生成目录
    "mzlogin/vim-markdown-toc",

    -- 快速插入markdown表格
    "dhruvasagar/vim-table-mode",
}
