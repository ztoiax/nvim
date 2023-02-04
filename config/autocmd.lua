vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function(args)
        vim.treesitter.start(args.buf, "latex")
        vim.bo[args.buf].syntax = "on" -- only if additional legacy syntax is needed
    end,
})
