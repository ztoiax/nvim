return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		cmd = { "TSModuleInfo", "TSUpdate", "TSInstall", "TSBufEnable", "TSBufDisable" },

		config = function()
			require("nvim-treesitter.configs").setup({
				-- parser_install_dir = "/some/path/to/store/parsers", -- 安装目录
				highlight = {
					enable = true, -- false will disable the whole extension
					disable = { "markdown" },
					additional_vim_regex_highlighting = false, -- highlight, 可能会变卡
				},
				ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
				auto_install = true, -- 进入缓冲区时自动安装缺少的解析器

				-- 等于号=缩进
				indent = { enable = true },

				-- 块选
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "gnr",
						scope_incremental = "gnc",
						node_decremental = "gnm",
					},
				},
			})

		  vim.cmd([[
		      " 折叠
		      set foldmethod=expr
		      set foldexpr=nvim_treesitter#foldexpr()
		    ]])
		end,
	},

	-- 语法树库函数
	-- {
	--     "nvim-treesitter/playground",
	--     build = ":TSInstall query",
	--     cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
	-- },

	--
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,
						-- 块选
						-- keymaps = {
						--   -- Your custom capture.
						--   ["O"] = "@custom-capture",
						--
						--   -- Built-in captures.
						--   ["oo"] = "@function.outer",
						--   ["oi"] = "@function.inner",
						--   ["oc"] = "@class.outer",
						--   ["oa"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						--   -- You can also use captures from other query groups like `locals.scm`
						--   ["os"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						-- },
					},
				},
			})
		end,
	},

	-- 块选
	{
		"RRethy/nvim-treesitter-textsubjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textsubjects = {
					enable = true,
					keymaps = {
						["<cr>"] = "textsubjects-smart",
						["O"] = "textsubjects-container-outer",
						["o"] = "textsubjects-container-inner",
					},
				},
			})
		end,
	},

	-- rename, 函数跳转
	{
		"nvim-treesitter/nvim-treesitter-refactor",
		config = function()
			require("nvim-treesitter.configs").setup({
				refactor = {
					highlight_definitions = { enable = true },
					-- highlight_current_scope = { enable = true },
					smart_rename = {
						enable = true,
						keymaps = {
							smart_rename = ",rw",
						},
					},
					navigation = {
						enable = true,
						keymaps = {
							goto_definition = ",k",
							goto_next_usage = ",j",
							-- goto_previous_usage = ",j",

							list_definitions = "gK",
							list_definitions_toc = "gk",
						},
					},
				},
			})
		end,
	},

	-- 彩虹括号
	{
		"p00f/nvim-ts-rainbow",
		config = function()
			require("nvim-treesitter.configs").setup({
				-- 彩虹括号
				rainbow = {
					enable = true,
					extended_mode = true,
				},
			})
		end,
	},

	-- 移动时显示函数上下文
	{
		"nvim-treesitter/nvim-treesitter-context",
		cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
		config = function()
			require("treesitter-context").setup({ enable = true })
		end,
	},

	-- highlight if, else语法块
	{
		"andymass/vim-matchup",
		config = function()
			require("nvim-treesitter.configs").setup({ matchup = { enable = true } })
		end,
	},

	-- highlight 同一单词
	-- {
	--     "David-Kunz/markid",
	--     -- config = function() require("nvim-treesitter.configs").setup({ markid = { enable = true } })end
	-- },

	-- highlight 参数
	{ "m-demare/hlargs.nvim", config = true },
}
