-- 如果lazy插件不存在, 就下载
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- 加载lua/plugins目录下的插件
require("lazy").setup("plugins", {
    -- 插件安装的目录~/.local/share/nvim/lazy/
    root = vim.fn.stdpath("data") .. "/lazy",
    -- 插件版本的目录
    lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json", 
    defaults = {
        lazy = false, -- should plugins be lazy-loaded?
        version = nil,
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
})
-- require("lazy").setup({{import = "lib"}, {import = "ui"}})
