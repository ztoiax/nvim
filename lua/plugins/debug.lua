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
		"mfussenegger/nvim-dap",
		dependencies = {
			{ "igorlfs/nvim-dap-view", opts = {} },
		},
	},

	-- nvim lua dap
	"jbyuki/one-small-step-for-vimkind",

	-- "mfussenegger/nvim-dap-python",

	------- formatting ------

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				-- Customize or remove this keymap to your liking
				"<F7>",
				function()
					require("conform").format({ async = true })
					vim.notify("conform.nvim：已完成自动格式化（format）", vim.log.levels.INFO)
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		init = function()
			-- If you want the formatexpr, here is the place to set it
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					c = { "clang-format" },
					cpp = { "clang-format" },
					cuda = { "clang-format-cuda" },
					lua = { "stylua" },
					-- Conform will run multiple formatters sequentially
					python = { "ruff", "yapf" },
					go = { "gofumpt", "gofmt" },
					sh = { "shfmt" },
					nix = { "nixfmt" },
					java = { "google-java-format" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					typescript = { "prettierd", "prettier", stop_after_first = true },
					json = { "prettierd" },
					html = { "prettierd" },
					yaml = { "prettierd" },
					xml = { "prettierd" },
					css = { "prettierd" },
					toml = { "taplo" },
					markdown = { "markdownlint", "prettierd" },
					typst = { "typstyle" },
					sql = { "sqlfmt" },
					cmake = { "gersemi" },
					dockerfile = { "dockfmt" },
					nginx = { "nginxbeautifier" },
					-- Use the "*" filetype to run formatters on all filetypes.
					["*"] = { "codespell" },
					-- Use the "_" filetype to run formatters on filetypes that don't
					-- have other formatters configured.
					["_"] = { "trim_whitespace" },
				},

				-- 格式化命令的默认参数：https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
				-- Customize formatters
				formatters = {
					["clang-format-cuda"] = { command = "clangd", args = { "--style=google" } },
					shfmt = {
						prepend_args = { "-i", "2" },
					},
				},

				-- Set default options
				default_format_opts = {
					lsp_format = "fallback",
				},
			})

			-- 每次buffer写入时自动格式化
			-- vim.api.nvim_create_autocmd("BufWritePre", {
			--   pattern = "*",
			--   callback = function(args)
			--     require("conform").format({ bufnr = args.buf })
			--     vim.notify("conform.nvim：已完成自动格式化（format）", vim.log.levels.INFO )
			--   end,
			-- })
		end,
	},
}
