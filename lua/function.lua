-- vim-fcitx
INPUT_TOGGLE = 1
function Fcitx2en()
    local input_status = vim.fn.systemlist("fcitx5-remote")
    if input_status[1] == "2" then -- 1表示当前为英文, 2表示当前为中文
        INPUT_TOGGLE = 1
        vim.fn.systemlist("fcitx5-remote -c") -- 中文转英文
    end
end

function Fcitx2zh()
    local input_status = vim.fn.systemlist("fcitx5-remote")
    -- if input_status[1] == "1" and INPUT_TOGGLE == 1 then
    if input_status[1] == "2" then
        -- vim.fn.systemlist("fcitx5-remote -o")  -- 英文转中文
        vim.fn.systemlist("fcitx5-remote -c")
        INPUT_TOGGLE = 0
    end
end

-- 进入插入模式
vim.cmd("autocmd InsertEnter * :lua Fcitx2zh()")

-- 退出插入模式
vim.cmd("autocmd InsertLeave * :lua Fcitx2en()")


local buf, win
function open_float_window()

    -- 创建一个buffer
    buf = vim.api.nvim_create_buf(false, true) -- create new emtpy buffer

    -- 当buffer被hidden时删除
    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

    -- get dimensions
    local width = vim.api.nvim_get_option("columns")
    local height = vim.api.nvim_get_option("lines")

    -- calculate our floating window size
    local win_height = math.ceil(height * 0.8 - 4)
    local win_width = math.ceil(width * 0.8)

    -- and its starting position
    local row = math.ceil((height - win_height) / 2 - 1)
    local col = math.ceil((width - win_width) / 2)

    -- set some options
    local opts = {
        style = "minimal",
        relative = "editor",
        width = win_width,
        height = win_height,
        row = row,
        col = col,
    }

    -- 打开一个窗口, 并attached刚才创建的buffer
    win = vim.api.nvim_open_win(buf, true, opts)
    vim.api.nvim_command('terminal')
end
