-- https://github.com/dragove/nvim/blob/master/lua/init-dap.lua
local dap = require("dap")
require("dapui").setup()
require("nvim-dap-virtual-text").setup()

vim.cmd([[
    nnoremap <F5> :lua require"dap".continue()<CR>
    nnoremap <F7> :lua require"dap".step_into()<CR>
    nnoremap <F8> :lua require"dap".step_over()<CR>
    nnoremap <S-F8> :lua require"dap".step_out()<CR>
    nnoremap <leader>xb :lua require"dap".toggle_breakpoint()<CR>
    nnoremap <leader>xB :lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>
    nnoremap <leader>xu :lua require"dapui".toggle()<CR>
    " dapui
    nnoremap <leader>xx :lua require("dapui").eval()<CR>
    nnoremap <leader>xf :lua require("dapui").float_element()<CR>
    vnoremap <leader>xx :lua require("dapui").eval()<CR>
    vnoremap <leader>xf :lua require("dapui").float_element()<CR>
]])

-- python
dap.adapters.python = {
    type = "executable",
    command = "/bin/python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return "/bin/python"
        end,
    },
}

-- nvim lua
dap.configurations.lua = {
    {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
        host = function()
            local value = vim.fn.input("Host [127.0.0.1]: ")
            if value ~= "" then
                return value
            end
            return "127.0.0.1"
        end,
        port = function()
            local val = tonumber(vim.fn.input("Port: "))
            assert(val, "Please provide a port number")
            return val
        end,
    },
}

dap.adapters.nlua = function(callback, config)
    callback({ type = "server", host = config.host, port = config.port })
end

-- lua require"osv".launch()
-- lua require"osv".run_this()
