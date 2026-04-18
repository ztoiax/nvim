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

  { "rcarriga/nvim-dap-ui", enabled = false },
  -- 引入了独立的 Debug Mode（类似于 Insert 或 Normal Mode，但专为调试而设计）并紧密集成到该插件提供的 UI 中。
  {
    "miroshQa/debugmaster.nvim",
     -- osv is needed if you want to debug neovim lua code. Also can be used 
     -- as a way to quickly test-drive the plugin without configuring debug adapters 
    dependencies = { "mfussenegger/nvim-dap", "jbyuki/one-small-step-for-vimkind", },
    config = function()
      local dm = require("debugmaster")
      -- make sure you don't have any other keymaps that starts with "<leader>d" to avoid delay
      -- Alternative keybindings to "<leader>d" could be: "<leader>m", "<leader>;"
      vim.keymap.set({ "n", "v" }, "<leader>d", dm.mode.toggle, { nowait = true })
      -- If you want to disable debug mode in addition to leader+d using the Escape key:
      -- vim.keymap.set("n", "<Esc>", dm.mode.disable)
      -- This might be unwanted if you already use Esc for ":noh"
      vim.keymap.set("t", "<C-\\>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

      dm.plugins.osv_integration.enabled = true -- needed if you want to debug neovim lua code
      local dap = require("dap")
      -- Configure your debug adapters here
      -- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
    end
  },

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
