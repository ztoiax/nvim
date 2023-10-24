return {
	-- 主题
	{
		"glepnir/oceanic-material",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- 默认为50
		config = function()
			vim.cmd.colorscheme("oceanic_material")
		end,
	},

	-- {
	-- 	"AstroNvim/astrotheme",
	-- 	config = function()
	-- 		require("astrotheme").setup({})
	-- 		vim.cmd.colorscheme("astrotheme")
	-- 	end,
	-- },

	-- {
	--     "rebelot/kanagawa.nvim",
	--     lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--     priority = 1000, -- make sure to load this before all the other start plugins
	--     config = function()
	--         -- load the colorscheme here
	--         -- vim.cmd.colorscheme "kanagawa"
	--     end,
	-- },

	-- 图标(icons)
	{ "kyazdani42/nvim-web-devicons", lazy = true },

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

  -- 文件管理器
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			require("nvim-tree").setup({
				sort_by = "case_sensitive",
				view = {
					width = 20,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
		end,
	},

  -- 增强cmdline
  {
    "gelguy/wilder.nvim",
    event = 'CmdlineEnter', -- 懒加载：首次进入cmdline时载入
    config = function()
      local wilder = require('wilder')
      wilder.setup({
        modes = { ':', '/', '?' },
        next_key = 0, previous_key = 0, reject_key = 0, accept_key = 0
      })
      vim.api.nvim_command("silent! UpdateRemotePlugins") -- 需要载入一次py依赖 不然模糊过滤等失效
      -- 设置source
      wilder.set_option('pipeline', {
        wilder.branch(
          -- 当默认无输入时 展示15条历史记录
          {
            wilder.check(function (_, x) return vim.fn.empty(x) end),
            wilder.history(15)
          },
          -- 当输入时 展示所有匹配项(模糊匹配)
          wilder.cmdline_pipeline({
            fuzzy = 1,
            fuzzy_filter = wilder.vim_fuzzy_filter()
          }),
          -- pipeline for search
          wilder.search_pipeline()
        ),
      })
      -- 设置样式
      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          -- 设置特定高亮
          highlights = {
            accent = "WilderAccent",
            selected_accent = "WilderSelectedAccent",
          },
          highlighter = wilder.basic_highlighter(),
          left = { ' ', wilder.popupmenu_devicons() },   -- 左侧加入icon
          right = { ' ', wilder.popupmenu_scrollbar() }, -- 右侧加入滚动条
          border = 'rounded',
          max_height = 17 -- 最大高度限制 因为要计算上下 所以17支持最多15个选项
        })
      ))
      -- 设置高亮
      vim.api.nvim_set_hl(0, 'WilderAccent', { fg = '#5f87ff' })
      vim.api.nvim_set_hl(0, 'WilderSelectedAccent', { fg = '#5f87ff', bg = '#4e4e4e' })
      -- 设置快捷键
      vim.api.nvim_set_keymap('c', '<tab>', [[wilder#in_context() ? wilder#next() : '<tab>']],   { noremap = true, expr = true })
      vim.api.nvim_set_keymap('c', '<c-j>', [[wilder#in_context() ? wilder#next() : '<down>']], { noremap = true, expr = true })

      vim.api.nvim_set_keymap('c', '<S-tab>', [[wilder#in_context() ? wilder#previous() : '<up>']], { noremap = true, expr = true })
      vim.api.nvim_set_keymap('c', '<c-k>', [[wilder#in_context() ? wilder#previous() : '<up>']], { noremap = true, expr = true })
      vim.api.nvim_set_keymap('c', '0', '0', {}) -- 不清楚原因导致0无法使用 强制覆盖
    end
  },

  -- winbar
  { 'Bekaboo/dropbar.nvim' },

	-- 底部栏
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"meuter/lualine-so-fancy.nvim",
		},
		config = function()
			require("lualine").setup({
				options = {
					-- theme = "OceanicNext",
					-- theme = bubbles_theme,
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
					},
					lualine_z = {
						{ "fancy_lsp_servers" },
					},
				},
				inactive_sections = {},
				tabline = {},
				winbar = {
					lualine_b = {
						-- "aerial", -- 侧边栏aerial插件
					},
				},
				inactive_winbar = {},
				extensions = { "man", "fzf", "symbols-outline", "lazy", "mason", "nvim-dap-ui" },
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

			vim.keymap.set({ "n" }, "<C-w>", "<Cmd>bdelete!<CR>", kopts)
			-- vim.keymap.set({ "n" }, "X", "<C-^>", kopts)
		end,
	},

	-- 通知menu
	-- { "rcarriga/nvim-notify", config = 'vim.notify = require("notify")' },

	-- {
	--     "folke/noice.nvim",
	--     dependencies = {
	--         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--         "MunifTanjim/nui.nvim",
	--         -- OPTIONAL:
	--         --   `nvim-notify` is only needed, if you want to use the notification view.
	--         --   If not available, we use `mini` as the fallback
	--         "rcarriga/nvim-notify",
	--     },
	--     config = function()
	--         require("noice").setup({
	--             lsp = {
	--                 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	--                 override = {
	--                   ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--                   ["vim.lsp.util.stylize_markdown"] = true,
	--                   ["cmp.entry.get_documentation"] = true,
	--                 },
	--             },
	--             -- you can enable a preset for easier configuration
	--             presets = {
	--               bottom_search = true, -- use a classic bottom cmdline for search
	--               command_palette = false, -- position the cmdline and popupmenu together
	--               long_message_to_split = true, -- long messages will be sent to a split
	--               inc_rename = false, -- enables an input dialog for inc-rename.nvim
	--               lsp_doc_border = false, -- add a border to hover docs and signature help
	--             },
	--         })
	--     end,
	-- },

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
  { 'nvimdev/hlsearch.nvim', config = true },

	-- highlight cursor pairs
  {
    "utilyre/sentiment.nvim",
    version = "*",
    event = "VeryLazy", -- keep for lazy loading
    init = function()
      -- `matchparen.vim` needs to be disabled manually in case of lazy loading
      vim.g.loaded_matchparen = 1
    end,
    config = function ()
      require("sentiment").setup({})
      vim.cmd([[highlight MatchParen cterm=bold ctermbg=red ctermfg=yellow guibg=#878791 guifg=#ddcfbf]])
    end
  },

	-- highlight identline导航线
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({
				options = { try_as_border = true },
				symbol = "│",
			})

			-- 颜色
			vim.api.nvim_command("highlight MiniIndentscopeSymbol guifg=orange")
		end,
	},

	-- highlight color
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
	     require'colorizer'.setup()
		end
	},

  -- 块选后搜索功能
  {
    "Ajnasz/nvim-rfind",
    opts = {},
    config = function ()
      -- require("rfind").setup()
      local rfind = require("rfind")
      vim.keymap.set("x", "/", rfind.visual)
      vim.keymap.set("n", "<F7>", rfind.visual)
    end
  },

	-- 快速移动
	-- {
	-- 	"rainbowhxch/accelerated-jk.nvim",
	-- 	vim.cmd([[
	--            nmap j <Plug>(accelerated_jk_gj)
	--            nmap k <Plug>(accelerated_jk_gk)
	--            ]]),
	-- },

	-- 移动动画
	"psliwka/vim-smoothie",

	-- 窗口动画
	-- {
	-- 	"camspiers/animate.vim",
	-- 	opts = {},
	-- 	config = function()
	-- 		vim.keymap.set("n", "<Up>", ":call animate#window_delta_height(10)<CR>")
	-- 		vim.keymap.set("n", "<Down>", ":call animate#window_delta_height(-10)<CR>")
	-- 		vim.keymap.set("n", "<Left>", ":call animate#window_delta_width(10)<CR>")
	-- 		vim.keymap.set("n", "<Right>", ":call animate#window_delta_width(-10)<CR>")
	-- 	end,
	-- },

  -- open old file
	{
		"echasnovski/mini.bracketed",
		config = function()
      require('mini.bracketed').setup()
			vim.keymap.set("n", "X", ":lua require('mini.bracketed').oldfile('backward')<cr>")
		end,
	},

	-- 浮动终端窗口
	-- {
	-- 	"akinsho/toggleterm.nvim",
	-- 	cmd = { "ToggleTerm", "TermExec" },
	-- 	config = function()
	-- 		require("toggleterm").setup({
	-- 			size = 10,
	--                hidden = true,
	--                close_on_exit = true,
	-- 			on_create = function()
	-- 				vim.opt.foldcolumn = "0"
	-- 				vim.opt.signcolumn = "no"
	-- 			end,
	-- 			open_mapping = [[<F7>]],
	-- 			shading_factor = 2,
	-- 			direction = "float",
	-- 			float_opts = {
	-- 				border = "curved",
	-- 				highlights = { border = "Normal", background = "Normal" },
	-- 			},
	--
	-- 		})
	--
	-- 		local Terminal = require("toggleterm.terminal").Terminal
	--
	-- 		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
	-- 		function _lazygit_toggle()
	-- 			lazygit:toggle()
	-- 		end
	-- 		vim.keymap.set("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
	--
	--            local ranger = Terminal:new({ cmd = "ranger", hidden = true , close_on_exit = true})
	-- 		function _ranger_toggle()
	-- 			ranger:toggle()
	-- 		end
	-- 		vim.keymap.set("n", "<leader>fr", "<cmd>lua _ranger_toggle()<CR>", { noremap = true, silent = true })
	-- 	end,
	-- },

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
		},
		config = function()
			vim.keymap.set("n", "<Leader>fr", ":Ranger<cr>")
			vim.keymap.set("n", "<Leader>gg", ":Lazygit<cr>")
		end,
	},

	-- 翻译
	-- {
	-- 	"JuanZoran/Trans.nvim",
	-- 	build = function()
	-- 		require("Trans").install()
	-- 	end,
	-- 	keys = {
	-- 		-- 可以换成其他你想映射的键
	-- 		{ "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = " Translate" },
	-- 		{ "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
	-- 		-- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
	-- 		{ "mi", "<Cmd>TranslateInput<CR>", desc = " Translate From Input" },
	-- 	},
	-- 	dependencies = { "kkharji/sqlite.lua" },
	-- 	opts = {
	-- 		-- your configuration there
	-- 	},
	-- },

	{
		"voldikss/vim-translator",
		opts = {},
		config = function()
			vim.cmd([[
	       " let g:translator_history_enable = 1
	       let g:translator_default_engines = get(g:, 'translator_default_engines', ['bing'])
	       " let g:translator_proxy_url = ''
	       let g:translator_window_type = 'popup'

	       nmap <silent> <Leader>te <Plug>Translate
	       vmap <silent> <Leader>te <Plug>TranslateV
	       " Display translation in a window
	       nmap <silent> <Leader>tw <Plug>TranslateW
	       vmap <silent> <Leader>tw <Plug>TranslateWV
	       " Replace the text with translation
	       nmap <silent> <Leader>tr <Plug>TranslateR
	       vmap <silent> <Leader>tr <Plug>TranslateRV
	       " Translate the text in clipboard
	       nmap <silent> <C-q> <Plug>TranslateX
	     ]])
		end,
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
    'echasnovski/mini.map',
    version = '*',
    config = function ()
      local map = require('mini.map')
      require('mini.map').setup({
        -- integration
        integrations = {
          -- map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic(),
          map.gen_integration.gitsigns(),
        }
      })

			vim.keymap.set("n", "<leader>T", ":lua MiniMap.toggle()<cr>")
    end
  },

	-- registers menu
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup({})
			vim.keymap.set("n", '<leader>"', ":Registers<cr>")
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
	{
		"Shatur/neovim-session-manager",
		event = "BufWritePost",
		cmd = "SessionManager",
		enabled = vim.g.resession_enabled ~= true,
		config = function()
			local Path = require("plenary.path")
			local config = require("session_manager.config")
			require("session_manager").setup({
				sessions_dir = Path:new(vim.fn.stdpath("data"), "sessions"), -- The directory where the session files will be saved.
				session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
				dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.loop.cwd()` if the passed `dir` is `nil`.
				autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. Possible values: Disabled, CurrentDir, LastSession
				autosave_last_session = true, -- Automatically save last session on exit and on session switch.
				autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
				autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
				autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
					"gitcommit",
					"gitrebase",
				},
				autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
				autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
				max_path_length = 80, -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
			})
		end,
		init = function()
			-- 自动加载和保存
			-- vim.api.nvim_create_autocmd("VimEnter", {
			-- 	callback = function()
			-- 		vim.cmd("SessionManager load_last_session")
			-- 		-- Only load the session if nvim was started with no args
			-- 		-- if vim.fn.argc(-1) == 0 then
			-- 		-- 	-- Save these to a different directory, so our manual sessions don't get polluted
			-- 		-- 	vim.cmd("SessionManager load_last_session")
			-- 		-- end
			-- 	end,
			-- })
			vim.api.nvim_create_autocmd("VimLeavePre", {
				callback = function()
					vim.cmd("SessionManager save_current_session")
				end,
			})
		end,
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
	-- { "folke/which-key.nvim", config = true },

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

	-- conceal隐藏keyword
	-- {
	-- 	"Jxstxs/conceal.nvim",
	-- 	opt = {},
	-- 	config = function()
	-- 		local conceal = require("conceal")
	--
	-- 		-- should be run before .generate_conceals to use user Configuration
	-- 		conceal.setup({
	-- 			--[[ ["language"] = {
	--        enabled = bool,
	--        ["keyword"] = {
	--            enabled     = bool,
	--            conceal     = string,
	--            highlight   = string
	--        }
	--    } ]]
	-- 			["lua"] = {
	-- 				["local"] = {
	-- 					enabled = false, -- to disable concealing for "local"
	-- 				},
	-- 				["return"] = {
	-- 					conceal = "R", -- to set the concealing to "R"
	-- 				},
	-- 				["for"] = {
	-- 					highlight = "keyword", -- to set the Highlight group to "@keyword"
	-- 				},
	-- 				["if"] = {
	-- 					highlight = "keyword", -- to set the Highlight group to "@keyword"
	-- 				},
	-- 			},
	-- 			["language"] = {
	-- 				enabled = false, -- to disable the whole language
	-- 			},
	-- 		})
	--
	-- 		-- generate the scm queries
	-- 		-- only need to be run when the Configuration changes
	-- 		conceal.generate_conceals()
	--
	-- 		-- bind a <leader>tc to toggle the concealing level
	-- 		vim.keymap.set("n", "<leader>tc", function() require("conceal").toggle_conceal() end, { silent = true })
	-- 	end,
	-- },

}
