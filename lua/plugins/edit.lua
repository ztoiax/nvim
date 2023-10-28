return {
	-- 注释
	{ "echasnovski/mini.comment", config = true },

	-- instead and replace
	-- "brooth/far.vim",

	{
		"windwp/nvim-spectre",
		config = function()
			require("spectre").setup({
				mapping = {
					-- 选择/取消
					["toggle_line"] = {
						map = "dd",
						cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
						desc = "toggle current item",
					},
					-- 确认
					["replace_cmd"] = {
						map = "<cr>",
						cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
						desc = "input replace vim command",
					},
					["open"] = {
						map = "<cr>",
						cmd = "<cmd>lua require('spectre').open_file_search()<cr>",
						desc = "open",
					},
				},
			})

			vim.keymap.set("n", "<leader>\\", ":lua require('spectre').open_file_search()<cr>")
		end,
	},

	-- enhance di da
	"wellle/targets.vim",

	-- 单词跳转
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					-- 是否开启f、F按键
					enabled = true,
					jump_labels = true,
					keys = { f = "f", F = "F", t = "t", T = nil },
				},
			},
		},
		keys = {
			{
				"<leader>fw",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			-- treesitter块选
			{
				"<leader>v",
				mode = { "n", "x", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			-- { "+", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
			-- { "=", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	},

	-- 快速添加特殊符号--(<[]>)--'
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()

			vim.cmd("nmap s  ys")
			vim.cmd("vmap s  S")
		end,
	},

	-- 增强vi和va等操作，可以实现vi)i)、viw(a(
	{ "echasnovski/mini.ai", version = "*", config = true },

	-- 替换和驼峰命名
	"tpope/vim-abolish",

	-- split, false to true, 驼峰命名
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		opts = {},
		config = function()
			vim.keymap.set(
				{ "n" },
				"<leader>e",
				require("ts-node-action").node_action,
				{ desc = "Trigger Node Action" }
			)
		end,
	},

	-- 可重复插件操作
	"tpope/vim-repeat",

	-- 多行对齐
	{
		"echasnovski/mini.align",
		version = "*",
		config = function()
			require("mini.align").setup({
				mappings = {
					start = "<leader>ia",
					start_with_preview = "<leader>iA",
				},
			})
		end,
	},

	-- 光标多选
	{
		"smoka7/multicursors.nvim",
		event = "VeryLazy",
		dependencies = {
			"smoka7/hydra.nvim",
		},
		opts = {},
		cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
		keys = {
			{
				mode = { "v", "n" },
				"<Leader>I",
				"<cmd>MCstart<cr>",
				desc = "Create a selection for selected text or word under the cursor",
			},
		},
	},

	-- autopairs
	{ "echasnovski/mini.pairs", event = "InsertEnter", config = true },

	-- 参数位置交换
	{
		"mizlan/iswap.nvim",
		opts = {},
		config = function()
			vim.keymap.set("n", "<leader>rl", ":ISwapNodeWithRight<cr>")
			vim.keymap.set("n", "<leader>rh", ":ISwapNodeWithLeft<cr>")
			vim.keymap.set("n", "<leader>is", ":ISwapWith<cr>")
		end,
	},

	-- 函数、语句跳转和块选
	{
		"ziontee113/syntax-tree-surfer",
		config = function()
			require("edit/map-syntax-tree-surfer")
		end,
	},

	-- 改名。没有treesitter那个好用
	-- {
	--   'filipdutescu/renamer.nvim',
	--   config = function ()
	--     require('renamer').setup({})
	--     vim.api.nvim_set_keymap('n', '<leader>rw', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
	--     vim.api.nvim_set_keymap('v', '<leader>rw', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
	--   end
	-- },

	-- 块选
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("wildfire").setup({
				surrounds = {
					{ "(", ")" },
					{ "{", "}" },
					{ "<", ">" },
					{ "[", "]" },
				},
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					node_decremental = "<BS>",
				},
				filetype_exclude = { "qf" }, --keymaps will be unset in excluding filetypes
			})
		end,
	},

	-- 块选后移动
	{
		"echasnovski/mini.move",
		version = "*",
		config = function()
			require("mini.move").setup({
				-- Module mappings. Use `''` (empty string) to disable one.
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = "<M-h>",
					right = "<M-l>",
					down = "<M-j>",
					up = "<M-k>",

					-- Move current line in Normal mode
					line_left = "<M-h>",
					line_right = "<M-l>",
					line_down = "<M-j>",
					line_up = "<M-k>",
				},

				-- Options which control moving behavior
				options = {
					-- Automatically reindent selection during linewise vertical move
					reindent_linewise = true,
				},
			})
		end,
	},

	-- marks
	-- "chentau/marks.nvim",

	-- fzf api
	"vijaymarupudi/nvim-fzf",

	-- fzf
	-- {
	-- 	"ibhagwan/fzf-lua",
	-- 	config = function()
	-- 		require("edit/init-fzf")
	-- 	end,
	-- },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",

      -- undo tree
			{
				"debugloop/telescope-undo.nvim",
				config = function()
          require("telescope").load_extension("undo")
          vim.keymap.set('n', '<leader>u', require("telescope").extensions.undo.undo, {})
        end,
			},
			-- fzf
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
          require("telescope").load_extension("fzf")
          require("telescope").setup {
	          extensions = {
		          fzf = {
			          fuzzy = true, -- false will only do exact matching
			          override_generic_sorter = true, -- override the generic sorter
			          override_file_sorter = true, -- override the file sorter
			          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
		          },
	          },
	        }
        end,
			},
      -- 自定义命令的menu
      "octarect/telescope-menu.nvim",
      -- luasnip片段
      {
        "benfowler/telescope-luasnip.nvim",
        init = function ()
          require('telescope').load_extension('luasnip')
          vim.keymap.set('n', '<leader>fs', require"telescope".extensions.luasnip.luasnip, {})
        end
      },
      -- lazy插件管理器
      "tsakirist/telescope-lazy.nvim",
      -- 支持git的diffview插件
      {
        "paopaol/telescope-git-diffs.nvim",
        config = function ()
          require('telescope').load_extension('git_diffs')
          vim.keymap.set('n', '<leader>gD', require"telescope".extensions.git_diffs.diff_commits, {})
        end
      },
      -- 使用frecency算法对oldfiles排序，会保存一个sqlite
      {
        "nvim-telescope/telescope-frecency.nvim",
        config = function()
          require("telescope").load_extension "frecency"
          require("telescope").setup {
            extensions = {
              frecency = {
                show_scores = true,
                show_unindexed = true,
                max_timestamps = 10, -- 10个条目
                ignore_patterns = { "*.git/*", "*/tmp/*" },
                workspaces = {
                  ["conf"]    = "~/.config",
                },
                -- 需要sqlite.lua 插件
                use_sqlite = false,
                -- db_root = vim.fn.stdpath "data", -- ~/.local/share/nvim
              }
            },

            vim.keymap.set("n", "<leader>fm", require"telescope".extensions.frecency.frecency, {})
          }
        end,
      },
		},
		config = function()
			require("edit/init-telescope")
		end,
	},

	-- sudo
	"lambdalisue/suda.vim",

	-- 异步执行shell命令
	-- {
	-- 	"skywind3000/asyncrun.vim",
	-- 	config = function ()
	--
	--     vim.keymap.set("n", "<leader>ie", ":execute getline(line('.'))<cr>", { desc = "Run the current line" })
	--     vim.keymap.set("n", "<leader>el", ":execute '!'.getline('.')<cr>", { desc = "Run the current line in sh" })
	--     vim.keymap.set("n", "<leader>io", ":AsyncRun! -mode=term ")
	--     vim.keymap.set("n", "<leader>ii", ":AsyncRun! ")
	--     vim.keymap.set("n", "<leader>il", ":AsyncRun! -mode=term ")
	--     vim.keymap.set("n", "<leader>il", ":execute 'AsyncRun! -mode=term '.getline('.')<cr>", { desc = "Run the current line in terminal" })
	-- 	end
	-- },

	-- 部分代码运行
	{ "michaelb/sniprun", build = "bash ./install.sh" },

	-- 数据库
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = "tpope/vim-dadbod",
		event = "VeryLazy",
		config = function()
			-- 数据库路径
			vim.cmd([[
          let g:dbs = [
          \ { 'name': 'sqlite-search.db', 'url': 'sqlite:~/.mybin/search.db' },
          \ { 'name': 'mysql', 'url': 'mysql://tz@127.0.0.1' },
          \ { 'name': 'redis', 'url': 'redis:' },
          \ ]
      ]])
		end,
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},

  -- sqlite
  "kkharji/sqlite.lua",

	-- ansible
	{
		"pearofducks/ansible-vim",
		init = function()
			local function yaml_ft(path, bufnr)
				-- get content of buffer as string
				local content = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
				if type(content) == "table" then
					content = table.concat(content, "\n")
				end

				-- check if file is in roles, tasks, or handlers folder
				local path_regex = vim.regex("(tasks\\|roles\\|handlers)/")
				if path_regex and path_regex:match_str(path) then
					return "yaml.ansible"
				end
				-- check for known ansible playbook text and if found, return yaml.ansible
				local regex = vim.regex("hosts:\\|tasks:")
				if regex and regex:match_str(content) then
					return "yaml.ansible"
				end

				-- return yaml if nothing else
				return "yaml"
			end

			vim.filetype.add({
				extension = {
					yml = yaml_ft,
					yaml = yaml_ft,
				},
			})
		end,
		ft = "yaml.ansible",
	},

	-- gx命令打开网页连接
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true,
	},
}
