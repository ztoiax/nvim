return {
	-- 自己
	"wbthomason/packer.nvim",

	-- 对当前缓冲区, 打开一个lua的repl
	{ "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" } },

	-- nvim lua函数
	"svermeulen/vimpeccable",

	-- lua库函数 如vim.keymap.set
	"nvim-lua/plenary.nvim",

  -- 一些库函数
  { 'echasnovski/mini.nvim', version = '*' },

  {
    'echasnovski/mini.misc',
    version = '*',
    init = function()
      local misc = require("mini.misc")
      -- 设置自动目录
      misc.setup_auto_root()
    end,
  },

	-- popup弹窗库函数
	"nvim-lua/popup.nvim",

	-- Moonscript(lua的语法糖), 实现 +=, ..=, python的列表推导式
	{ "svermeulen/nvim-moonmaker", cmd = { "Moon", "MoonCompile" } },

	-- lua写的lisp方言
	"jaawerth/fennel-nvim",

	-- fennel的repl
	-- "Olical/conjure",

	-- neovim lua开发提示
	{ "folke/neodev.nvim", opts = {} },
}
