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
	--     "AstroNvim/astrotheme",
	--     config = function ()
	--         require("astrotheme").setup({})
	--              vim.cmd.colorscheme "astrotheme"
	--     end
	-- },

	-- {
	--     "catppuccin/nvim",
	--     name = "catppuccin",
	--     config = function()
	--         require("catppuccin").setup {}
	--         vim.cmd.colorscheme "catppuccin-frappe"
	--     end,
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
						"mode",
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
						{ "fancy_location" },
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
						"aerial", -- 侧边栏aerial插件
					},
				},
				inactive_winbar = {},
				extensions = { "fzf" },
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

	-- highlight cursor pairs
	"Yggdroot/hiPairs",

	-- highlight identline导航线
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({
				char = "│",
				filetype_exclude = {
					"help",
					"alpha",
					"dashboard",
					"nvimtree",
					"neo-tree",
					"Trouble",
					"lazy",
					"mason",
					"aerial",
				},
				show_trailing_blankline_indent = false,

				show_current_context = false, -- 启动导轨线
				show_current_context_start = false, -- 启用导轨下划线
			})
		end,
	},
	-- 慢速identline导航线
	{
		"echasnovski/mini.indentscope",
		config = function()
			require("mini.indentscope").setup({
				options = { try_as_border = true },
				symbol = "│",
			})
		end,
	},

	-- highlight yank
	{
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({
				ring = {
					history_length = 100,
					storage = "shada",
					sync_with_numbered_registers = true,
					cancel_event = "update",
				},
				system_clipboard = {
					sync_with_ring = true,
				},
				highlight = {
					on_put = true,
					on_yank = true,
					timer = 300,
				},
			})

			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
			vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
		end,
	},

	-- highlight color
	{ "norcalli/nvim-colorizer.lua", config = true },

	-- 搜索后自动取消highlight
	"romainl/vim-cool",

	-- 快速移动
	-- {
	-- 	"rainbowhxch/accelerated-jk.nvim",
	-- 	vim.cmd([[
	--            nmap j <Plug>(accelerated_jk_gj)
	--            nmap k <Plug>(accelerated_jk_gk)
	--            ]]),
	-- },

	-- 移动动画
	-- { "echasnovski/mini.animate", config = true },
	"psliwka/vim-smoothie",

	{
		"echasnovski/mini.bracketed",
		config = function()
			require("mini.bracketed").setup({})
			vim.keymap.set("n", "X", "require('mini.bracketed').oldfile()", { noremap = true })
      -- vim.cmd([[nnoremap <leader>o :lua require('minibracketed').oldfile()<CR>]])
		end,
	},

	-- 窗口动画
	{
		"camspiers/animate.vim",
		vim.cmd([[
          nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
          nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
          nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
          nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
        ]]),
	},

	-- 浮动窗口
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
		"voldikss/vim-floaterm",
		vim.cmd([[
	        hi FloatermNF guibg=#282828
	        hi FloatermBorderNF guibg=#282828 guifg=#504945
	        command! Ranger FloatermNew ranger
	        command! Broot FloatermNew broot -sdpw
	        command! Lazygit FloatermNew lazygit
	        command! Lazydocker FloatermNew lazydocker
	        command! Ptpython FloatermNew ptpython
	        command! Pudb FloatermNew python -m pudb %
	        let g:floaterm_height = 0.9
	        let g:floaterm_width = 0.9
	        let g:floaterm_wintype = 'normal'
	        " autocmd FileType floaterm wincmd H
	        let g:floaterm_autoclose = 2
	        let g:floaterm_position = 'center'
	        let g:floaterm_opener = 'edit'

	        " 取消边框
	        let g:floaterm_borderchars = '        '
	        let g:floaterm_title = ''

	        nmap <Leader>tp :Ptpython<CR>
	        nmap <Leader>tt :terminal mytop.sh<CR>
	        nmap <Leader>fr :Ranger<CR>
	        nmap <Leader>gg :Lazygit<CR>
	        nmap <Leader>td :Lazydocker<CR>
	    ]]),
	},

	-- 翻译
	{
		"voldikss/vim-translator",
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
        ]]),
	},

	-- 侧边栏
	{
		"stevearc/aerial.nvim",
		opts = {
			attach_mode = "global",
			backends = { "lsp", "treesitter", "markdown", "man" },
			layout = { min_width = 28 },
			show_guides = true,
			filter_kind = false,
			guides = {
				mid_item = "├ ",
				last_item = "└ ",
				nested_top = "│ ",
				whitespace = "  ",
			},
			keymaps = {
				["[y"] = "actions.prev",
				["]y"] = "actions.next",
				["[Y"] = "actions.prev_up",
				["]Y"] = "actions.next_up",
				["{"] = false,
				["}"] = false,
				["[["] = false,
				["]]"] = false,
			},
		},
		vim.keymap.set("n", "T", ":AerialToggle<cr>"),
	},

	-- registers menu
	{
		"tversteeg/registers.nvim",
		config = true,
		vim.cmd([[
            nmap <silent> <leader>" :Registers<cr>
        ]]),
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

			-- 自动加载和保存
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					vim.cmd("SessionManager load_last_session")
					-- -- Only load the session if nvim was started with no args
					-- if vim.fn.argc(-1) == 0 then
					-- 	-- Save these to a different directory, so our manual sessions don't get polluted
					-- 	vim.cmd("SessionManager load_last_session")
					-- end
				end,
			})
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
}
