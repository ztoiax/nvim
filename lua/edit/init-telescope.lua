local actions = require("telescope.actions")
local action_layout = require("telescope.actions.layout")
require("telescope").setup({
	defaults = {
		mappings = {
			n = {
				["<F3>"] = action_layout.toggle_preview, -- 开启预览
			},
			i = {
				["<esc>"] = actions.close,
				["<F3>"] = action_layout.toggle_preview, -- 开启预览
				["<C-u>"] = false,

				["<C-j>"] = require("telescope.actions").move_selection_next,
				["<C-k>"] = require("telescope.actions").move_selection_previous,
				["<down>"] = actions.cycle_history_next,
				["<up>"] = actions.cycle_history_prev,
				["<C-p>"] = require("telescope.actions").preview_scrolling_up,
				["<C-n>"] = require("telescope.actions").preview_scrolling_down,

				-- [""] = actions.select_vertical, -- open selection in new vertical split
				-- [""] = actions.select_horizontal, -- open selection in new horizantal split
			},
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--trim",
		},
		-- prompt_prefix = " ",
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",

		color_devicons = true,
		selection_strategy = "reset",
		sorting_strategy = "descending",

		prompt_position = "bottom", -- 搜索框在底部。
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,

		layout_strategy = "vertical",
		layout_config = {
			width = 0.95,
			height = 0.95,
			preview_cutoff = 1,

			-- strategy
			horizontal = {
				preview_height = 0.5,
			},
			vertical = {
				preview_height = 0.5,
			},
			flex = {
				horizontal = {
					preview_width = 0.9,
				},
			},
		},

		file_sorter = require("telescope.sorters").get_fuzzy_file, -- 文件排序使用默认算法
		file_ignore_patterns = {},
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		shorten_path = true,

		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
			-- 参数不支持*，无法用
			-- find_command = { "rg", "--color=never", "--files", "--hidden", "--follow", "-g", "'!.git'", "*" }
		},
	},
})

-- telescope-menu设置
local keymap = require("telescope-menu.actions").keymap
require("telescope").setup({
	extensions = {
		menu = {
			default = {
				items = {
					-- You can add an item of menu in the form of { "<display>", "<command>" }
					{ "Checkhealth", "checkhealth" },
					{ "Show LSP Info", "LspInfo" },
					{ "Files", "Telescope find_files" },

					-- The above examples are syntax-sugars of the following;
					{ display = "Change colorscheme", value = "Telescope colorscheme" },

					-- 调用其他插件
					{ "Jump to the previous hunk", "<Plug>(GitGutterPrevHunk)", keymap },
					{ "Jump to the next hunk", "<Plug>(GitGutterNextHunk)", keymap },

					-- 多重菜单
					{ "Editor", "Telescope menu editor" },
				},
			},
			-- 多重菜单
			editor = {
				items = {
					{ "Split window vertically", "vsplit" },
					{ "Split window horizontally", "split" },
					{ "Write", "w" },
				},
			},
			filetype = {
				lua = {
					items = {
						{ "Format", "!stylua %" },
						{ "Open Luadev menu", "Luadev" },
						{ "Execute a current buffer", "LuaRun" },
					},
				},
			},
		},
	},
})
require("telescope").load_extension "menu"
vim.keymap.set('n', '<leader>m', require"telescope".extensions.menu.menu, {})

-- lazy
require("telescope").setup({
  extensions = {
    lazy = {
      -- Optional theme (the extension doesn't set a default theme)
      theme = "ivy",
      -- Whether or not to show the icon in the first column
      show_icon = true,
      -- Mappings for the actions
      mappings = {
        open_in_browser = "<C-o>",
        open_in_file_browser = "<M-b>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_in_terminal = "<C-t>",
        open_plugins_picker = "<C-b>", -- Works only after having called first another action
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
        change_cwd_to_plugin = "<C-c>d",
      },
      -- Configuration that will be passed to the window that hosts the terminal
      -- For more configuration options check 'nvim_open_win()'
      terminal_opts = {
        relative = "editor",
        style = "minimal",
        border = "rounded",
        title = "Telescope lazy",
        title_pos = "center",
        -- width = 0.5,
        -- height = 0.5,
      },
      -- Other telescope configuration options
    },
  },
})
require("telescope").load_extension "lazy"
vim.keymap.set('n', '<leader>fl', require"telescope".extensions.lazy.lazy, {})

-- key map
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fa", builtin.builtin, {}) -- 所有builtin函数

vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fm", builtin.oldfiles, {})
vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
vim.keymap.set("n", "<leader>a", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, {})
vim.keymap.set("n", "<leader>f.", builtin.current_buffer_fuzzy_find, {})

vim.keymap.set("n", "<leader>/", builtin.search_history, {})
vim.keymap.set("n", "<leader><space>", builtin.marks, {})
vim.keymap.set("n", "<leader>fc", builtin.colorscheme, {})
vim.keymap.set("n", "<leader>fj", builtin.jumplist, {})
vim.keymap.set("n", "<leader>fv", builtin.vim_options, {})
vim.keymap.set("n", "<leader>ca", builtin.autocommands, {})
vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
vim.keymap.set("n", '<leader>f"', builtin.registers, {})
vim.keymap.set("n", "<leader>:", builtin.commands, {})

-- lsp
vim.keymap.set("n", "<leader>ft", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>J", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>K", builtin.lsp_definitions, {})

-- git
vim.keymap.set("n", "<leader>gm", builtin.git_commits, {})
vim.keymap.set("n", "<leader>gd", builtin.git_bcommits, {}) -- git diff
vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

-- 命令行
vim.keymap.set("c", "<C-r>", builtin.command_history, {})
