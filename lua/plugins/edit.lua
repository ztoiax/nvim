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
				},
			})

			vim.cmd([[
                nnoremap <leader>\ viw:lua require('spectre').open_file_search()<cr>
            ]])
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
			vim.cmd([[
              nmap <Leader>f1 :HopChar1<CR>
              nmap <Leader>f2 :HopChar2<CR>
              nmap <Leader>fl :HopLine<CR>
              nmap <Leader>fw :HopWord<CR>
          ]])
		end,
	},

	-- 块选单词跳转
	{
		"mfussenegger/nvim-treehopper",
		config = function()
			require("tsht").config.hint_keys = { "h", "j", "f", "d", "n", "v", "s", "l", "a" }
			vim.cmd([[
                omap     <silent> <leader>f :<C-U>lua require('tsht').nodes()<CR>
                xnoremap <silent> <leader>f :lua require('tsht').nodes()<CR>
            ]])
		end,
	},

	-- extends f
	{
		"rhysd/clever-f.vim",
		vim.cmd([[
	     let g:clever_f_ignore_case = 1 " Ignore case (忽略大小写)
	     let g:clever_f_chars_match_any_signs = ';'
	     let g:clever_f_not_overwrites_standard_mappings = 1

	     nmap ; <Plug>(clever-f-repeat-forward)
	     nmap ' <Plug>(clever-f-repeat-back)

	     nmap f <Plug>(clever-f-f)
	     xmap f <Plug>(clever-f-f)
	     omap f <Plug>(clever-f-f)
	     nmap F <Plug>(clever-f-F)
	     xmap F <Plug>(clever-f-F)
	     omap F <Plug>(clever-f-F)
	 ]]),
	},

	-- 快速添加特殊符号--(<[]>)--'
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})

			vim.cmd([["
            nmap s  ys
            vmap s  S
            ]])
		end,
	},

	-- 替换和驼峰命名
	"tpope/vim-abolish",

	-- 可重复插件操作
	"tpope/vim-repeat",

	-- 多行对齐
	{
		"junegunn/vim-easy-align",
		vim.cmd([[
        xmap <Leader>ia <Plug>(EasyAlign)
        nmap <Leader>ia <Plug>(EasyAlign)
    ]]),
	},

	-- toggler bool
  {
    "rmagatti/alternate-toggler",
    event = { "BufReadPost" },
    config = function()
      require("alternate-toggler").setup {
        alternates = {
          ["=="] = "!="
        }
      }

      vim.keymap.set( "n", "<leader><space>", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
    end,
  },

	-- 光标多选
	-- "mg979/vim-visual-multi",

	-- autopairs
	{ "echasnovski/mini.pairs", event = "InsertEnter", config = true },

  -- splitjoin
  {
    "echasnovski/mini.splitjoin",
    config = function ()
			require("mini.splitjoin").setup({
        mappings = {
          toggle = '<leader>s',
          split = '',
          join = '',
        },
			})
    end
  },

	-- 参数位置交换
	{
		"mizlan/iswap.nvim",
		config = true,
		vim.cmd([[
            nmap <leader>rl :ISwapNodeWithRight<cr>
            nmap <leader>rh :ISwapNodeWithLeft<cr>
            nmap <leader>is :ISwapWith<CR>
        ]]),
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
		vim.cmd([[
        nmap <leader>ie :execute getline(line('.'))<cr> " Run the current line
        " nmap <leader>el :execute '!'.getline('.')<cr> " Run the current line in sh
        " nmap <Leader>ii :.!
        nmap <Leader>io :AsyncRun! -mode=term 
        nmap <Leader>ii :AsyncRun! 
        nmap <leader>il :execute 'AsyncRun! -mode=term '.getline('.')<cr> " Run the current line in terminal
    ]]),
	},

	-- 部分代码运行
	{ "michaelb/sniprun", build = "bash ./install.sh" },

	-- 数据库
	"tpope/vim-dadbod",
	{
		"kristijanhusak/vim-dadbod-ui",
		-- 数据库路径
		vim.cmd([[
        let g:dbs = [
        \ { 'name': 'sqlite-search.db', 'url': 'sqlite:/home/tz/.mybin/search.db' },
        \ ]
    ]]),
	},

	"tami5/sqlite.lua",

	{
		"chrishrb/gx.nvim",
		event = { "BufEnter" },
		config = true,
	},
}
