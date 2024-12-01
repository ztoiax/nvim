-- https://github.com/mhartington/formatter.nvim/blob/master/CONFIG.md
require("formatter").setup({
	filetype = {
		json = {
			function()
				return {
					exe = "prettier",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote" },
					stdin = true,
				}
			end,
		},
		toml = {
			function()
				return {
					exe = "taplo",
					args = { "--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), "--double-quote" },
					stdin = true,
				}
			end,
		},
		python = {
			function()
				return {
					exe = "ruff",
					args = {
						"format",
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
					},
					stdin = false,
				}
			end,
		},
		-- python = {
		-- 	function()
		-- 		return {
		-- 			exe = "python3 -m autopep8",
		-- 			args = {
		-- 				"--in-place --aggressive --aggressive",
		-- 				vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
		-- 			},
		-- 			stdin = false,
		-- 		}
		-- 	end,
		-- },
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
						-- "--config-path "
						--   .. os.getenv("XDG_CONFIG_HOME")
						--   .. "/stylua/stylua.toml",
						-- "-",
					},
					stdin = false,
				}
			end,
		},
		go = {
			function()
				return {
					exe = "gofumpt",
					stdin = true,
				}
			end,
		},
		rust = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout", "--edition=2021" },
					stdin = true,
				}
			end,
		},
		c = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end,
		},
		cpp = {
			function()
				return {
					exe = "clang-format",
					args = { "--assume-filename", vim.api.nvim_buf_get_name(0) },
					stdin = true,
					cwd = vim.fn.expand("%:p:h"), -- Run clang-format in cwd of the file.
				}
			end,
		},
		dockerfile = {
			function()
				return {
					exe = "dockfmt",
					args = { "fmt -w", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
		markdown = {
			function()
				return {
					exe = "markdownlint",
					-- exe = "markdownfmt",
					args = { "-w", vim.api.nvim_buf_get_name(0) },
					stdin = true,
				}
			end,
		},
	},
})
