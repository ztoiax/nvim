return {
	-- 在 vim 里使用 git
	{
		"tpope/vim-fugitive",
    init = function ()
		  vim.cmd([[
        let g:fugitive_no_maps = v:true
      ]])
			vim.keymap.set("n", "<leader>gd", "<Cmd>Gvdiffsplit<CR>")
    end
	},

	-- magit
	"jreybert/vimagit",

	-- 当前行显示commit信息
	{
		"f-person/git-blame.nvim",
    confing = function ()
		  vim.cmd([[ let g:gitblame_date_format = '%x, %X']])
    end
	},

	-- 显示文件变动
	{ "lewis6991/gitsigns.nvim", config = true },

	-- diff 当前项目
	{
	  "sindrets/diffview.nvim",
	  ops = {},
	  config = function ()
			vim.keymap.set("n", "<leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "当前文件的历史git "})

      local diffview_TOGGLE = 0

      function diffview_key_TOGGLE()
	      if diffview_TOGGLE == 0 then
		      vim.cmd(":DiffviewOpen")
		      diffview_TOGGLE = 1
	      else
		      vim.cmd(":DiffviewClose")
		      diffview_TOGGLE = 0
	      end
      end
      vim.keymap.set("n", "<leader>gD", "<Cmd>lua diffview_key_TOGGLE()<CR>")
			-- vim.keymap.set("n", "<leader>gD", "<Cmd>DiffviewOpen<CR>")
			-- vim.keymap.set("n", "<leader>gD", "<Cmd>DiffviewClose<CR>")
	  end
	},

	-- github
	{
		"ldelossa/gh.nvim",
		dependencies = { "ldelossa/litee.nvim" },
		config = function()
			require("litee.lib").setup()
			require("litee.gh").setup()
		end,
	},
}
