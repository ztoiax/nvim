return {
	------ test ------
	"roxma/nvim-yarp",
	"roxma/vim-hug-neovim-rpc",

	{
		"nvim-neotest/neotest",
		dependencies = {
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-python",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
      "nvim-neotest/nvim-nio",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python")({
						dap = { justMyCode = false },
					}),
					require("neotest-plenary"),
					require("neotest-vim-test")({
						ignore_file_types = { "python", "vim", "lua" },
					}),
				},
			})
		end,
	},

	------ dap ------
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "thehamsta/nvim-dap-virtual-text" },
	},

	-- nvim lua dap
	"jbyuki/one-small-step-for-vimkind",

	-- "mfussenegger/nvim-dap-python",

	------- formatting ------

	{
		"mhartington/formatter.nvim",
		cmd = { "Format", "FormatWrite" },
		config = function()
			require("debug/init-formatter")
		end,
	},
}
