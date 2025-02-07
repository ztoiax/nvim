vim.opt.shortmess:append { s = true, I = true }         -- disable startup message
vim.opt.diffopt:append "linematch:60"                   -- enable linematch diff algorithm
vim.opt.clipboard = "unnamedplus"                       -- 剪切板
vim.opt.fileencoding = "utf-8"                          -- 编码
vim.opt.history = 100                                   -- 命令行历史记录数量
vim.opt.ignorecase = true                               -- 不区分大小写
vim.opt.infercase = true                                -- 大小写补全
vim.opt.smartcase = true                                -- 搜大写时不显示小写
vim.opt.mouse = "a"                                     -- 开启鼠标
vim.opt.number = true                                   -- 显示行号
vim.opt.relativenumber = true                           -- 显示相对行
vim.opt.autochdir = false                                -- 根据当前文件，自动切换目录
vim.opt.autoread = true                                 -- 文件发生外部改变，会自动更新，并发出提示
vim.opt.swapfile = false                                -- 关闭swap file
vim.opt.conceallevel = 0                                -- 关闭隐藏keyword

vim.opt.scrolloff = 8         -- Number of lines to keep above and below the cursor
vim.opt.sidescrolloff = 8     -- Number of columns to keep at the sides of the cursor
vim.opt.splitbelow = true     -- 在下方开启新窗口
vim.opt.splitright = true     -- 在右方开启新窗口
vim.opt.undofile = false      -- 是否开启永久撤销
vim.opt.writebackup = false   -- 是否开启备份文件
vim.opt.timeoutlen = 500      -- Shorten key timeout length a little bit for which-key
vim.opt.updatetime = 300      -- Length of time to wait before triggering the plugin
vim.opt.virtualedit = "block" -- allow going past end of line in visual block mode

-- 界面
vim.opt.laststatus = 3        -- globalstatus
vim.opt.pumheight = 10        -- Height of the pop up menu
vim.opt.cmdheight = 0         -- 底部栏高度
vim.opt.signcolumn = "auto:4" -- 左边数字栏可以同时显示多个状态（git、diagnostics……）
vim.opt.showtabline = 2       -- 顶部栏
vim.opt.showmode = false      -- 是否在底部栏显示当前状态（NORMAL, INSERT...）
vim.opt.fillchars = { vert = "|", fold = "-", eob = " " } -- 设置 fillchars 为 vert:|, fold:-, eob:空格
vim.diagnostic.config({ virtual_text = false }) -- 关闭默认diagnostic诊断

-- tab，空格，换行
vim.opt.preserveindent = true -- Preserve indent structure as much as possible
vim.opt.smartindent = false   -- Smarter autoindentation。如果是true。markdown文件中，对于开头是#的行，无法按>>进行缩进。
vim.opt.expandtab = true      -- 空格代替tab

vim.opt.shiftwidth = 2        -- 多少个空格为一个tab
vim.opt.tabstop = 2           -- Number of space in a tab
vim.opt.softtabstop = 2       -- Number of space in a tab
vim.opt.copyindent = true     -- 是否根据语法自动缩进，默认为false根据上一行缩进
vim.opt.linebreak = false     -- 单词中间换行
vim.opt.wrap = true           -- 长行会在第二行显示

-- 命令参数
vim.opt.grepprg = "rg\\ --vimgrep\\ --smart-case\\ --no-heading"
-- %f：文件名。
-- %l：行号。
-- %c：列号。
-- %m：匹配的文本。
vim.opt.grepformat = { "%f:%l:%c:%m" }
vim.opt.errorformat = { "%f:%l:%c:%m" }

-- tab 字符的显示
vim.g.list = true
vim.opt.listchars = {
    tab = "»·",
    trail = "∙",
    precedes = "←",
    extends = "→",
    eol = "¬",
    nbsp = "␣",
}

-- highlight
vim.opt.cursorline = true    -- highlight 当前行
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.g.icons_enabled = true   -- 启用icons
vim.g.highlighturl_enabled = true     -- highlight URLs by default

-- menu
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- 补全菜单
vim.g.cmp_enabled = true              -- enable completion at start

-- vim.g
vim.g.autoformat_enabled = true       -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
vim.g.codelens_enabled = true         -- enable or disable automatic codelens refreshing for lsp that support it
vim.g.lsp_handlers_enabled = true     -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
vim.g.autopairs_enabled = true        -- enable autopairs at start
vim.g.diagnostics_mode = 3            -- set the visibility of diagnostics in the UI (0=off 1=only show in status line 2=virtual text off 3=all on)
vim.g.icons_enabled = true            -- disable icons in the UI (disable if no nerd font is available)
vim.g.ui_notifications_enabled = true -- disable notifications when toggling UI elements

-- diagnostic
vim.diagnostic.config{
  virtual_text = {
    virt_text_pos = 'eol_right_align',
  },
}

-- 关闭默认的文件管理器
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
