return {
    -- preview
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            -- call mkdp#util#install()
            vim.fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
    },

    -- 自动生成目录
    {"mzlogin/vim-markdown-toc", ft = { "markdown" }},

    -- 快速插入markdown表格
    {"dhruvasagar/vim-table-mode", ft = { "markdown" }},
}
