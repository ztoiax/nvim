return {

	------ ai ------

	-- ai补全 codeium
	-- {
	--     "Exafunction/codeium.nvim",
	--     config = function()
	--         require("codeium").setup({
	--         })
	--     end
	-- },

	-- ai补全 supermaven
	-- {
	--   "supermaven-inc/supermaven-nvim",
	--   config = function()
	--     require("supermaven-nvim").setup({})
	--   end,
	-- },

	-- 微软和谷歌的工程师离职开发的
	-- { "augmentcode/augment.vim" },

	-- ai补全 fittencode
	{
		"luozhiya/fittencode.nvim",
		lazy = false,
		event = "InsertEnter",
		cmd = {
			"Fitten start_chat",
			"Fitten show_chat",
			"Fitten toggle_chat",
			"Fitten login",
			"Fitten logout",
			"Fitten register",
		},

		config = function()
			require("fittencode").setup({
				keymaps = {
					inline = {
						["<TAB>"] = "accept_all_suggestions",
						["<C-Space>"] = "accept_all_suggestions",
						["<C-l>"] = "accept_all_suggestions",
						["<C-Down>"] = "accept_line",
						["<C-Right>"] = "accept_word",
						["<C-Up>"] = "revoke_line",
						["<C-Left>"] = "revoke_word",
						["<A-\\>"] = "triggering_completion",
					},
					chat = {
						["q"] = "close",
						["[c"] = "goto_previous_conversation",
						["]c"] = "goto_next_conversation",
						["c"] = "copy_conversation",
						["C"] = "copy_all_conversations",
						["d"] = "delete_conversation",
						["D"] = "delete_all_conversations",
					},
				},
			})
		end,
	},

	--ai代码助手
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
		opts = {
			providers = {
				deepseek = {
					__inherited_from = "openai",
					api_key_name = "DEEPSEEK_API_KEY",
					endpoint = "https://api.deepseek.com",
					model = "deepseek-coder",
				},
			},

			mappings = {
				submit = {
					normal = "<CR>",
					insert = "<C-CR>",
				},
			},
		},
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		build = "make",
		-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			-- "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons

			-- ai补全 github copilot
			-- 需要运行:Copilot auth
			-- {
			--   "zbirenbaum/copilot.lua",
			--   opts = true
			-- },
		},

		vim.keymap.set({ "n", "v" }, "<leader>aa", ":AvanteToggle<CR>"),
	},

	-- 创建当前的snippets
	{
		"chrisgrieser/nvim-scissors",
		event = "VeryLazy",
		keys = {
			{
				"<leader>se",
				function()
					require("scissors").editSnippet()
				end,
				mode = "n",
			},
			{
				"<leader>sa",
				function()
					require("scissors").addNewSnippet()
				end,
				mode = { "n", "x" },
			},
		},
		config = function()
			require("scissors").setup({
				-- "~/.config/nvim/nvim-scissors",
				snippetDir = vim.fn.stdpath("config") .. "/nvim-scissors",
				editSnippetPopup = {
					height = 0.4, -- relative to the window, number between 0 and 1
					width = 0.6,
					border = "rounded",
					keymaps = {
						cancel = "q",
						saveChanges = "<leader>w", -- alternatively, can also use `:w`
						goBackToSearch = "<BS>",
						deleteSnippet = "<C-BS>",
						duplicateSnippet = "<C-d>",
						openInFile = "<C-o>",
						insertNextToken = "<C-t>", -- insert & normal mode
						jumpBetweenBodyAndPrefix = "<Tab>", -- insert & normal mode
					},
				},

	      snippetSelection = {
				  telescope = {
					  -- By default, the query only searches snippet prefixes. Set this to
					  -- `true` to also search the body of the snippets.
					  alsoSearchSnippetBody = false,

					  -- accepts the common telescope picker config
					  opts = {
						  layout_strategy = "horizontal",
						  layout_config = {
							  horizontal = { width = 0.9 },
							  preview_width = 0.6,
						  },
					  },
				  },
				  -- `none` writes as a minified json file using `vim.encode.json`.
				  -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
				  -- you version control your snippets.
				  jsonFormatter = "none", -- "yq"|"jq"|"none"

				  backdrop = {
					  enabled = true,
					  blend = 50, -- between 0-100
				  },
				  icons = {
					  scissors = "󰩫",
				  },
			  }
			})
		end,
	},

	{ "xzbdmw/colorful-menu.nvim", opts = true },

	{
		"saghen/blink.cmp",
		lazy = false, -- lazy loading handled internally
		-- optional: provides snippets for the snippet source
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			-- 可以add cmp的source 如 { 'dmitmel/cmp-digraphs' },
			{ "saghen/blink.compat", version = "*", opts = { impersonate_nvim_cmp = true } },
			{
				"rafamadriz/friendly-snippets",
				config = function()
					-- 加载friendly-snippets
					local dir = vim.fn.stdpath("data") .. "/lazy" .. "/friendly-snippets"
					require("luasnip.loaders.from_vscode").lazy_load({ paths = dir })

					-- 加载自定义的snippets
					-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })

					-- 加载nvim-scissors插件的snippets
					-- require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/nvim-scissors" })
				end,
			},

			-- blink的github copilot补全。需要安装插件copilot.lua
			"fang2hou/blink-copilot",
		},

		-- use a release tag to download pre-built binaries
		version = "v0.*",
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				preset = "default",
				["<Tab>"] = {
					function(cmp)
						if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
							return cmp.accept()
						end
					end,
					-- "show_and_insert",
					"select_next",
					"snippet_forward",
					"fallback",
				},
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

				["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<CR>"] = { "accept", "fallback" },

				["<C-n>"] = { "snippet_forward", "fallback" },
				["<C-p>"] = { "snippet_backward", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },

				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
			},

			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},

			cmdline = {
				keymap = {
					-- recommended, as the default keymap will only show and select the next item
					-- ["<Tab>"] = { "show", "accept" },
				  ["<C-j>"] = { "select_next", "fallback" },
				  ["<C-k>"] = { "select_prev", "fallback" },
					["<CR>"] = { "accept_and_enter", "fallback" },
				},
				completion = {
					menu = { auto_show = true },
					ghost_text = { enabled = true },

          list = {
            selection = {
              preselect = false,
              auto_insert = false
            }
				  },
			  },
			},

			completion = {
				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before *and* after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword = { range = "prefix" },

				-- Disable auto brackets
				-- NOTE: some LSPs may add auto brackets themselves anyway
				accept = { auto_brackets = { enabled = false } },

				-- Insert completion item on selection, don't select by default
				-- list = { selection = 'auto_insert' },
				-- or set per mode
				-- list = { selection = function(ctx) return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect' end },

				trigger = {
					-- When true, will prefetch the completion items when entering insert mode
					prefetch_on_insert = false,

					-- When false, will not show the completion window automatically when in a snippet
					show_in_snippet = true,

					-- When true, will show the completion window after typing any of alphanumerics, `-` or `_`
					show_on_keyword = true,

					-- When true, will show the completion window after typing a trigger character
					show_on_trigger_character = true,

					-- LSPs can indicate when to show the completion window via trigger characters
					-- however, some LSPs (i.e. tsserver) return characters that would essentially
					-- always show the window. We block these by default.
					show_on_blocked_trigger_characters = function()
						if vim.api.nvim_get_mode().mode == "c" then
							return {}
						end

						-- you can also block per filetype, for example:
						-- if vim.bo.filetype == 'markdown' then
						--   return { ' ', '\n', '\t', '.', '/', '(', '[' }
						-- end

						return { " ", "\n", "\t" }
					end,

					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character after accepting an item
					show_on_accept_on_trigger_character = true,

					-- When both this and show_on_trigger_character are true, will show the completion window
					-- when the cursor comes after a trigger character when entering insert mode
					show_on_insert_on_trigger_character = true,

					-- List of trigger characters (on top of `show_on_blocked_trigger_characters`) that won't trigger
					-- the completion window when the cursor comes after a trigger character when
					-- entering insert mode/accepting an item
					show_on_x_blocked_trigger_characters = { "'", '"', "(" },
					-- or a function, similar to show_on_blocked_trigger_character
				},

				list = {
					-- Maximum number of items to display
					max_items = 200,

					selection = {
            preselect = false,   -- 不自动选中第一个候选项
            auto_insert = false, -- 选中时不自动插入预览
					},
				},

				menu = {
					enabled = true,
					auto_show = true,
					min_width = 15,
					max_height = 10,
					border = "none",
					winblend = 0,
					winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
					-- Keep the cursor X lines away from the top/bottom of the window
					scrolloff = 2,
					-- Note that the gutter will be disabled when border ~= 'none'
					scrollbar = true,
					-- Which directions to show the window,
					-- falling back to the next direction when there's not enough space
					direction_priority = { "s", "n" },
					-- auto_show = false,
					auto_show = function(ctx)
						return vim.bo.buftype ~= "prompt"
							-- Telescope下不显示窗口补全
							and vim.b.completion ~= false
							and vim.bo.filetype ~= "TelescopePrompt"
						-- cmdline模式下不显示窗口补全
						-- and ctx.mode ~= "cmdline"
						-- serach模式下不显示窗口补全
						-- and vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
					end,

					-- nvim-cmp style menu
					draw = {
						columns = { { "kind_icon" }, { "label", gap = 1 } },
						-- colorful-menu插件
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
						},
						treesitter = { "lsp" },
					},
				},

				-- Show documentation when selecting a completion item
				documentation = { auto_show = true, auto_show_delay_ms = 500 },

				-- Display a preview of the selected item on the current line
				ghost_text = {
					enabled = false,
					-- Show the ghost text when an item has been selected
					show_with_selection = true,
					-- Show the ghost text when no item has been selected, defaulting to the first item
					show_without_selection = false,
				},
			},

			sources = {
				default = {
					"lsp",
					"path",
					"snippets",
					"buffer",
					-- copilot ai补全插件
					"copilot",
					-- fittencode ai补全插件
					-- "fittencode",
					-- avante ai插件
					"avante_commands",
					"avante_mentions",
					"avante_files",
					-- lazydev插件
					"lazydev",
				},
				-- kristijanhusak/vim-dadbod-completion插件
				per_filetype = {
					sql = { "snippets", "dadbod", "buffer" },
				},
				providers = {
					-- kristijanhusak/vim-dadbod-completion插件
					dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },

					-- copilot ai补全插件
					copilot = {
						name = "copilot",
						module = "blink-copilot",
						score_offset = 100,
						async = true,
						opts = {
							-- Local options override global ones
							-- Final settings: max_completions = 3, max_attempts = 2, kind = "Copilot"
							max_completions = 3, -- Override global max_completions
							max_attempts = 4,
						},
					},

					-- fittencode ai补全插件
					fittencode = {
						name = "fittencode",
						module = "fittencode.sources.blink",
					},

					-- avante ai插件
					avante_commands = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 90, -- show at a higher priority than lsp
						opts = {},
					},
					avante_files = {
						name = "avante_commands",
						module = "blink.compat.source",
						score_offset = 100, -- show at a higher priority than lsp
						opts = {},
					},
					avante_mentions = {
						name = "avante_mentions",
						module = "blink.compat.source",
						score_offset = 1000, -- show at a higher priority than lsp
						opts = {},
					},

					-- lazydev插件
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},

					snippets = {
						opts = {
							search_paths = {
								-- 加载自定义snippets
								"~/.config/nvim/snippets",
								-- 加载nvim-scissors插件的snippets
								"~/.config/nvim/nvim-scissors",
							},
						},
					},
				},
			},

			-- experimental signature help support
			signature = { enabled = true },

			fuzzy = {
				implementation = "prefer_rust_with_warning",
				-- Allows for a number of typos relative to the length of the query
				-- Set this to 0 to match the behavior of fzf
				max_typos = function(keyword)
					return math.floor(#keyword / 4)
				end,
				-- Frecency tracks the most recently/frequently used items and boosts the score of the item
				use_frecency = true,
				-- Proximity bonus boosts the score of items matching nearby words
				use_proximity = true,
				-- UNSAFE!! When enabled, disables the lock and fsync when writing to the frecency database. This should only be used on unsupported platforms (i.e. alpine termux)
				use_unsafe_no_lock = false,
				-- Controls which sorts to use and in which order, falling back to the next sort if the first one returns nil
				-- You may pass a function instead of a string to customize the sorting
				sorts = { "score", "sort_text" },

				prebuilt_binaries = {
					-- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`
					-- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
					download = true,
					-- Ignores mismatched version between the built binary and the current git sha, when building locally
					ignore_version_mismatch = false,
					-- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
					-- then the downloader will attempt to infer the version from the checked out git tag (if any).
					--
					-- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
					force_version = nil,
					-- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
					-- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
					-- Check the latest release for all available system triples
					--
					-- Beware that if the fuzzy matcher changes while tracking main then this may result in blink breaking.
					force_system_triple = nil,
					-- Extra arguments that will be passed to curl like { 'curl', ..extra_curl_args, ..built_in_args }
					extra_curl_args = {},
				},
			},

			appearance = {
				highlight_ns = vim.api.nvim_create_namespace("blink_cmp"),
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- Will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "mono",
				kind_icons = {
					Copilot = "",
					FittenCode = "",
					Text = "",
					Method = "ƒ",
					Function = "",
					Constructor = "",

					Field = "󰜢",
					Variable = "󰆦",
					Property = "󰖷",

					Class = "",
					Interface = "ﰮ",
					Module = "",
					Struct = "",

					Unit = "󰪚",
					Value = "",
					Enum = "󰦨",
					EnumMember = "",

					Keyword = "",
					Constant = "",

					Snippet = "﬌",
					Color = "󰏘",
					File = "󰈔",
					Reference = "󰬲",
					Folder = "",
					Event = "󱐋",
					Operator = "󰪚",
					TypeParameter = "󰬛",
				},
			},
		},
		-- allows extending the enabled_providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" },
	},

	-- 安装lsp、lint、format、dap插件
	{
    "mason-org/mason.nvim",
    opts = {}
  },
	------ lsp ------
	{
		-- 可安装列表 https://mason-registry.dev/registry/list
		-- 手动安装命令 :MasonInstall ast-grep
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		-- build = ":MasonUpdate",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					---- lsp ----
					-- 注释的条目需要在mason下手动安装
					"awk_ls", -- awk
					"bashls", -- bash
					"clangd", -- c/cpp
					"pyright", -- python
					-- "rust-analyzer", -- rust
					"gopls", -- go
					"jdtls", -- java
					"lua_ls", -- lua
					-- "typescript-language-server", -- js, ts
					"html", -- html
					"cssls", -- css
					"jsonls", -- json
					"yamlls", -- yaml
					"taplo", -- toml
					"lemminx", -- xml
					-- "harper-ls", -- 只支持英语的语法检查器
					"sqls", -- sql
					"cmake", -- cmake
					"dockerls", -- docker
					"docker_compose_language_service", --docker compose
					"diagnosticls", -- diagnostic
					"vimls", -- vimls
					"ansiblels", -- ansible
					"marksman", -- markdown
					"tinymist", -- typst
					"nginx_language_server", -- nginx
					"jinja_lsp", -- jinga
					"nil_ls", -- nix
					"buf_ls", -- protobuf
					"helm_ls", -- helm
				},
			})
		end,
	},

	-- lint
	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"shellcheck", -- bash
					-- "ast-grep", -- c, c++, rust, go, java, python, c#, javascript, jsx, typescript, html, css, kotlin, dart, lua
          "trivy", -- (keywords: c, c#, c++, dart, docker, elixir, go, helm, java, javascript, php, python, ruby, rust, terraform, typescript)
					"cfn-lint", -- json, yaml
					"cmakelint", -- cmake
					"vale", -- text, markdown, latex
					"sqlfluff", -- sql
					"ansible-lint", -- ansible
					"ruff", -- python
					"vint", -- vimscript
					"systemdlint", -- systemd
					"hadolint", -- dockerfile
					"kulala-fmt", -- kulala
				},
				-- ignore_install = { 'custom-linter' }, -- avoid trying to install an unknown linter
			})
		end,
	},

	-- formatters
	{
		"zapling/mason-conform.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-conform").setup({
				ensure_installed = {
					"beautysh", -- bash, csh, ksh, sh, zsh
					"clang-format", -- c/cpp
					"ruff", -- python
					"yapf", -- python
					"rustfmt", -- rust
					"gofumpt", -- go
					"google-java-format", -- java
					"stylua", -- lua
					"nixfmt", -- nix
					"prettierd", -- js ts json html css yaml xml
					"markdownlint", -- markdown
					"typstyle", -- typst
					"sqlfmt", -- sql
					"gersemi", -- cmake

					"dockfmt", -- docker
					"nginxbeautifier", -- nginx
				},
				-- ignore_install = {'prettier'} -- List of formatters to ignore during install
			})
		end,
	},

	-- dap
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		config = function()
			require("mason-nvim-dap").setup({
				"bash-debug-adapter", -- bash
				"cpptools", -- c/cpp, rust
				"debugpy", -- python
				"delve", -- go
				"java-debug-adapter", -- java
				"js-debug-adapter", -- js, ts
			})
		end,
	},

	-- 官方参考配置https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
	{
		"neovim/nvim-lspconfig",
		-- go语言写的sql language server
		dependencies = { "nanotee/sqls.nvim" },

		opts = {
			servers = {
				-- lua
				lua_ls = {

					settings = {
						Lua = {
							-- 设置vim是globals的一部分，避免warning
							diagnostics = {
								globals = { "vim" },
							},
							workspace = { checkThirdParty = false },
							telemetry = { enable = false },
							-- hints = { enable = true }
						},
					},
				},
				-- c、c++
				clangd = {
					init_options = { clangdFileStatus = true },
				},
				-- python
				-- pyright = {
				-- 	settings = { python = { workspaceSymbols = { enabled = true } } },
				-- },
				-- ts、js
				ts_ls = {},
				html = {},
				-- css
				cssls = {},
				-- markdown
				marksman = {},
				-- typst
				tinymist = {},
				jsonls = {},
				yamlls = {},
				-- xml
				lemminx = {},
				-- toml
				taplo = {},
				bashls = {},
				vimls = {},
				dockerls = {},
				docker_compose_language_service = {},
				rust_analyzer = {},
				-- java
				jdtls = {},
				-- js and ts
				eslint = {},
				-- go
				gopls = {},

				-- cmake
				cmake = {},
				-- ansible
				ansiblels = {},

				-- nginx
				nginx_language_server = {},
				-- jinja
				jinja_lsp = {},
				-- nix
				nil_ls = {},
				-- protobuf
				buf_ls = {},
				-- helm
				helm_ls = {},

				-- mircosoft的sql-language-server
				-- sqlls = {},

				-- go语言写的sql language server
				sqls = {},

				-- http
				kulala_ls = {},

				-- diagnostic
				-- diagnosticls = {},
			},
		},

		config = function(_, opts)
			-- blink.cmp
			local lspconfig = require("lspconfig")
			-- local lspconfig = vim.lsp.config

			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			-- systemd
			local configs = require("lspconfig.configs")
			-- local configs = vim.lsp.config
			if not configs.systemd_ls then
				configs.systemd_ls = {
					default_config = {
						cmd = { "systemd-language-server" },
						filetypes = { "systemd" },
						root_dir = function()
							return nil
						end,
						single_file_support = true,
						settings = {},
					},
					docs = {
						description = [[
	             https://github.com/psacawa/systemd-language-server

	             Language Server for Systemd unit files.
	           ]],
					},
				}
			end
			lspconfig.systemd_ls.setup({})
		end,
	},

	-- lint
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				bash = { "shellcheck" },
				zsh = { "shellcheck" },
				python = { "ruff" },
				c = { "trivy" },
				cpp = { "trivy" },
				go = { "trivy" },
				java = { "trivy" },
				js = { "trivy" },
				ts = { "trivy" },
				html = { "trivy" },
				css = { "trivy" },
				lua = { "trivy" },
				kotlin = { "trivy" },
				dart = { "trivy" },
				json = { "cfn_lint" },
				yaml = { "cfn_lint" },
				cmake = { "cmakelint" },
				markdown = { "vale" },
				ansible = { "ansible_lint" },
				sql = { "sqlfluff" },
				vimscript = { "vint" },
				dockerfile = { "hadolint" },
			}
		end,
	},

	-- 参数提示
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		config = function()
			require("lsp_signature").setup({
				bind = true, -- This is mandatory, otherwise border config won't get registered.
				handler_opts = {
					border = "rounded",
				},
			})
		end,
	},

	-- diagnosis诊断
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		opts = true,
	},
	-- {
	--   "folke/trouble.nvim",
	--   opts = {}, -- for default options, refer to the configuration section for custom setup.
	--   cmd = "Trouble",
	--   keys = {
	--     {
	--       "<leader>xx",
	--       "<cmd>Trouble diagnostics toggle<cr>",
	--       desc = "Diagnostics (Trouble)",
	--     },
	--     {
	--       "<leader>xX",
	--      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
	--       desc = "Buffer Diagnostics (Trouble)",
	--     },
	--     {
	--       "<leader>cs",
	--       "<cmd>Trouble symbols toggle focus=false<cr>",
	--       desc = "Symbols (Trouble)",
	--     },
	--     {
	--       "<leader>cl",
	--       "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	--       desc = "LSP Definitions / references / ... (Trouble)",
	--     },
	--     {
	--       "<leader>xL",
	--       "<cmd>Trouble loclist toggle<cr>",
	--       desc = "Location List (Trouble)",
	--     },
	--     {
	--       "<leader>xQ",
	--       "<cmd>Trouble qflist toggle<cr>",
	--       desc = "Quickfix List (Trouble)",
	--     },
	--   },
	-- },

	-- 统计当前关键字的引用次数。
	{
		"roobert/action-hints.nvim",
		event = "VeryLazy", -- Or `LspAttach`
		config = function()
			require("action-hints").setup({
				template = {
					definition = { text = " ⊛", color = "#add8e6" },
					references = { text = " ↱ %s", color = "#ff6666" },
				},
				use_virtual_text = true,
			})
		end,
	},

	-- lsp menu
	-- {
	-- 	"nvimdev/lspsaga.nvim",
	-- 	event = "VeryLazy",
	-- 	cmd = { "Lspsaga" },
	-- 	keys = {
	-- 		{ "K", ":Lspsaga peek_definition <cr>", mode = "n" },
	-- 		{ "T", ":Lspsaga outline <cr>", mode = "n", desc = "lsp侧边栏，代替aerial.nvim" },
	-- 		{ "<leader>fc", ":Lspsaga code_action <cr>", mode = "n" },
	-- 		{ "<leader>fT", ":Lspsaga finder <cr>", mode = "n" },
	-- 		-- { "<leader>rw", ":Lspsaga rename <cr>", mode = "n" },
	-- 		{ "[d", ":Lspsaga diagnostic_jump_next <cr>", mode = "n" },
	-- 		{ "]d", ":Lspsaga diagnostic_jump_prev <cr>", mode = "n" },
	--
	-- 		-- { "K", ":Lspsaga peek_type_definition <cr>", mode = "n" },
	-- 		-- { "K", ":Lspsaga hover_doc<cr>", mode = "n" },
	-- 	},
	-- 	config = function()
	-- 		require("lspsaga").setup({
	-- 			-- winbar
	-- 			symbol_in_winbar = {
	-- 				enable = false,
	-- 			},
	-- 			-- lsp侧边栏
	-- 			outline = {
	-- 				win_position = "right",
	-- 				keys = {
	-- 					jump = "<cr>",
	-- 					toggle_or_jump = "o",
	-- 					quit = { "q" },
	-- 				},
	-- 			},
	--
	-- 			code_action = {
	-- 				keys = {
	-- 					quit = { "q", "<esc>", "<c-n>" },
	-- 					exec = "<cr>",
	-- 				},
	-- 			},
	--
	-- 			-- 💡code_action
	-- 			lightbulb = {
	-- 				enable = false,
	-- 			},
	--
	-- 			finder = {
	-- 				max_width = 0.9,
	-- 				max_height = 0.9,
	-- 				keys = {
	-- 					vsplit = "v",
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- lsp进度
	-- {
	--    "j-hui/fidget.nvim",
	--    opts = {},
	--    config = function ()
	--      vim.api.nvim_set_keymap("n", "<leader>uS", ":Fidget suppress", { noremap = true, silent = true })
	--    end
	--  },

  -- lsp 在web上的3d图形显示
	{
    "nvimdev/visualizer.nvim",

    -- === Visualizer.nvim 命令 ===
		-- Visualizer incoming
		-- Visualizer outgoing
		-- Visualizer full
		-- Visualizer workspace_symbol

		opts = {},
	  config = function ()
	    vim.api.nvim_set_keymap("n", "<leader>rl", ":Visualizer workspace_symbol<cr>", { noremap = true, silent = true })
	  end
  },

	-- mcp
	-- {
	--    "ravitemer/mcphub.nvim",
	--    dependencies = {
	--        "nvim-lua/plenary.nvim",
	--    },
	--    build = "npm install -g mcp-hub@latest",  -- Installs `mcp-hub` node binary globally
	--    config = function()
	--        require("mcphub").setup()
	--    end
	--  },
}
