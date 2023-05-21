require("set")
require("map")
vim.cmd([[
    "source ~/.config/nvim/config/set.vim

    " map
    " source ~/.config/nvim/config/map.vim
    " source ~/.config/nvim/config/emacs-map.vim
    " source ~/.config/nvim/config/window-map.vim

    " snippets
    source  ~/.config/nvim/snippets/md.vim
]])
require("plugins-lazy")
require("debug/init-dap")
require("function")
