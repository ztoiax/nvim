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
            keys = { f = 'f', F = 'F', t = 't', T = '', },
        },
      },
    },
    keys = {
      { "<leader>fw", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      -- treesitter块选
      { "<leader>v", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
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
  { 'echasnovski/mini.ai', version = '*', config = true },

	-- 替换和驼峰命名
	"tpope/vim-abolish",

  -- split, false to true, 驼峰命名
	 {
	   'ckolkey/ts-node-action',
	   dependencies = { 'nvim-treesitter' },
	   opts = {},
	   config = function ()
	     vim.keymap.set({ "n" }, "<leader>e", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
	   end
	 },

	-- 可重复插件操作
	"tpope/vim-repeat",

	-- 多行对齐
	{
		"junegunn/vim-easy-align",
	   config = function ()
	     vim.keymap.set( { "n", "x" }, "<leader>ia", "<Plug>(EasyAlign)")
	   end
	},

	-- 光标多选
	{
	  "otavioschwanck/cool-substitute.nvim",
	  config = function ()
	   require'cool-substitute'.setup({
        setup_keybindings = true,
      })
	  end
	},
	{
	  "mg979/vim-visual-multi",
	   config = function ()
	     vim.cmd([[
	       let g:VM_maps = {}
	       let g:VM_maps['Motion ,'] = ',,'
	       let g:VM_maps["Switch Mode"]                 = '<Tab>'
	       let g:VM_maps["Find Next"]                   = ']'
	       let g:VM_maps["Find Prev"]                   = '['
	       let g:VM_maps["Goto Next"]                   = '}'
	       let g:VM_maps["Goto Prev"]                   = '{'
	       let g:VM_maps["Seek Next"]                   = '<C-f>'
	       let g:VM_maps["Seek Prev"]                   = '<C-b>'
	       let g:VM_maps["Skip Region"]                 = 'n'
	       let g:VM_maps["Remove Region"]               = 'q'
	       let g:VM_maps["Invert Direction"]            = 'o'
	       let g:VM_maps["Find Operator"]               = "m"
	       let g:VM_maps["Surround"]                    = 's'
	       let g:VM_maps["Replace Pattern"]             = 'r'
	       nmap <Leader>I <Plug>(VM-Select-All)
	       ]])
	   end
	},

	-- autopairs
	{ "echasnovski/mini.pairs", event = "InsertEnter", config = true },

	-- 参数位置交换
	{
		"mizlan/iswap.nvim",
		opts = {},
		config = function ()
			vim.keymap.set("n", "<leader>rl", ":ISwapNodeWithRight<cr>")
			vim.keymap.set("n", "<leader>rh", ":ISwapNodeWithLeft<cr>")
			vim.keymap.set("n", "<leader>is", ":ISwapWith<cr>")
		end
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
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require("mini.move").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<M-h>',
          right = '<M-l>',
          down = '<M-j>',
          up = '<M-k>',

          -- Move current line in Normal mode
          line_left = '<M-h>',
          line_right = '<M-l>',
          line_down = '<M-j>',
          line_up = '<M-k>',
        },

        -- Options which control moving behavior
        options = {
          -- Automatically reindent selection during linewise vertical move
          reindent_linewise = true,
        },
      })
    end
  },

	-- marks
	-- "chentau/marks.nvim",

	-- fzf api
	"vijaymarupudi/nvim-fzf",

	-- fzf
	{
		"ibhagwan/fzf-lua",
		config = function()
			require("edit/init-fzf")
		end,
	},

	-- telescope
	-- {
	--     "nvim-telescope/telescope.nvim",
	--     dependencies = {
	--       "nvim-lua/plenary.nvim",
	--       "debugloop/telescope-undo.nvim",
	--     },
	--     config = function()
	--         require("edit/init-telescope")
	--         require("telescope").load_extension("undo")
	--         -- optional: vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
	--     end,
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
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		config = function ()
		  -- 数据库路径
		  vim.cmd([[
          let g:dbs = [
          \ { 'name': 'sqlite-search.db', 'url': 'sqlite:/home/tz/.mybin/search.db' },
          \ ]
      ]])
		end
	},

	"tami5/sqlite.lua",

  -- github命令
	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true,
	},
}
