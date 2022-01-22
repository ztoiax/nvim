-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
require("formatter").setup({
    filetype = {
        python = {
            function()
                return {
                    exe = "python3 -m autopep8",
                    args = {
                        "--in-place --aggressive --aggressive",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                    },
                    stdin = false,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = {
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        -- "--config-path "
                        --   .. os.getenv("XDG_CONFIG_HOME")
                        --   .. "/stylua/stylua.toml",
                        -- "-",
                    },
                    stdin = false,
                }
            end,
        },
    },
})
