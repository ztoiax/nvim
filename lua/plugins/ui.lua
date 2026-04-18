return {

	-- 主题
	{
		"nvimdev/oceanic-material",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- 默认为50
		-- config = function() vim.cmd.colorscheme("oceanic_material")
		--  vim.o.background = "dark"
		-- end,
	},
	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- vim.cmd.colorscheme("bluloco")
			-- vim.o.background = "dark"
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("gruvbox")
			-- vim.o.background = "dark"
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("tokyonight")
			-- vim.o.background = "dark"
		end,
	},

	{
		"uloco/bluloco.nvim",
		lazy = false,
		priority = 1000,
		dependencies = { "rktjmp/lush.nvim" },
		config = function()
			-- vim.cmd.colorscheme("bluloco")
			-- vim.o.background = "dark"
		end,
	},

	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- vim.cmd.colorscheme("gruvbox")
			-- vim.o.background = "dark"
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("tokyonight")
			-- vim.o.background = "dark"
		end,
	},

	{
		"nvimdev/zephyr-nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- 默认为50
		config = function()
			vim.cmd.colorscheme("zephyr")
			vim.o.background = "dark"
		end,
	},

	-- {
	-- 	"AstroNvim/astrotheme",
	-- 	config = function()
	-- 		require("astrotheme").setup({})
	-- 		vim.cmd.colorscheme("astrotheme")
	-- 	end,
	--    vim.o.background = "dark"
	-- },

	-- {
	--     "rebelot/kanagawa.nvim",
	--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--     priority = 1000, -- make sure to load this before all the other start plugins
	--     config = function()
	--         vim.cmd.colorscheme "kanagawa"
	--         vim.o.background = "dark"
	--     end,
	-- },

	-- 运行GUI应用程序
	-- {'altermo/nwm', branch='x11'},

	-- 图标(icons)
	{ "kyazdani42/nvim-web-devicons", lazy = true },

	-- 动态光标
	-- {
	--   "sphamba/smear-cursor.nvim",
	--   opts = {                         -- Default  Range
	--     stiffness = 0.8,               -- 0.6      [0, 1]
	--     trailing_stiffness = 0.6,      -- 0.3      [0, 1]
	--     trailing_exponent = 0,         -- 0.1      >= 0
	--     distance_stop_animating = 0.5, -- 0.1      > 0
	--     hide_target_hack = false,      -- true     boolean
	--   },
	-- },

	-- 各种功能集合
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			-- 动画库
			animate = {},
			-- 检测到大文件就自动阻止LSP和Treesitter等附加到缓冲区
			bigfile = {
				enabled = true,
				notify = true, -- show notification when big file detected
				size = 1.5 * 1024 * 1024, -- 1.5MB
			},
			-- 启动界面
			dashboard = {
				-- 主题
				example = "compact_files",

				preset = {
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep_args" },
						{ icon = " ", key = "r", desc = "Recent Files", action = "Telescope frecency" },
						{
							icon = " ",
							key = "c",
							desc = "Config",
							action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
						},
						{ icon = " ", key = "s", desc = "Restore Session", action = ":Persisted load_last" },
						{
							icon = "󰩡",
							key = "L",
							desc = "Lazy",
							action = ":Lazy",
							enabled = package.loaded.lazy ~= nil,
						},
						{
							icon = " ",
							key = "M",
							desc = "Mason",
							action = ":Mason",
							enabled = package.loaded.lazy ~= nil,
						},
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
			},
			-- nvim debug
			debug = { enabled = true },
			-- 专注当前函数、调暗其他部分
			dim = { enabled = true },
			-- markdown文件显示图片
			image = {},
			-- 导航线
			indent = { enabled = true },
			-- input函数
			input = { enabled = true },
			-- blame
			git = { enabled = false },
			-- 在浏览器打开当前github仓库，并定位到当前行
			gitbrowse = { enabled = true },
			-- lazygit
			lazygit = { enabled = false },
			-- 文件管理器
			explorer = {},
			-- 类似telescope
			picker = { enabled = false },
			-- 通知
			notifier = { enabled = true },
			notify = { enabled = true },
			-- lua性能分析器
			profiler = { enabled = false },
			-- 在插件加载之前渲染文件
			quickfile = {
				enabled = true,
				exclude = { "markdown" },
			},
			-- 平滑移动动画
			scroll = { enabled = true },
			-- 类似vscode那样的方式启动终端
			terminal = { enabled = true },
			-- 这个插件的功能开关
			toggle = { enabled = true },
		},
		keys = {
			{
				"<leader>.",
				function()
					Snacks.scratch()
				end,
				desc = "Toggle Scratch Buffer",
			},
			{
				"<leader>S",
				function()
					Snacks.scratch.select()
				end,
				desc = "Select Scratch Buffer",
			},
			{
				"gX",
				function()
					Snacks.gitbrowse()
				end,
				desc = "Git Browse",
				mode = { "n", "v" },
			},
			-- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
			{
				"<leader>gg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>gl",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Lazygit Log (cwd)",
			},
			{
				"<leader>fR",
				function()
					Snacks.explorer()
				end,
				desc = "Lazygit Log (cwd)",
			},
			{
				"<leader>fn",
				function()
					Snacks.notifier.show_history()
				end,
				desc = "Notification History",
			},
			{
				"<c-w>",
				function()
					Snacks.bufdelete()
				end,
				desc = "which_key_ignore",
			},
			{
				"<leader>un",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss All Notifications",
			},
			{
				"<c-/>",
				function()
					Snacks.terminal()
				end,
				desc = "Toggle Terminal",
			},
			{
				"<c-_>",
				function()
					Snacks.terminal()
				end,
				desc = "which_key_ignore",
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "VeryLazy",
				callback = function()
					-- debug
					_G.dd = function(...)
						Snacks.debug.inspect(...)
					end
					_G.bt = function()
						Snacks.debug.backtrace()
					end
					vim.print = _G.dd -- Override print to use snacks for `:=` command

					-- toggle ui
					local Util = require("function")
					vim.keymap.set("n", "<leader>ul", Util.toggle_lsp, { desc = "Toggle Lsp" })
					vim.keymap.set("n", "<leader>uf", Util.toggle_fold, { desc = "Toggle Fold" })
					vim.keymap.set("n", "<leader>ug", ":GitBlameToggle<cr>", { desc = "Toggle GitBlame" })
					vim.keymap.set("n", "<leader>um", ":RenderMarkdown toggle<cr>", { desc = "Toggle RenderMarkdown" })
					vim.keymap.set("n", "<leader>uh", ":TSHighlightDisable<cr>", { desc = "Toggle RenderMarkdown" })

					Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
					Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
					Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
					Snacks.toggle.diagnostics():map("<leader>ud")
					Snacks.toggle.line_number():map("<leader>uN")
					Snacks.toggle
						.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
						:map("<leader>uc")
					Snacks.toggle.treesitter():map("<leader>ut")
					Snacks.toggle
						.option("background", { off = "light", on = "dark", name = "Dark Background" })
						:map("<leader>ub")
					Snacks.toggle.inlay_hints():map("<leader>uh")
					Snacks.toggle.indent():map("<leader>ui")
					Snacks.toggle.dim():map("<leader>uD")
				end,
			})
		end,
	},

	-- 通知menu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	-- highlight whitespace
	-- {
	--   "lukoshkin/highlight-whitespace",
	--   config=true,
	-- },

	-- highlight自己块选的行。块选在执行:HSHighlight 0  数字表示颜色有0-9种
	{
		"pocco81/highstr.nvim",
		keys = {
			{ "<F3>", ":<c-u>HSHighlight 1 <cr>", mode = "v", desc = "高亮选中的字符" },
			{ "<F4>", ":<c-u>HSRmHighlight <cr>", mode = "v", desc = "取消高亮" },
		},
	},

	-- highlight 光标所在的单词当前单词，并有动画
	{
		"tzachar/local-highlight.nvim",
		event = "VeryLazy",
		config = true,
	},

	-- statuscolumn左边栏
	{
		"luukvbaal/statuscol.nvim",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{ text = { builtin.foldfunc }, click = "v:lua.ScFa" }, -- 折叠列
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" }, -- 行号列
					{ text = { "%s" }, click = "v:lua.ScSa" },
				},
			})
		end,
	},

	-- winbar
	{
		"Bekaboo/dropbar.nvim",
		-- optional, but required for fuzzy finder support
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		config = function()
			local dropbar_api = require("dropbar.api")
			vim.keymap.set("n", "<Leader>o", dropbar_api.pick, { desc = "Pick symbols in winbar" })
			vim.keymap.set("n", "[o", dropbar_api.goto_context_start, { desc = "Go to start of current context" })
			vim.keymap.set("n", "]o", dropbar_api.select_next_context, { desc = "Select next context" })
		end,
	},

	-- 底部栏
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"meuter/lualine-so-fancy.nvim",
		},
		config = function()
			require("lualine").setup({
				options = {
					-- theme = "auto",
					theme = "seoul256",
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					disabled_filetypes = { "NvimTree", "aerial" },
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = {
						-- "mode",
					},
					lualine_b = {
						{ "fancy_branch" },
						{ "fancy_diff" },
					},
					lualine_c = {
						{ "fancy_cwd", substitute_home = true },
					},
					lualine_x = {
						{ "fancy_macro" },
						{ "fancy_diagnostics" },
						{ "fancy_searchcount" },
						{ "progress" },
						{ "fancy_location" },
						-- { "filesize" },
					},
					lualine_y = {
						{ "fancy_filetype", ts_icon = "" },
						{ require("recorder").displaySlots },
					},
					lualine_z = {
						{ "fancy_lsp_servers" },
						{ require("recorder").recordingStatus },
					},
				},
				inactive_sections = {},
				tabline = {},
				-- 和dropbar插件有冲突
				-- winbar = {
				-- 	lualine_b = {
				-- 		-- "aerial", -- 侧边栏aerial插件
				-- 	},
				-- },
				inactive_winbar = {},
				extensions = { "man", "fzf", "lazy", "mason", "nvim-dap-ui" },
			})
		end,
	},

	-- 顶部栏tabline
	{
		"akinsho/bufferline.nvim",
		config = function()
			require("bufferline").setup({

				options = {
					separator_style = "thin",

					indicator = {
						icon = "▎", -- this should be omitted if indicator style is not 'icon'
						style = "icon",
					},

					-- 悬浮
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},

					-- 显示diagnostics
					-- diagnostics = "nvim_lsp",
					-- diagnostics_update_in_insert = true,
					-- -- The diagnostics indicator can be set to nil to keep the buffer name highlight but delete the highlighting
					-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
					--     local icon = level:match("error") and " " or " "
					--     return " " .. icon .. count
					-- end,
				},
			})

			local kopts = { noremap = true, silent = true }
			vim.keymap.set({ "n" }, "<A-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", kopts)
			vim.keymap.set({ "n" }, "<A-0>", "<Cmd>BufferLineGoToBuffer -1<CR>", kopts)

			vim.keymap.set({ "n" }, "L", "<Cmd>BufferLineCycleNext<CR>", kopts)
			vim.keymap.set({ "n" }, "H", "<Cmd>BufferLineCyclePrev<CR>", kopts)

			vim.keymap.set({ "n" }, "<leader>>>", "<Cmd>BufferLineMoveNext<CR>", kopts)
			vim.keymap.set({ "n" }, "<leader><<", "<Cmd>BufferLineMovePrev<CR>", kopts)

			-- vim.keymap.set({ "n" }, "<C-w>", "<Cmd>bdelete!<CR>", kopts)
			-- vim.keymap.set({ "n" }, "X", "<C-^>", kopts)
		end,
	},

	-- mark
	-- {
	--     "chentoast/marks.nvim",
	--     config = function ()
	--         require("marks").setup {
	--           mappings = {
	--             set_next = "m,",
	--             next = "m]",
	--             preview = "m:",
	--             set_bookmark0 = "m0",
	--             prev = false -- pass false to disable only this default mapping
	--           }
	--         }
	--     end
	-- },

	-- highlight / * #
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
			-- map
			local kopts = { noremap = true, silent = true }

			vim.keymap.set(
				"n",
				"n",
				[[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.keymap.set(
				"n",
				"N",
				[[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
				kopts
			)
			vim.keymap.set("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.keymap.set("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.keymap.set("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
			vim.keymap.set("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
		end,
	},

	-- 搜索后自动取消highlight
	{ "nvimdev/hlsearch.nvim", config = true },

	-- highlight cursor pairs
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
		config = function()
			require("sentiment").setup({})
			vim.cmd([[highlight MatchParen cterm=bold ctermbg=red ctermfg=yellow guibg=#878791 guifg=#ddcfbf]])
		end,
	},

	-- highlight color
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},

	-- 块选后搜索功能
	{
		"Ajnasz/nvim-rfind",
		opts = {},
		config = function()
			-- require("rfind").setup()
			local rfind = require("rfind")
			vim.keymap.set("x", "/", rfind.visual)
			vim.keymap.set("n", "<F7>", rfind.visual)
		end,
	},

	-- open old file
	{
		"echasnovski/mini.bracketed",
		config = function()
			require("mini.bracketed").setup()
			vim.keymap.set("n", "X", ":lua require('mini.bracketed').oldfile('backward')<cr>")
		end,
	},

	-- 高亮代码块
	-- {
	--     "HampusHauffman/block.nvim",
	--     config = function()
	--         require("block").setup({
	--           percent = 0.8,
	--           depth = 4,
	--           colors = nil,
	--           -- 自动开启
	--           automatic = true,
	--   --      bg = nil,
	--   --      colors = {
	--   --          "#ff0000"
	--   --          "#00ff00"
	--   --          "#0000ff"
	--   --      },
	--     })
	--     end
	-- },

	-- 浮动终端窗口
	{
		"is0n/fm-nvim",
		opts = {
			ui = {
				-- Default UI (can be "split" or "float")
				default = "float",

				float = {
					-- Floating window border (see ':h nvim_open_win')
					border = "none",

					-- Highlight group for floating window/border (see ':h winhl')
					float_hl = "Normal",
					border_hl = "FloatBorder",

					-- Floating Window Transparency (see ':h winblend")
					blend = 0,

					-- Num from 0 - 1 for measurements
					height = 0.9,
					width = 0.9,

					-- X and Y Axis of Window
					x = 0.6,
					y = 0.6,
				},
			},

			-- Terminal commands used w/ file manager (have to be in your $PATH)
			cmds = {
				lf_cmd = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
				fm_cmd = "fm",
				nnn_cmd = "nnn",
				fff_cmd = "fff",
				twf_cmd = "twf",
				fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
				fzy_cmd = "find . | fzy",
				xplr_cmd = "xplr",
				vifm_cmd = "vifm",
				skim_cmd = "sk",
				broot_cmd = "broot",
				gitui_cmd = "gitui",
				ranger_cmd = "ranger",
				joshuto_cmd = "joshuto",
				-- lazygit_cmd = "lazygit",
				neomutt_cmd = "neomutt",
				taskwarrior_cmd = "taskwarrior-tui",
			},

			-- Mappings used with the plugin
			mappings = {
				vert_split = "<C-v>",
				horz_split = "<C-h>",
				tabedit = "<C-t>",
				edit = "<C-e>",
				ESC = "<ESC>",
			},

			-- Path to broot config
			broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson",
		},
		config = function()
			-- vim.keymap.set("n", "<Leader>fr", ":Ranger<cr>")
			-- vim.keymap.set("n", "<Leader>gg", ":Lazygit<cr>")
		end,
	},

	{
		"mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
		event = "VeryLazy",
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				"<leader>fr",
				mode = { "n", "v" },
				"<cmd>Yazi<cr>",
				desc = "Open yazi at the current file",
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,
			keymaps = {
				show_help = "<f1>",
			},
		},
	},

	-- 翻译
	-- {
	-- 	"uga-rosa/translate.nvim",
	--   config = function()
	-- 	  vim.api.nvim_set_keymap('n', '<leader>tr', "viw:Translate ZH -output=replace<CR>", { noremap = true, silent = true })
	-- 	  vim.api.nvim_set_keymap('v', '<leader>tr', ":'<,'>Translate ZH -output=replace<CR>", { noremap = true, silent = true })
	-- 	  vim.api.nvim_set_keymap('n', '<leader>ts', "viw:Translate ZH<CR>", { noremap = true, silent = true })
	-- 	  vim.api.nvim_set_keymap('v', '<leader>ts', ":'<,'>Translate ZH<CR>",
	-- 		  { noremap = true, silent = true })
	-- 	  require("translate").setup({
	-- 		  default = {
	-- 			  command = "translate_shell",
	-- 		  },
	-- 		  preset = {
	-- 			  command = {
	-- 				  translate_shell = {
	-- 					  args = { "-e", "bing" }
	-- 				  }
	-- 			  }
	-- 		  }
	-- 	  })
	--   end
	--  },

	{
		"JuanZoran/Trans.nvim",
		build = function()
			require("Trans").install()
		end,
		keys = {
			-- 可以换成其他你想映射的键
			{ "te", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
			{ "tr", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
			-- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
			{ "tt", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
		},
		dependencies = { "kkharji/sqlite.lua" },
		opts = {
			-- your configuration there
		},
	},

	-- lsp侧边栏
	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				attach_mode = "global",
				layout = { min_width = 28 },
				show_guides = true,
				filter_kind = false,
				guides = {
					mid_item = "├ ",
					last_item = "└ ",
					nested_top = "│ ",
					whitespace = "  ",
				},
			})

			vim.keymap.set("n", "T", ":AerialToggle<cr>")
		end,
	},

	-- 类似vscode 的minimap侧边栏
	{
		"echasnovski/mini.map",
		version = "*",
		config = function()
			local map = require("mini.map")
			require("mini.map").setup({
				-- integration
				integrations = {
					-- map.gen_integration.builtin_search(),
					map.gen_integration.diagnostic(),
					map.gen_integration.gitsigns(),
				},
			})

			vim.keymap.set("n", "<leader>T", ":lua MiniMap.toggle()<cr>")
		end,
	},

	-- yank history
	{
		"ptdewey/yankbank-nvim",
		cmd = { "YankHistory" },
		keys = {
			{ "<leader>y", ":YankBank <cr>", mode = "n" },
		},
		config = function()
			require("yankbank").setup({
				max_entries = 12,
				sep = "",
				keymaps = {
					navigation_next = "j",
					navigation_prev = "k",
				},
				num_behavior = "prefix",
			})
		end,
	},

	-- 多窗口下，根据当前窗口位置，自动调整窗口大小
	-- {
	--     "anuvyklack/windows.nvim",
	--     dependencies = {
	--         "anuvyklack/middleclass",
	--         "anuvyklack/animation.nvim"
	--     },
	--     config = true
	-- },

	-- session
	-- Lua
  {
    "olimorris/persisted.nvim",
    opts = {},
  },

	-- menu
	{ "nvchad/volt", lazy = true },

	{
		"nvchad/menu",
		lazy = true,
		opts = true,
		vim.keymap.set("n", "<leader>m", function()
			require("menu").open("default")
		end, {}),
	},

	-- 折叠代码
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()
			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					vim.opt.foldcolumn = "1" -- 开启折叠列
					-- vim.opt.foldlevelstart = 99 -- start with all code unfolded
					vim.opt.foldenable = true -- enable fold for nvim-ufo
					vim.opt.foldlevel = 99 -- set high foldlevel for nvim-ufo
					vim.opt.fillchars = {
						foldopen = "",
						foldclose = "",
						foldsep = "│",
						fold = "·",
						diff = "/",
						eob = " ", -- use 'space' for lines after the last buffer line in a window
					}

					vim.keymap.set("n", "zR", require("ufo").openAllFolds)
					vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
					vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
					vim.keymap.set("n", "zm", require("ufo").closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
					vim.keymap.set("n", "zp", require("ufo").peekFoldedLinesUnderCursor) -- closeAllFolds == closeFoldsWith(0)
					return { "treesitter", "indent" }
				end,
			})
		end,
	},

	-- 按键提示
	-- {
	--   "folke/which-key.nvim",
	--   event = "VeryLazy",
	--   opts = {
	--     -- your configuration comes here
	--     -- or leave it empty to use the default settings
	--     -- refer to the configuration section below
	--   },
	--   keys = {
	--     {
	--       "<leader>?",
	--       function()
	--         require("which-key").show({ global = false })
	--       end,
	--       desc = "Buffer Local Keymaps (which-key)",
	--     },
	--   },
	-- },

	-- visual模式下使用Norm命令，可以实时显示
	{
		"smjonas/live-command.nvim",
		-- live-command supports semantic versioning via tags
		-- tag = "1.*",
		config = function()
			require("live-command").setup({
				commands = {
					Norm = { cmd = "norm" },
				},
			})
		end,
	},

	-- 运行shell命令的，任务管理器
	{
		"stevearc/overseer.nvim",
		cmd = { "OverseerToggle", "OverseerRun" },
		opts = {},
	},

	-- Better quickfix window
	{
		"kevinhwang91/nvim-bqf",
		ft = "qf",
		config = true,
	},

  -- 在短时间内阻止重复按键
  -- 提供更高效的 Vim motion 提示
  -- 报告你最常犯的坏习惯
  -- {
  --   "m4xshen/hardtime.nvim",
  --   lazy = false,
  --   dependencies = { "MunifTanjim/nui.nvim" },
  --   opts = {},
  -- },

	-- 中文分词跳转
	{
    "kkew3/jieba.vim",
    tag = "v2.1.0",
    build = ":call jieba_vim#install()",
    init = function()
      vim.g.jieba_vim_lazy = 1
      vim.g.jieba_vim_keymap = 1
    end,
  },
}
