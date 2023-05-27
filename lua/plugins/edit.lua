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
		"phaazon/hop.nvim",
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			vim.keymap.set("n", "<leader>f1", ":HopChar1<cr>")
			vim.keymap.set("n", "<leader>f2", ":HopChar2<cr>")
			vim.keymap.set("n", "<leader>fl", ":HopLine<cr>")
			vim.keymap.set("n", "<leader>fw", ":HopWord<cr>")
		end,
	},

	-- 块选单词跳转
	{
		"mfussenegger/nvim-treehopper",
		config = function()
			require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
			vim.keymap.set("o", "<leader>f", ":<C-U>lua require('tsht').nodes()<CR>")
			vim.keymap.set("x", "<leader>f", ":lua require('tsht').nodes()<CR>")
		end,
	},

	-- extends f
	{
	  'echasnovski/mini.jump',
	  opts = {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        forward = 'f',
        backward = 'F',
        forward_till = 't',
        backward_till = '\'',
        repeat_jump = ';',
      },
	  },
	},

	-- {
	-- 	"rhysd/clever-f.vim",
	-- 	config = function ()
	-- 	  vim.cmd([[
	--        let g:clever_f_ignore_case = 1 " Ignore case (忽略大小写)
	--        let g:clever_f_chars_match_any_signs = ';'
	--        let g:clever_f_not_overwrites_standard_mappings = 1
	--
	--        nmap ; <Plug>(clever-f-repeat-forward)
	--        nmap ' <Plug>(clever-f-repeat-back)
	--
	--        nmap f <Plug>(clever-f-f)
	--        xmap f <Plug>(clever-f-f)
	--        omap f <Plug>(clever-f-f)
	--        nmap F <Plug>(clever-f-F)
	--        xmap F <Plug>(clever-f-F)
	--        omap F <Plug>(clever-f-F)
	--     ]])
	-- 	end
	-- },

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

	-- 替换和驼峰命名
	"tpope/vim-abolish",

	-- 可重复插件操作
	"tpope/vim-repeat",

	-- 多行对齐
	{
		"junegunn/vim-easy-align",
    config = function ()
      vim.keymap.set( { "n", "x" }, "<leader>ia", "<Plug>(EasyAlign)")
    end
	},

	-- toggler bool
  {
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" },
    config = function()
      require("alternate-toggler").setup {
        alternates = {
          ["=="] = "!=",
          [">="] = "<=",
        }
      }

      vim.keymap.set( "n", "<leader><space>", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
    end,
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

  -- splitjoin
  {
    "echasnovski/mini.splitjoin",
    config = function ()
			require("mini.splitjoin").setup({
        mappings = {
          toggle = '<leader>S',
          split = '',
          join = '',
        },
			})
    end
  },

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
	{
		"skywind3000/asyncrun.vim",
		config = function ()

	    vim.keymap.set("n", "<leader>ie", ":execute getline(line('.'))<cr>", { desc = "Run the current line" })
	    vim.keymap.set("n", "<leader>el", ":execute '!'.getline('.')<cr>", { desc = "Run the current line in sh" })
	    vim.keymap.set("n", "<leader>io", ":AsyncRun! -mode=term ")
	    vim.keymap.set("n", "<leader>ii", ":AsyncRun! ")
	    vim.keymap.set("n", "<leader>il", ":AsyncRun! -mode=term ")
	    vim.keymap.set("n", "<leader>il", ":execute 'AsyncRun! -mode=term '.getline('.')<cr>", { desc = "Run the current line in terminal" })
		end
	},

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

	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true,
	},
}
