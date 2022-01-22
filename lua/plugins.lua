-- 如果packer插件不存在, 就下载
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- use插件
function use_plugins(use, plugins)
    for _, plugin in ipairs(plugins) do
        use(plugin)
    end
end

-- 加载packer插件
vim.cmd [[packadd packer.nvim]]

-- 加载插件
return require('packer').startup(function(use)

    use_plugins(use, require("plugins-lib"))
    use_plugins(use, require("plugins-treesitter"))
    use_plugins(use, require("plugins-ui"))
    use_plugins(use, require("plugins-git"))
    use_plugins(use, require("plugins-edit"))
    use_plugins(use, require("plugins-markdown"))
    use_plugins(use, require("plugins-code"))
    use_plugins(use, require("plugins-debug"))

    if packer_bootstrap then
        require'packer'.sync()
    end
end)
