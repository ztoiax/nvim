return {
	{
		"nvim-treesitter/nvim-treesitter",
		-- build = ":TSUpdate",
		cmd = { "TSModuleInfo", "TSUpdate", "TSInstall", "TSBufEnable", "TSBufDisable" },

		config = function()
			require("nvim-treesitter.configs").setup({
				-- parser_install_dir = "/some/path/to/store/parsers", -- 安装目录
				highlight = {
					enable = true, -- false will disable the whole extension
					-- markdown大文件，输入模式会卡
					-- disable = { "markdown" },
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

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

						-- 块选
						keymaps = {
						  -- Built-in captures.
						  ["af"] = "@function.outer",
						  ["if"] = "@function.inner",
						  ["ac"] = "@class.outer",
						  ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
						  -- You can also use captures from other query groups like `locals.scm`
              ["io"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
						},

            selection_modes = {
              ['@parameter.outer'] = 'v', -- charwise
              ['@function.outer'] = 'V', -- linewise
              ['@class.outer'] = '<c-v>', -- blockwise
            },

            include_surrounding_whitespace = true,
					},
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              --
              -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
              ["]o"] = "@loop.*",
              -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
              --
              -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
              -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
              ["]s"] = { query = "@local.scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
              ["]d"] = "@conditional.outer",
            },
            goto_previous = {
              ["[d"] = "@conditional.outer",
            }
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
	-- {
	-- 	"p00f/nvim-ts-rainbow",
	-- 	config = function()
	-- 		require("nvim-treesitter.configs").setup({
	-- 			-- 彩虹括号
	-- 			rainbow = {
	-- 				enable = true,
	-- 				extended_mode = true,
	-- 			},
	-- 		})
	-- 	end,
	-- },

  {
    "hiphish/rainbow-delimiters.nvim",
    config = function ()
      require('rainbow-delimiters.setup').setup {
        strategy = {
          -- ...
        },
        query = {
          -- ...
        },
        highlight = {
          -- ...
        },
      }
    end
  },

	-- 移动时显示函数上下文
	{
		"nvim-treesitter/nvim-treesitter-context",
		cmd = { "TSContextEnable", "TSContextDisable", "TSContextToggle" },
		config = function()
			require("treesitter-context").setup({ enable = true })
		end,
	},

  -- 自动结束某些结构（if、while等）加end。支持ruby、vimscript、lua等
  {
    "RRethy/nvim-treesitter-endwise",
		config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
            enable = true,
        },
      }
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
