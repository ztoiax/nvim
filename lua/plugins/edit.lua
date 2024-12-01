return {
	-- 注释
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },

  -- toggle booleans
  {
    "nat-418/boole.nvim",
		config = function()
      require('boole').setup({
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>'
        },
        -- User defined loops
        additions = {
          -- {'Foo', 'Bar'},
          -- {'tic', 'tac', 'toe'}
        },
        allow_caps_additions = {
          {'enable', 'disable'}
          -- enable → disable
          -- Enable → Disable
          -- ENABLE → DISABLE
        }
      })
    end
  },

	-- instead and replace
  {
	  "chrisgrieser/nvim-rip-substitute",
	  cmd = "RipSubstitute",
	  keys = {
		  {
			  "<leader>\\",
			  function() require("rip-substitute").sub() end,
			  mode = { "n", "x" },
			  desc = " rip substitute",
		  },
	  },
  },

  -- {
  --   'MagicDuck/grug-far.nvim',
  --   config = function()
  --     require('grug-far').setup({
  --
  --       vim.keymap.set("n", "<leader>\\", ":lua require('grug-far').grug_far({ prefills = { flags = vim.fn.expand('%') } })<cr>"),
  --       vim.keymap.set("v", "<leader>\\", ":<C-u>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand('%') } })")
  --     });
  --
  --   end
  -- },

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
					keys = { f = "f", F = "F", t = nil, T = nil },
				},
			},
		},
		keys = {
	     {
				"<leader>fl",
				mode = { "n", "x", "o" },
				function()
				  -- 行
	         require("flash").jump({
	           search = { mode = "search", max_length = 0 },
	           label = { after = { 0, 0 } },
	           pattern = "^"
	         })
				end,
				desc = "Flash",
			},
			-- {
			-- 	"<leader>fw",
			-- 	mode = { "n", "x", "o" },
			-- 	function()
			-- 		require("flash").jump()
			-- 	end,
			-- 	desc = "Flash",
			-- },
			-- 2个字符匹配
	     {
				"<leader>fw",
				mode = { "n", "x", "o" },
				function()
	         local Flash = require("flash")

	         ---@param opts Flash.Format
	         local function format(opts)
	           -- always show first and second label
	           return {
	             { opts.match.label1, "FlashMatch" },
	             { opts.match.label2, "FlashLabel" },
	           }
	         end

	         Flash.jump({
	           search = { mode = "search" },
	           label = { after = false, before = { 0, 0 }, uppercase = false, format = format },
	           pattern = [[\<]],
	           action = function(match, state)
	             state:hide()
	             Flash.jump({
	               search = { max_length = 0 },
	               highlight = { matches = false },
	               label = { format = format },
	               matcher = function(win)
	                 -- limit matches to the current label
	                 return vim.tbl_filter(function(m)
	                   return m.label == match.label and m.win == win
	                 end, state.results)
	               end,
	               labeler = function(matches)
	                 for _, m in ipairs(matches) do
	                   m.label = m.label2 -- use the second label
	                 end
	               end,
	             })
	           end,
	           labeler = function(matches, state)
	             local labels = state:labels()
	             for m, match in ipairs(matches) do
	               match.label1 = labels[math.floor((m - 1) / #labels) + 1]
	               match.label2 = labels[(m - 1) % #labels + 1]
	               match.label = match.label1
	             end
	           end,
	         })
				end,
				desc = "Flash",
			},
	     {
				"<leader>W",
				mode = { "n", "x", "o" },
				function()
				  -- 块选单词
	         require("flash").jump({
	           pattern = ".", -- initialize pattern with any char
	           search = {
	             mode = function(pattern)
	               -- remove leading dot
	               if pattern:sub(1, 1) == "." then
	                 pattern = pattern:sub(2)
	               end
	               -- return word pattern and proper skip pattern
	               return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
	             end,
	           },
	           -- select the range
	           jump = { pos = "range" },
	         })
				end,
				desc = "Flash",
			},
	     {
				"<leader>fW",
				mode = { "n", "x", "o" },
				function()
				  -- 匹配当前单词
	         require("flash").jump({
	           pattern = vim.fn.expand("<cword>"),
	         })
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
			require("nvim-surround").setup({
        keymaps = {
            insert = "<C-g>s",
            insert_line = "<C-g>S",
            normal = "s",
            normal_cur = "yss",
            normal_line = "yS",
            normal_cur_line = "S",
            visual = "s",
            visual_line = "S",
            delete = "ds",
            change = "cs",
            change_line = "cS",
        },
        surrounds = {
          ["c"] = {
              add = { "```", "```" },
              find = function()
                  return M.get_selection({ motion = "a```" })
              end,
              delete = "^(.)().-(.)()$",
          },
        },
      })
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

  -- 简化宏
  {
    "chrisgrieser/nvim-recorder",
    dependencies = "rcarriga/nvim-notify",
    keys = {
      -- these must match the keys in the mapping config below
      { "q", desc = " Start Recording" },
      { "Q", desc = " Play Recording" },
    },
    config = function()
      require("recorder").setup({
  	    mapping = {
  		    startStopRecording = "q",
  		    playMacro = "Q",
  	    },
      })
    end,
  },

  -- 远程ssh文件
  -- :RemoteSSHFSConnect root@192.168.100.208:/
  {
    "nosduco/remote-sshfs.nvim",
    config = function ()
      require('remote-sshfs').setup({
        mounts = {
          base_dir = vim.fn.expand "$HOME" .. "/.sshfs/", -- base directory for mount points
          unmount_on_exit = true, -- run sshfs as foreground, will unmount on vim exit
        },
      })
      require('telescope').load_extension 'remote-sshfs'
    end
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
	-- {
	-- 	"smoka7/multicursors.nvim",
	-- 	event = "VeryLazy",
	-- 	dependencies = {
	-- 		"smoka7/hydra.nvim",
	-- 	},
	-- 	opts = {},
	-- 	cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
	-- 	keys = {
	-- 		{
	-- 			mode = { "v", "n" },
	-- 			"<Leader>I",
	-- 			"<cmd>MCstart<cr>",
	-- 			desc = "Create a selection for selected text or word under the cursor",
	-- 		},
	-- 	},
	-- },

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
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" }} },
    cmd = { "Browse" },
    init = function ()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,

    -- config = true, -- default settings
    config = function() require("gx").setup {
          open_browser_app = "google-chrome-stable", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
          open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
          handlers = {
            plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
            github = true, -- open github issues
            brewfile = true, -- open Homebrew formulaes and casks
            package_json = true, -- open dependencies from package.json
            search = true, -- search the web/selection on the web if nothing else is found
          },
          handler_options = {
            search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
            -- search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
          },
        } end,
  },
}
