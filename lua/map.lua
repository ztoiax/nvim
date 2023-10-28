vim.g.mapleader = "," -- set leader key

local map = vim.keymap.set
-- basic --
map("n", "j", "gj", { desc = "Move cursor down" })
map("n", "k", "gk", { desc = "Move cursor up" })

vim.cmd([[nmap <C-e> <C-u>]])
-- map("n", "<C-e>", "<C-u>")

map("n", "<Leader>w", ":w<CR>", { desc = "Save" })
map("n", "<Leader>q", ":confirm q<CR>", { desc = "Quit" })
map("n", "<C-t>", ":enew<CR>", { desc = "New File" })
map("n", "<C-p>", "<Tab>", { noremap = true })
map({ "n", "v" } , "<Leader><Leader>", "%")
map("n", "<space>", "`")
map("n", "S", ":source % <CR>")
map('n', '<Leader>p', '"0p')
map('v', '<Leader>p', '"0p')
map("n", "\\", ':%s/\\v/g<Left><Left>') -- \v模式输入regex符号时，可以不需要额外输入'\'
map("v", "\\", ':s/\\v/g<Left><Left>')
map("v", "<c-e>", "<c-u>")

-- window --
map("n", "<Leader>sw", ":only<CR>", { desc = "only current window" })
map("n", "<Leader>so", ":only<CR>", { desc = "only current window" })
map("n", "<Leader>sh", ":vsplit<cr>", { desc = "Vertical Split" })
map("n", "<Leader>sk", ":split<cr>", { desc = "Horizontal Split" })
map("n", "<Leader>sl", ":belowright vsplit<cr>", { desc = "below Vertical Split" })
map("n", "<Leader>sj", ":belowright split<cr>", { desc = "below Horizontal Split" })

map("n", "<Tab>", ":wincmd w<cr>", { desc = "below Horizontal Split" })
map("n", "<C-h>", ":wincmd h<CR>", { noremap = true })
map("n", "<C-j>", ":wincmd j<CR>", { noremap = true })
map("n", "<C-k>", ":wincmd k<CR>", { noremap = true })
map("n", "<C-l>", ":wincmd l<CR>", { noremap = true })

-- virtual --
map("n", "Y", "y$")
map("n", "y0", "v0y")
map("n", "E", "v$h")
map("n", "B", "vb")

-- emacs --
map("i", "<C-h>", "<BS>")
map("i", "<C-d>", "<Del>")
map("i", "<C-k>", "<Esc>lDa")
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-n>", "<Down>")
map("i", "<C-p>", "<Up>")
map("i", "<C-y>", "<Esc>ui")
map("i", "<C-_>", "<Esc>xi")
map("i", "<C-o>", "<Esc>o")
map("i", "<C-s>", "<Esc>:w")
map("i", "<C-q>", "<Esc>wq")

map("i", "<A-f>", "<Esc>wa")
map("i", "<A-b>", "<Esc>bi")

map("c", "<C-p>", "<S-Tab>")
map("c", "<C-k>", "<S-Tab>")
map("c", "<C-n>", "<Tab>")
map("c", "<C-j>", "<Tab>")
map("c", "<C-b>", "<Left>")
map("c", "<C-f>", "<Right>")
map("c", "<C-a>", "<Home>")
map("c", "<C-e>", "<End>")
map("c", "<C-d>", "<Del>")
map("c", "<C-h>", "<BS>")

-- toggle ui
local Util = require("function")
map("n", "<leader>us", function() Util.toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() Util.toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>un", function() Util.toggle("relativenumber") Util.toggle("number") end, { desc = "Toggle Line Numbers" })
map("n", "<leader>ul", Util.toggle_lsp, { desc = "Toggle Lsp" })
map("n", "<leader>ud", Util.toggle_diagnostics, { desc = "Toggle Diagnostics" })
map("n", "<leader>uf", Util.toggle_fold, { desc = "Toggle Fold" })

local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
map("n", "<leader>uc", function() Util.toggle("conceallevel", false, {0, conceallevel}) end, { desc = "Toggle Conceal" })

map("n", "<leader>ut", ":TSToggle highlight<cr>", { desc = "Toggle Treesistter" })
map("n", "<leader>ug", ":GitBlameToggle<cr>", { desc = "Toggle GitBlame" })
