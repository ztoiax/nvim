require("plugins")
vim.cmd([[
    source ~/.config/nvim/config/set.vim
    " source ~/.config/nvim/config/keysound.vim

    " ui
    source ~/.config/nvim/config/markdown.vim
    source ~/.config/nvim/config/barbar.vim

    " map
    source ~/.config/nvim/config/map.vim
    source ~/.config/nvim/config/emacs-map.vim
    source ~/.config/nvim/config/window-map.vim

    " snippets
    source  ~/.config/nvim/snippets/md.vim
]])
require("debug/init-dap")
require("function")
require("edit/map-syntax-tree-surfer")
require("edit/init-fzf")
-- require("edit/init-telescope")
