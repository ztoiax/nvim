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

	-- ai补全 fittencode
	{
		"luozhiya/fittencode.nvim",
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

	{
		"milanglacier/minuet-ai.nvim",
		config = function()
			require("minuet").setup({
				provider = "openai_compatible",
				provider_options = {
					openai_compatible = {
						end_point = "https://api.deepseek.com/v1",
						api_key = "DEEPSEEK_API_KEY",
						name = "deepseek",
						optional = {
							max_tokens = 256,
							top_p = 0.9,
						},
					},
				},
				virtualtext = {
					auto_trigger_ft = {},
					keymap = {
						-- accept whole completion
						accept = "<leader>a",
						-- accept one line
						accept_line = "<leader>L",
						-- accept n lines (prompts for number)
						accept_n_lines = "<A-z>",
						-- Cycle to prev completion item, or manually invoke completion
						prev = "<A-[>",
						-- Cycle to next completion item, or manually invoke completion
						next = "<A-]>",
						dismiss = "<A-e>",
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
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string

			-- provider = "copilot",
			-- auto_suggestions_provider = "copilot",

			provider = "openai", -- 设置deepseek
			auto_suggestions_provider = "openai", -- 设置deepseek

			-- deepseek设置
			openai = {
				endpoint = "https://api.deepseek.com/v1",
				model = "deepseek-chat",
				timeout = 30000, -- Timeout in milliseconds
				temperature = 0,
				max_tokens = 4096,
				-- optional
				api_key_name = "DEEPSEEK_API_KEY", -- linux环境变量
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

	{
		"Kurama622/llm.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
		config = function()
			local tools = require("llm.common.tools")
			require("llm").setup({
				app_handler = {
					OptimizeCode = {
						handler = tools.side_by_side_handler,
						-- opts = {
						--   streaming_handler = local_llm_streaming_handler,
						-- },
					},
					TestCode = {
						handler = tools.side_by_side_handler,
						prompt = [[ Write some test cases for the following code, only return the test cases.
            Give the code content directly, do not use code blocks or other tags to wrap it. ]],
						opts = {
							right = {
								title = " Test Cases ",
							},
						},
					},
					OptimCompare = {
						handler = tools.action_handler,
						opts = {
							fetch_key = function()
								return switch("enable_gpt")
							end,
							url = "https://models.inference.ai.azure.com/chat/completions",
							model = "gpt-4o",
							api_type = "openai",
						},
					},

					Translate = {
						handler = tools.qa_handler,
						opts = {
							fetch_key = function()
								return switch("enable_glm")
							end,
							url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
							model = "glm-4-flash",
							api_type = "zhipu",

							component_width = "60%",
							component_height = "50%",
							query = {
								title = " 󰊿 Trans ",
								hl = { link = "Define" },
							},
							input_box_opts = {
								size = "15%",
								win_options = {
									winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
								},
							},
							preview_box_opts = {
								size = "85%",
								win_options = {
									winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
								},
							},
						},
					},

					-- check siliconflow's balance
					UserInfo = {
						handler = function()
							local key = os.getenv("LLM_KEY")
							local res = tools.curl_request_handler(
								"https://api.siliconflow.cn/v1/user/info",
								{ "GET", "-H", string.format("'Authorization: Bearer %s'", key) }
							)
							if res ~= nil then
								print("balance: " .. res.data.balance)
							end
						end,
					},
					WordTranslate = {
						handler = tools.flexi_handler,
						prompt = "Translate the following text to Chinese, please only return the translation",
						opts = {
							fetch_key = function()
								return switch("enable_glm")
							end,
							url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
							model = "glm-4-flash",
							api_type = "zhipu",
							args = [[return {url, "-N", "-X", "POST", "-H", "Content-Type: application/json", "-H", authorization, "-d", vim.fn.json_encode(body)}]],
							exit_on_move = true,
							enter_flexible_window = false,
						},
					},
					CodeExplain = {
						handler = tools.flexi_handler,
						prompt = "Explain the following code, please only return the explanation, and answer in Chinese",
						opts = {
							fetch_key = function()
								return switch("enable_glm")
							end,
							url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
							model = "glm-4-flash",
							api_type = "zhipu",
							enter_flexible_window = true,
						},
					},
					CommitMsg = {
						handler = tools.flexi_handler,
						prompt = function()
							return string.format(
								[[You are an expert at following the Conventional Commit specification. Given the git diff listed below, please generate a commit message for me:
1. Start with an action verb (e.g., feat, fix, refactor, chore, etc.), followed by a colon.
2. Briefly mention the file or module name that was changed.
3. Describe the specific changes made.

Examples:
- feat: update common/util.py, added test cases for util.py
- fix: resolve bug in user/auth.py related to login validation
- refactor: optimize database queries in models/query.py

Based on this format, generate appropriate commit messages. Respond with message only. DO NOT format the message in Markdown code blocks, DO NOT use backticks:

```diff
%s
```
]],
								vim.fn.system("git diff --no-ext-diff --staged")
							)
						end,
						opts = {
							fetch_key = function()
								return switch("enable_glm")
							end,
							url = "https://open.bigmodel.cn/api/paas/v4/chat/completions",
							model = "glm-4-flash",
							api_type = "zhipu",
							enter_flexible_window = true,
							apply_visual_selection = false,
						},
					},
				},
			})
		end,
		keys = {
			{ "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
			{ "<leader>ts", mode = "x", "<cmd>LLMAppHandler WordTranslate<cr>" },
			{ "<leader>ae", mode = "v", "<cmd>LLMAppHandler CodeExplain<cr>" },
			{ "<leader>at", mode = "n", "<cmd>LLMAppHandler Translate<cr>" },
			{ "<leader>tc", mode = "x", "<cmd>LLMAppHandler TestCode<cr>" },
			{ "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimCompare<cr>" },
			{ "<leader>au", mode = "n", "<cmd>LLMAppHandler UserInfo<cr>" },
			{ "<leader>ag", mode = "n", "<cmd>LLMAppHandler CommitMsg<cr>" },
			-- { "<leader>ao", mode = "x", "<cmd>LLMAppHandler OptimizeCode<cr>" },
		},
	},

	-- LLMs with customizable prompts
	-- {
	--     "David-Kunz/gen.nvim",
	--     opts = {
	--         model = "gemma2:2b", -- The default model to use.
	--         display_mode = "float", -- The display mode. Can be "float" or "split".
	--         show_prompt = false, -- Shows the Prompt submitted to Ollama.
	--         show_model = false, -- Displays which model you are using at the beginning of your chat session.
	--         no_auto_close = false, -- Never closes the window automatically.
	--         init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
	--         -- Function to initialize Ollama
	--         command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
	--         -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	--         -- This can also be a lua function returning a command string, with options as the input parameter.
	--         -- The executed command must return a JSON object with { response, context }
	--         -- (context property is optional).
	--         list_models = '<function>', -- Retrieves a list of model names
	--         debug = false -- Prints errors and the command which is run.
	--     },
	--   config = function ()
	--     vim.keymap.set({ 'n', 'v' }, '<leader>l', ':Gen<CR>')
	--   end
	-- },

	------ completion ------

	-- coq
	-- {
	--     "ms-jpq/coq_nvim", branch = "coq",
	--     dependencies = {
	--          "ms-jpq/coq.artifacts", branch = "artifacts" ,
	--          "ms-jpq/coq.thirdparty", branch = "3p" ,
	--     },
	--     config = function() require("completion/init-coq") end,
	-- },

	-- cmp
	-- {
	-- 	"hrsh7th/nvim-cmp",
	-- 	dependencies = {
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-path",
	-- 		"lukas-reineke/cmp-rg",
	--
	--      -- highlight completion
	--      "ray-x/cmp-treesitter",
	--
	-- 		-- icon
	-- 		"onsails/lspkind-nvim",
	--
	-- 		-- luasnip
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		{
	-- 		  "L3MON4D3/LuaSnip",
	--       -- follow latest release.
	--       version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	--       -- install jsregexp (optional!).
	--       build = "make install_jsregexp",
	--       config = function ()
	-- 		    require("lua-snip")
	--       end
	-- 		},
	-- 		{
	-- 		  "rafamadriz/friendly-snippets",
	-- 		  config = function ()
	--          -- 加载friendly-snippets
	--          local dir = vim.fn.stdpath("data") .. "/lazy" .. "/friendly-snippets"
	--          require("luasnip.loaders.from_vscode").lazy_load({ paths = dir })
	--
	-- 		    -- 加载自定义的snippets
	--          require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
	--
	-- 		    -- 加载nvim-scissors插件的snippets
	--        -- require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/nvim-scissors" })
	--
	-- 		  end
	-- 		},
	--

	-- 创建当前的snippets
	{
		"chrisgrieser/nvim-scissors",
		event = "VeryLazy",
		dependencies = "nvim-telescope/telescope.nvim", -- optional
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
			})

			vim.keymap.set("n", "<leader>se", function()
				require("scissors").editSnippet()
			end)
			-- When used in visual mode prefills the selection as body.
			vim.keymap.set({ "n", "x" }, "<leader>sa", function()
				require("scissors").addNewSnippet()
			end)
		end,
	},
	--
	-- 		-- vim-dadbod补全
	--      {
	--        "kristijanhusak/vim-dadbod-completion",
	--        init = function()
	--          vim.api.nvim_create_autocmd("FileType", {
	--            desc = "dadbod completion",
	--            group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
	--            pattern = { "sql", "mysql", "plsql" },
	--            callback = function() require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } } end,
	--          })
	--        end,
	--      },
	-- 	},
	-- 	config = function()
	-- 		require("completion/init-cmp")
	-- 	end,
	-- },

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
				-- ['<Tab>'] = { 'show', 'select_next', 'snippet_forward', 'fallback' },
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
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
			-- snippets = { preset = 'luasnip' },
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

			completion = {
				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before *and* after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword = { range = "full" },

				-- Disable auto brackets
				-- NOTE: some LSPs may add auto brackets themselves anyway
				accept = { auto_brackets = { enabled = false } },

				-- Insert completion item on selection, don't select by default
				-- list = { selection = 'auto_insert' },
				-- or set per mode
				-- list = { selection = function(ctx) return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect' end },

				menu = {
					-- Don't automatically show the completion menu
					-- auto_show = false,
					-- Telescope下不显示窗口
					auto_show = function()
						return vim.bo.buftype ~= "prompt"
							and vim.b.completion ~= false
							and vim.bo.filetype ~= "TelescopePrompt"
					end,

					-- nvim-cmp style menu
					draw = {
						-- columns = {
						--   { "label", "label_description", gap = 1 },
						--   { "kind_icon", "kind" }
						-- },

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
				ghost_text = { enabled = false },
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
					"fittencode",
					-- avante ai插件
					"avante_commands",
					"avante_mentions",
					"avante_files",
					-- lazydev插件
					"lazydev",
					-- minuet ai插件
					"minuet",
				},
				cmdline = {},
				providers = {
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

					-- minuet ai插件
					minuet = {
						name = "minuet",
						module = "minuet.blink",
						score_offset = 8, -- Gives minuet higher priority among suggestions
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

			-- completion = { trigger = { prefetch_on_insert = false } },

			-- experimental signature help support
			signature = { enabled = true },

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
		"williamboman/mason.nvim",
		-- build = ":MasonUpdate",
		config = true,
	},
	------ lsp ------
	{
		"williamboman/mason-lspconfig.nvim",
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
					-- "harper_ls", -- 语法检查器
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
					"buf", -- protobuf
					"helm-ls", -- helm
				},
			})
		end,
	},

	-- lint
	{
		"rshkarin/mason-nvim-lint",
		config = function()
			require("mason-nvim-lint").setup({
				ensure_installed = {
					"shellcheck", -- bash
					"ast-grep", -- c, c++, rust, go, java, python, c#, javascript, jsx, typescript, html, css, kotlin, dart, lua
					"cfn-lint", -- json, yaml
					"cmakelint", -- cmake
					"vale", -- text, markdown, latex
					"sqlfluff", -- sql
					"ansible-lint", -- ansible
					"ruff", -- python
					"vint", -- vimscript
					"systemdlint", -- systemd
					"hadolint", -- dockerfile
				},
				-- ignore_install = { 'custom-linter' }, -- avoid trying to install an unknown linter
			})
		end,
	},

	-- formatters
	{
		"zapling/mason-conform.nvim",
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
				pyright = {
					settings = { python = { workspaceSymbols = { enabled = true } } },
				},
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

				-- diagnostic
				-- diagnosticls = {},
			},
		},

		config = function(_, opts)
			-- blink.cmp
			local lspconfig = require("lspconfig")
			for server, config in pairs(opts.servers) do
				-- passing config.capabilities to blink.cmp merges with the capabilities in your
				-- `opts[server].capabilities, if you've defined it
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end
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
				c = { "ast-grep" },
				cpp = { "ast-grep" },
				go = { "ast-grep" },
				java = { "ast-grep" },
				js = { "ast-grep" },
				ts = { "ast-grep" },
				html = { "ast-grep" },
				css = { "ast-grep" },
				lua = { "ast-grep" },
				json = { "cfn-lint" },
				yaml = { "cfn-lint" },
				cmake = { "cmakelint" },
				markdown = { "vale" },
				ansible = { "ansible-lint" },
				sql = { "sqlfluff" },
				vimscript = { "vint" },
				dockerfile = { "hadolint" },
			}
		end,
	},

	-- 参数提示
	{
		"ray-x/lsp_signature.nvim",
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
	{
		"nvimdev/lspsaga.nvim",
		event = "VeryLazy",
		cmd = { "Lspsaga" },
		keys = {
			{ "K", ":Lspsaga peek_definition <cr>", mode = "n" },
			{ "T", ":Lspsaga outline <cr>", mode = "n", desc = "lsp侧边栏，代替aerial.nvim" },
			{ "<leader>fc", ":Lspsaga code_action <cr>", mode = "n" },
			{ "<leader>fT", ":Lspsaga finder <cr>", mode = "n" },
			-- { "<leader>rw", ":Lspsaga rename <cr>", mode = "n" },
			{ "[d", ":Lspsaga diagnostic_jump_next <cr>", mode = "n" },
			{ "]d", ":Lspsaga diagnostic_jump_prev <cr>", mode = "n" },

			-- { "K", ":Lspsaga peek_type_definition <cr>", mode = "n" },
			-- { "K", ":Lspsaga hover_doc<cr>", mode = "n" },
		},
		config = function()
			require("lspsaga").setup({
				-- lsp侧边栏
				outline = {
					win_position = "right",
					keys = {
						jump = "<cr>",
						toggle_or_jump = "o",
						quit = { "q" },
					},
				},

				code_action = {
					keys = {
						quit = { "q", "<esc>", "<c-n>" },
						exec = "<cr>",
					},
				},

        finder = {
          max_width = 0.9,
          max_height = 0.9,
          keys = {
            vsplit = 'v',
          },
        }
			})
		end,
	},

	-- lsp进度
	-- {
	--    "j-hui/fidget.nvim",
	--    opts = {},
	--    config = function ()
	--      vim.api.nvim_set_keymap("n", "<leader>uS", ":Fidget suppress", { noremap = true, silent = true })
	--    end
	--  },
}
