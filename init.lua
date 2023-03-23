vim.cmd([[
    source ~/.config/nvim/config/set.vim
    " source ~/.config/nvim/config/keysound.vim

    " map
    source ~/.config/nvim/config/map.vim
    source ~/.config/nvim/config/emacs-map.vim
    source ~/.config/nvim/config/window-map.vim

    " snippets
    source  ~/.config/nvim/snippets/md.vim
]])
require("plugins-lazy")
require("debug/init-dap")
require("function")
require("nvim-surround").setup()
