require("plugins")
require("lsp")
vim.cmd([[
    source ~/.config/nvim/config/set.vim
    " source ~/.config/nvim/config/keysound.vim
    source ~/.config/nvim/config/fzf-leaderf.vim

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
require("init-dap")
require("function")
