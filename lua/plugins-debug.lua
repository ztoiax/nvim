return {
    ------ test ------
    "roxma/nvim-yarp",
    "roxma/vim-hug-neovim-rpc",

    {
        "rcarriga/vim-ultest",
        requires = { "vim-test/vim-test" },
        run = ":UpdateRemoteins",
        vim.cmd([[
            let test#python#pytest#options = "--color=yes"
            let test#javascript#jest#options = "--color=always"
            let test#javascript#reactscripts#options = "--watchAll=false"
            let g:ultest__pty = 1
        ]]),
    },

    ------ dap ------
    {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "thehamsta/nvim-dap-virtual-text" },
    },

    -- nvim lua dap
    "jbyuki/one-small-step-for-vimkind",

    -- "mfussenegger/nvim-dap-python",

    ------- formatting ------
    "sbdchd/neoformat",
    { "mhartington/formatter.nvim", config = function() require("debug/init-formatter") end},
}
