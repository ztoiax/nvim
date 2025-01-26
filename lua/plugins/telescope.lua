return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-lua/popup.nvim",

      -- 不同telescope命令切换
      {
        "FabianWirth/search.nvim",
        config = function ()
          local builtin = require('telescope.builtin')
					require("search").setup({
            mappings = { -- optional: configure the mappings for switching tabs (will be set in normal and insert mode(!))
              next = "<Tab>",
              prev = "<S-Tab>"
            },
            collections = {
              file = {
                initial_tab = 1,
                tabs = {
                  { name = "recently", tele_func = require("telescope").extensions.frecency.frecency },
                  { name = "zoxide", tele_func = require("telescope").extensions.zoxide.list },

                  { name = "files", tele_func = builtin.find_files },
                  { name = "git-files", tele_func = builtin.git_files },
                }
              },
              grep = {
                initial_tab = 1,
                tabs = {
                  { name = "current", tele_func = builtin.current_buffer_fuzzy_find },
                  { name = "all", tele_func = require('telescope').extensions.live_grep_args.live_grep_args },
                }
              },
              git = {
                initial_tab = 1,
                tabs = {
                  { name = "Status", tele_func = builtin.git_status },
                  { name = "diff", tele_func = require("telescope").extensions.git_diffs.diff_commits },
                  { name = "Branches", tele_func = builtin.git_branches },
                  { name = "Commits", tele_func = builtin.git_commits },
                  { name = "BCommits", tele_func = builtin.git_bcommits },
                  { name = "Stashes", tele_func = builtin.git_stash },
                }
              },
              code = {
                initial_tab = 1,
                tabs = {
                  { name = "lsp_document_symbols", tele_func = builtin.lsp_document_symbols },
                  { name = "treesitter", tele_func = builtin.treesitter },
                  { name = "snippet", tele_func = require("telescope").extensions.luasnip.luasnip },
                }
              },
              other = {
                initial_tab = 1,
                tabs = {
                  { name = "vim命令菜单", tele_func = require"telescope".extensions.command_palette.command_palette },
                  { name = "undo-tree", tele_func = require("telescope").extensions.undo.undo },
                  { name = "lazy", tele_func = require"telescope".extensions.lazy.lazy },
                }
              },
            }
          })

				  -- vim.keymap.set("n", "<leader>ff", require('search').open)
          vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("search").open({ collection = "file" })<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<leader>fa', ':lua require("search").open({ collection = "grep" })<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("search").open({ collection = "git" })<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<leader>ft', ':lua require("search").open({ collection = "code" })<CR>', { noremap = true, silent = true })
          vim.api.nvim_set_keymap('n', '<leader>fo', ':lua require("search").open({ collection = "other" })<CR>', { noremap = true, silent = true })
        end
      },

      -- Live grep with args
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end
      },

			-- undo tree
			{
				"debugloop/telescope-undo.nvim",
				config = function()
					require("telescope").load_extension("undo")
					-- vim.keymap.set("n", "<leader>u", require("telescope").extensions.undo.undo, {})
				end,
			},
			-- fzf
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").setup({
						extensions = {
							fzf = {
								fuzzy = true, -- false will only do exact matching
								override_generic_sorter = true, -- override the generic sorter
								override_file_sorter = true, -- override the file sorter
								case_mode = "smart_case", -- or "ignore_case" or "respect_case"
							},
						},
					})
					require("telescope").load_extension("fzf")
				end,
			},
			-- luasnip片段
			{
				"benfowler/telescope-luasnip.nvim",
				init = function()
					require("telescope").load_extension("luasnip")
					-- vim.keymap.set("n", "<leader>fs", require("telescope").extensions.luasnip.luasnip, {})
				end,
			},

			-- lazy插件管理器
			{
        "tsakirist/telescope-lazy.nvim",
        config = function ()
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
          -- vim.keymap.set('n', '<leader>fl', require"telescope".extensions.lazy.lazy, {})
        end
      },

			-- 支持git的diffview插件
			{
				"paopaol/telescope-git-diffs.nvim",
				config = function()
					require("telescope").load_extension("git_diffs")
					-- vim.keymap.set("n", "<leader>gD", require("telescope").extensions.git_diffs.diff_commits, {})
				end,
			},
			-- 使用frecency算法对oldfiles排序，会保存一个sqlite
			{
				"nvim-telescope/telescope-frecency.nvim",
				config = function()
					require("telescope").load_extension("frecency")
					require("telescope").setup({
						extensions = {
							frecency = {
								show_scores = true,
								show_unindexed = true,
								max_timestamps = 30, -- 10个条目
								ignore_patterns = { "*.git/*", "*/tmp/*" },
								workspaces = {
									["conf"] = "~/.config",
								},
								-- 需要sqlite.lua 插件
								use_sqlite = false,
								-- db_root = vim.fn.stdpath "data", -- ~/.local/share/nvim
							},
						},

						-- vim.keymap.set("n", "<leader>fm", require("telescope").extensions.frecency.frecency, {}),
					})
				end,
			},

			-- 集成zoxide
			{
				"jvgrootveld/telescope-zoxide",
				config = function()
					require("telescope").setup({
						extensions = {
							zoxide = {
								prompt_title = "[ Walking on the shoulders of TJ ]",
							},
						},
					})

					-- 自定义:Zi命令
					vim.api.nvim_create_user_command("Zi", "Telescope zoxide list", { nargs = 0 })
				end,
			},

			-- 自定义vim命令菜单
			{
				"LinArcX/telescope-command-palette.nvim",
				config = function()
					require("telescope").setup({
						extensions = {
							command_palette = {
								{
									"File",
									{ "save current file (<leader>-w)", ":w" },
								},
								{
									"set",
									{ "paste mode", ":set paste!" },
									{ "cursor line", ":set cursorline!" },
									{ "cursor column", ":set cursorcolumn!" },
									{ "spell checker", ":set spell!" },
									{ "relative number", ":set relativenumber!" },
									{ "search highlighting", ":set hlsearch!" },
								},
							},
						},
					})
					require("telescope").load_extension("command_palette")
          -- vim.keymap.set('n', '<leader>f:', require"telescope".extensions.command_palette.command_palette, {})
				end,
			},

			-- 自定义shell 命令菜单
			{
				"axkirillov/easypick.nvim",
				config = function()
					local easypick = require("easypick")

					-- only required for the example to work
					local get_default_branch =
						"git rev-parse --symbolic-full-name refs/remotes/origin/HEAD | sed 's!.*/!!'"
					local base_branch = vim.fn.system(get_default_branch) or "main"

					easypick.setup({
						pickers = {
							{
								-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
								name = "ls",
								-- the command to execute, output has to be a list of plain text entries
								command = "ls",
								-- specify your custom previwer, or use one of the easypick.previewers
								previewer = easypick.previewers.default(),
							},

							-- diff current branch with base_branch and show files that changed with respective diffs in preview
							{
								name = "changed_files",
								command = "git diff --name-only $(git merge-base HEAD ' .. base_branch .. ' )",
								previewer = easypick.previewers.branch_diff({ base_branch = base_branch }),
							},

							-- list files that have conflicts with diffs in preview
							{
								name = "conflicts",
								command = "git diff --name-only --diff-filter=U --relative",
								previewer = easypick.previewers.file_diff(),
							},
						},
					})
				end,
			},
		},
		config = function()
			require("edit/init-telescope")
		end,
	},
}
