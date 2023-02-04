-- 如果packer插件不存在, 就下载
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap =
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

-- 加载packer插件
vim.cmd([[packadd packer.nvim]])

-- 加载插件
return require("packer").startup({

    config = {
        package_root = "~/.local/share/nvim/site/pack/"
    },
    function(use)
        use(require("plugins-lib"))
        use(require("plugins-treesitter"))
        use(require("plugins-ui"))
        use(require("plugins-git"))
        use(require("plugins-edit"))
        use(require("plugins-markdown"))
        use(require("plugins-code"))
        use(require("plugins-debug"))

        if packer_bootstrap then
            require("packer").sync()
        end
    end,
})
