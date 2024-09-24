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
				["<A-k>"] = require("telescope.actions").preview_scrolling_up,
				["<A-j>"] = require("telescope.actions").preview_scrolling_down,

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
			"--max-depth",
			"3",
			"--no-ignore"
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
    preview = {
        filesize_limit = 1, -- MB
    },
	},
	pickers = {
		find_files = {
			-- theme = "dropdown",
			find_command = { "rg", "--color=never", "--files", "--hidden", "--follow", "--glob", "!**/.git/*" }
			-- 参数不支持*，无法用
			-- find_command = { "rg", "--color=never", "--files", "--hidden", "--follow", "-g", "'!.git'", "*" }
		},
	},
})

-- key map
local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>fa", builtin.builtin, {}) -- 所有builtin函数

-- vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
-- -- vim.keymap.set("n", "<leader>fm", builtin.oldfiles, {})
-- vim.keymap.set("n", "<leader>fg", builtin.git_files, {})
-- vim.keymap.set("n", "<leader>a", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>a", require('telescope').extensions.live_grep_args.live_grep_args)
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
-- vim.keymap.set("n", "<leader>ft", builtin.treesitter, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
-- vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, {})
-- vim.keymap.set("n", "<leader>f.", builtin.current_buffer_fuzzy_find, {})

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
-- vim.keymap.set("n", "<leader>ft", builtin.lsp_document_symbols, {})
vim.keymap.set("n", "<leader>J", builtin.lsp_references, {})
vim.keymap.set("n", "<leader>K", builtin.lsp_definitions, {})

-- git
-- vim.keymap.set("n", "<leader>gm", builtin.git_commits, {})
-- vim.keymap.set("n", "<leader>gD", builtin.git_bcommits, {}) -- 当前文本显示不同commit版本。在当前文本未commit之前，要小心不要按保存
-- vim.keymap.set("n", "<leader>gs", builtin.git_status, {})

-- 命令行
vim.keymap.set("c", "<C-r>", builtin.command_history, {})
