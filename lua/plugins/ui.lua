return {
	-- 主题
	{
		"nvimdev/oceanic-material",
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
            { icon = " ", key = "f", desc = "Find File", action = ':Telescope find_files' },
            { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep_args" },
            { icon = " ", key = "r", desc = "Recent Files", action = 'Telescope frecency' },
            { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
            { icon = " ", key = "s", desc = "Restore Session", action = ":SessionLoadLast" },
            { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },
        },
      },
      -- nvim debug
      debug = { enabled = true },
      -- 专注当前函数、调暗其他部分
      dim = { enabled = true },
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
      { "gX", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      -- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
      { "<leader>fn",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
      { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
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

          Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
          Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
          Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
          Snacks.toggle.diagnostics():map("<leader>ud")
          Snacks.toggle.line_number():map("<leader>uN")
          Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 }):map("<leader>uc")
          Snacks.toggle.treesitter():map("<leader>ut")
          Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
          Snacks.toggle.inlay_hints():map("<leader>uh")
          Snacks.toggle.indent():map("<leader>ui")
          Snacks.toggle.dim():map("<leader>uD")
        end,
      })
    end,
  },

  -- highlight whitespace
  -- {
  --   "lukoshkin/highlight-whitespace",
  --   config=true,
  -- },

  -- highlight自己块选的行。块选在执行:HSHighlight 0  数字表示颜色有0-9种
  {
    "pocco81/highstr.nvim",
    -- 高亮
    vim.api.nvim_set_keymap( "v", "<F3>", ":<c-u>HSHighlight 1<CR>", { noremap = true, silent = true }),
    -- 取消高亮
    vim.api.nvim_set_keymap( "v", "<F4>", ":<c-u>HSRmHighlight<CR>", { noremap = true, silent = true })
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

	-- 增强cmdline
	{
		"gelguy/wilder.nvim",
		event = "CmdlineEnter", -- 懒加载：首次进入cmdline时载入
		config = function()
			local wilder = require("wilder")
			wilder.setup({
				modes = { ":", "/", "?" },
				next_key = 0,
				previous_key = 0,
				reject_key = 0,
				accept_key = 0,
			})
			vim.api.nvim_command("silent! UpdateRemotePlugins") -- 需要载入一次py依赖 不然模糊过滤等失效
			-- 设置source
			wilder.set_option("pipeline", {
				wilder.branch(
					-- 当默认无输入时 展示15条历史记录
					{
						wilder.check(function(_, x)
							return vim.fn.empty(x)
						end),
						wilder.history(15),
					},
					-- 当输入时 展示所有匹配项(模糊匹配)
					wilder.cmdline_pipeline({
						fuzzy = 1,
						fuzzy_filter = wilder.vim_fuzzy_filter(),
					}),
					-- pipeline for search
					wilder.search_pipeline()
				),
			})
			-- 设置样式
			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
					-- 设置特定高亮
					highlights = {
						accent = "WilderAccent",
						selected_accent = "WilderSelectedAccent",
					},
					highlighter = wilder.basic_highlighter(),
					left = { " ", wilder.popupmenu_devicons() }, -- 左侧加入icon
					right = { " ", wilder.popupmenu_scrollbar() }, -- 右侧加入滚动条
					border = "rounded",
					max_height = 17, -- 最大高度限制 因为要计算上下 所以17支持最多15个选项
				}))
			)
			-- 设置高亮
			vim.api.nvim_set_hl(0, "WilderAccent", { fg = "#5f87ff" })
			vim.api.nvim_set_hl(0, "WilderSelectedAccent", { fg = "#5f87ff", bg = "#4e4e4e" })
			-- 设置快捷键
			vim.api.nvim_set_keymap(
				"c",
				"<tab>",
				[[wilder#in_context() ? wilder#next() : '<tab>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap(
				"c",
				"<c-j>",
				[[wilder#in_context() ? wilder#next() : '<down>']],
				{ noremap = true, expr = true }
			)

			vim.api.nvim_set_keymap(
				"c",
				"<S-tab>",
				[[wilder#in_context() ? wilder#previous() : '<up>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap(
				"c",
				"<c-k>",
				[[wilder#in_context() ? wilder#previous() : '<up>']],
				{ noremap = true, expr = true }
			)
			vim.api.nvim_set_keymap("c", "0", "0", {}) -- 不清楚原因导致0无法使用 强制覆盖
		end,
	},

	-- winbar
  {
    'Bekaboo/dropbar.nvim',
    -- optional, but required for fuzzy finder support
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim'
    },
		vim.keymap.set("n", "<leader><cr>", function() require('dropbar.api').pick() end, { silent = true }) -- 执行进入pick模式后，按i键可以使用fzf 搜索
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

	{
		"famiu/bufdelete.nvim",
		init = function()
		  -- 强制删除
		  -- vim.keymap.set({ "n" }, "<C-w>", "lua require('bufdelete').bufdelete(0, true)<cr>")
		  vim.cmd([[nmap <C-w> :lua require('bufdelete').bufdelete(0, true)<cr>]])
		  -- 不强制删除
		  -- vim.keymap.set('n', '<C-w>', "lua require('bufdelete').bufwipeout(0, true)", {})
		  -- vim.cmd([[nmap <C-w> :lua require('bufdelete').bufwipeout(0, true)<cr>]])
		end
	},

	-- 通知menu
	-- {
	--    "rcarriga/nvim-notify",
	--    config = function ()
	--      vim.notify = require("notify")
	--    end
	--  },

	-- {
	--   "folke/noice.nvim",
	--    event = "VeryLazy",
	--   dependencies = {
	--     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	--     "MunifTanjim/nui.nvim",
	--     -- OPTIONAL:
	--     --   `nvim-notify` is only needed, if you want to use the notification view.
	--     --   If not available, we use `mini` as the fallback
	--     "rcarriga/nvim-notify",
	--   },
	--   config = function()
	--     require("noice").setup({
	--       lsp = {
	--         -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	--         override = {
	--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	--           ["vim.lsp.util.stylize_markdown"] = true,
	--            -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
	--         },
	--       },
	--        -- you can enable a preset for easier configuration
	--        presets = {
	--          bottom_search = true, -- use a classic bottom cmdline for search
	--          command_palette = true, -- position the cmdline and popupmenu together
	--          long_message_to_split = true, -- long messages will be sent to a split
	--          inc_rename = false, -- enables an input dialog for inc-rename.nvim
	--          lsp_doc_border = false, -- add a border to hover docs and signature help
	--        },
	--     })
	--   end,
	-- },

  -- {
  --   'echasnovski/mini.notify',
  --   version = '*',
  --   opts = {}
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
    config = function ()
      require('nvim-highlight-colors').setup({})
    end
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
		    lf_cmd      = "lf", -- eg: lf_cmd = "lf -command 'set hidden'"
		    fm_cmd      = "fm",
		    nnn_cmd     = "nnn",
		    fff_cmd     = "fff",
		    twf_cmd     = "twf",
		    fzf_cmd     = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
		    fzy_cmd     = "find . | fzy",
		    xplr_cmd    = "xplr",
		    vifm_cmd    = "vifm",
		    skim_cmd    = "sk",
		    broot_cmd   = "broot",
		    gitui_cmd   = "gitui",
		    ranger_cmd  = "ranger",
		    joshuto_cmd = "joshuto",
		    -- lazygit_cmd = "lazygit",
		    neomutt_cmd = "neomutt",
        taskwarrior_cmd = "taskwarrior-tui",
	    },

	    -- Mappings used with the plugin
	    mappings = {
		    vert_split = "<C-v>",
		    horz_split = "<C-h>",
		    tabedit    = "<C-t>",
		    edit       = "<C-e>",
		    ESC        = "<ESC>"
	    },

	    -- Path to broot config
	    broot_conf = vim.fn.stdpath("data") .. "/site/pack/packer/start/fm-nvim/assets/broot_conf.hjson"
		},
		config = function()
			-- vim.keymap.set("n", "<Leader>fr", ":Ranger<cr>")
			-- vim.keymap.set("n", "<Leader>gg", ":Lazygit<cr>")
		end,
	},

  {
    "mikavilpas/yazi.nvim",
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

	-- registers menu
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup({})
			vim.keymap.set("n", '<leader>"', ":Registers<cr>")
		end,
	},

	-- yank history
	{
		"ptdewey/yankbank-nvim",
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

	     vim.keymap.set("n", "<leader>y", "<cmd>YankBank<CR>", { noremap = true })
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
    "olimorris/persisted.nvim",
    lazy = false, -- make sure the plugin is always loaded at startup
    config = true
  },

  -- menu
  { "nvchad/volt" , lazy = true },

  {
    "nvchad/menu",
    lazy = true,
    opts = true,
    vim.keymap.set("n", "<leader>m", function()
      require("menu").open("default")
    end, {})
  },

	-- 折叠代码
	{
		"kevinhwang91/nvim-ufo",
		dependencies = { "kevinhwang91/promise-async" },
		config = function()

      -- Option 2: nvim lsp as LSP client
      -- Tell the server the capability of foldingRange,
      -- Neovim hasn't added foldingRange to default capabilities, users must add it manually
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }
      local language_servers = require("lspconfig").util._available_servers() -- or list servers manually like {'gopls', 'clangd'}
      for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
          capabilities = capabilities
          -- you can add other fields for setting up lsp server in this table
        })
      end

			require("ufo").setup({
				provider_selector = function(bufnr, filetype, buftype)
					return { "treesitter", "indent" }
				end,
			})


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

  -- 任务管理器
  {
    'stevearc/overseer.nvim',
    opts = {},
  },

}
