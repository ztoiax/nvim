return {

	------ ai ------

  -- ai补全 github copilot
  -- 需要运行:Copilot auth
  {
    "zbirenbaum/copilot.lua",
    opts = true
  },

  -- ai补全 codeium
  -- {
  --     "Exafunction/codeium.nvim",
  --     config = function()
  --         require("codeium").setup({
  --         })
  --     end
  -- },

  --ai代码助手
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
    opts = {
      -- add any opts here
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
      "zbirenbaum/copilot.lua", -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      -- {
      --   -- Make sure to set this up properly if you have lazy=true
      --   'MeanderingProgrammer/render-markdown.nvim',
      --   opts = {
      --     file_types = { "markdown", "Avante" },
      --   },
      --   ft = { "markdown", "Avante" },
      -- },
    },
    config = function ()
      require("avante").setup({
        ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
        -- add any setup here
        provider = "copilot", -- Recommend using Claude
        auto_suggestions_provider = "copilot", -- Since auto-suggestions are a high-frequency operation and therefore expensive, it is recommended to specify an inexpensive provider or even a free provider: copilot
      })
    end
  },

  -- LLMs with customizable prompts
  {
      "David-Kunz/gen.nvim",
      opts = {
          model = "gemma2:2b", -- The default model to use.
          display_mode = "float", -- The display mode. Can be "float" or "split".
          show_prompt = false, -- Shows the Prompt submitted to Ollama.
          show_model = false, -- Displays which model you are using at the beginning of your chat session.
          no_auto_close = false, -- Never closes the window automatically.
          init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
          -- Function to initialize Ollama
          command = "curl --silent --no-buffer -X POST http://localhost:11434/api/generate -d $body",
          -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
          -- This can also be a lua function returning a command string, with options as the input parameter.
          -- The executed command must return a JSON object with { response, context }
          -- (context property is optional).
          list_models = '<function>', -- Retrieves a list of model names
          debug = false -- Prints errors and the command which is run.
      },
    config = function ()
      vim.keymap.set({ 'n', 'v' }, '<leader>o', ':Gen<CR>')
    end
  },

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
	--          require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })
	--
	-- 		    -- 加载nvim-scissors插件的snippets
	--          require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/nvim-scissors" } }
	--
	-- 		  end
	-- 		},
	--
	--      -- 创建当前的snippets
	--      {
	--       "chrisgrieser/nvim-scissors",
	--       dependencies = "nvim-telescope/telescope.nvim", -- optional
	-- 		  config = function ()
	--          require("scissors").setup {
	-- 	        snippetDir = "~/.config/nvim/nvim-scissors",
	--           editSnippetPopup = {
	-- 	          height = 0.4, -- relative to the window, number between 0 and 1
	-- 	          width = 0.6,
	-- 	          border = "rounded",
	-- 	          keymaps = {
	-- 		          cancel = "q",
	-- 		          saveChanges = "<leader>w", -- alternatively, can also use `:w`
	-- 		          goBackToSearch = "<BS>",
	-- 		          deleteSnippet = "<C-BS>",
	-- 		          duplicateSnippet = "<C-d>",
	-- 		          openInFile = "<C-o>",
	-- 		          insertNextToken = "<C-t>", -- insert & normal mode
	-- 		          jumpBetweenBodyAndPrefix = "<Tab>", -- insert & normal mode
	-- 	          },
	--           },
	--           telescope = {
	-- 	          -- By default, the query only searches snippet prefixes. Set this to
	-- 	          -- `true` to also search the body of the snippets.
	-- 	          alsoSearchSnippetBody = false,
	--           },
	--           -- `none` writes as a minified json file using `vim.encode.json`.
	--           -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
	--           -- you version control your snippets.
	--           jsonFormatter = "none", -- "yq"|"jq"|"none"
	--          }
	--
	--          vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
	--          -- When used in visual mode prefills the selection as body.
	--          vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)
	--
	-- 		  end
	--      },
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

  {
    'saghen/blink.cmp',
    lazy = false, -- lazy loading handled internally
    -- optional: provides snippets for the snippet source
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- 可以add cmp的source 如 { 'dmitmel/cmp-digraphs' },
      { 'saghen/blink.compat', version = '*', opts = { impersonate_nvim_cmp = true } },
      {
	      "rafamadriz/friendly-snippets",
	      config = function ()
	        -- 加载friendly-snippets
	        local dir = vim.fn.stdpath("data") .. "/lazy" .. "/friendly-snippets"
	        require("luasnip.loaders.from_vscode").lazy_load({ paths = dir })

	        -- 加载自定义的snippets
	        require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/my_snippets" })

	        -- 加载nvim-scissors插件的snippets
	        require("luasnip.loaders.from_vscode").lazy_load { paths = { "~/.config/nvim/nvim-scissors" } }

	      end
	 		},

      -- blink的github copilot补全。需要安装插件copilot.lua
      "giuxtaposition/blink-cmp-copilot",
    },

    -- use a release tag to download pre-built binaries
    version = 'v0.*',
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
        preset = 'default',
        -- ['<Tab>'] = { 'show', 'select_next', 'snippet_forward', 'fallback' },
        ['<Tab>'] = { 'select_next', 'snippet_forward', 'fallback' },
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },

        ['<S-Tab>'] = { 'select_prev', 'snippet_backward', 'fallback' },
        ['<C-e>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },

        ['<C-n>'] = { 'snippet_forward', 'fallback' },
        ['<C-p>'] = { 'snippet_backward', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        ['<C-k>'] = { 'select_prev', 'fallback' },

        ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      },

      snippets = {
        expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
        active = function(filter)
          if filter and filter.direction then
            return require('luasnip').jumpable(filter.direction)
          end
          return require('luasnip').in_snippet()
        end,
        jump = function(direction) require('luasnip').jump(direction) end,
      },

      completion = {
        -- 'prefix' will fuzzy match on the text before the cursor
        -- 'full' will fuzzy match on the text before *and* after the cursor
        -- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
        keyword = { range = 'full' },

        -- Disable auto brackets
        -- NOTE: some LSPs may add auto brackets themselves anyway
        accept = { auto_brackets = { enabled = false }, },

        -- Insert completion item on selection, don't select by default
        -- list = { selection = 'auto_insert' },
        -- or set per mode
        -- list = { selection = function(ctx) return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect' end },

        menu = {
          -- Don't automatically show the completion menu
          -- auto_show = false,
          -- Telescope下不显示窗口
          auto_show = function()
            return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false and vim.bo.filetype ~= "TelescopePrompt"
          end,

          -- nvim-cmp style menu
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" }
            },
            treesitter = { 'lsp' },
          }
        },

        -- Show documentation when selecting a completion item
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        ghost_text = { enabled = false },
      },

      sources = {
        default = {
          'lsp',
          'path',
          'snippets',
          'buffer',
          'luasnip',
          'copilot',
          -- avante ai插件
          'avante_commands',
          'avante_mentions',
          'avante_files',
        },
        cmdline = {},
        providers = {
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

          -- luasnip插件
          luasnip = {
            name = 'luasnip',
            module = 'blink.compat.source',

            score_offset = 0,

            opts = {
              use_show_condition = false,
              show_autosnippets = true,
            },
          },

          -- github的copilot ai插件
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            score_offset = 100,
            async = true,

            -- icon
            transform_items = function(_, items)
              local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
              local kind_idx = #CompletionItemKind + 1
              CompletionItemKind[kind_idx] = "Copilot"
              for _, item in ipairs(items) do
                item.kind = kind_idx
              end
              return items
            end,
          },
        },
      },

      -- experimental signature help support
      signature = { enabled = true },

      appearance = {
        highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
        kind_icons = {
          Copilot = '',
          Text = '',
          Method = 'ƒ',
          Function = '',
          Constructor = '',

          Field = '󰜢',
          Variable = '󰆦',
          Property = '󰖷',

          Class = '',
          Interface = 'ﰮ',
          Module = '',
          Struct = '',

          Unit = '󰪚',
          Value = '',
          Enum = '󰦨',
          EnumMember = '',

          Keyword = '',
          Constant = '',

          Snippet = '﬌',
          Color = '󰏘',
          File = '󰈔',
          Reference = '󰬲',
          Folder = '',
          Event = '󱐋',
          Operator = '󰪚',
          TypeParameter = '󰬛',
        },
      },
    },
    -- allows extending the enabled_providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { "sources.default" }
  },

  -- nvim api的文档补全
  -- { "folke/neodev.nvim", opts = {} },

	------ lsp ------

	-- 安装界面
	-- {
	-- 	"williamboman/mason.nvim",
	-- 	build = ":MasonUpdate",
	-- 	config = true,
	-- },

	-- {
	-- 	"williamboman/mason-lspconfig.nvim",
	-- 	config = function()
	-- 		require("mason-lspconfig").setup({
	-- 			ensure_installed = {
	-- 				---- lsp ----
	-- 				"awk_ls", -- awk
	-- 				"bashls", -- bash
	-- 				"clangd", -- c/cpp
	-- 				"pylsp",         -- python
	-- 				-- "pyright", -- python
	-- 				"rust-analyzer", -- rust
	-- 				"gopls", -- go
	-- 				"jdtls", -- java
	-- 				"lua_ls", -- lua
	-- 				"tsserver", -- js, ts
	-- 				"html", -- html
	-- 				"tailwindcss-language-server", -- css
	-- 				"jsonls", -- json
	-- 				"yamlls", -- yaml
	-- 				"sqlls", -- sql
	-- 				"cmake", -- cmake
	-- 				"dockerls", -- docker
	-- 				"diagnosticls", -- diagnostic
	-- 				"vimls", -- vimls
	-- 				"ansiblels", -- ansible
	--
	-- 				---- formatter ----
	-- 				"beautysh", -- bash, csh, ksh, sh, zsh
	-- 				"clang-format", -- c/cpp
	-- 				"autopep8", -- python
	-- 				"rustfmt", -- rust
	-- 				"gofumpt", -- go
	-- 				"google-java-format", -- java
	-- 				"stylua", -- lua
	-- 				"prettierd", -- js ts json html css yaml xml
	-- 				"markdownlint", -- markdown
	-- 				"sqlfmt", -- sql
	-- 				"gersemi", -- cmake
	-- 				-- "dockfmt",            -- docker
	-- 				-- "nginxbeautifier",    -- nginx
	--
	-- 				---- lint ----
	-- 				"shellcheck", -- bash
	-- 				"sonarlint-language-server", -- c, c++, css, go, html, java, javascript, typescript, python, php, terraform, text
	-- 				"luacheck", -- lua
	-- 				"cfn-lint", -- json, yaml
	-- 				"cmakelint", -- cmake
	-- 				"vale", -- text, markdown, latex
	-- 				"sqlfluff", -- sql
	-- 				"ansible-lint", -- ansible
	-- 				"ruff", -- python
	--
	-- 				---- dap ----
	-- 				"bash-debug-adapter", -- bash
	-- 				"cpptools", -- c/cpp, rust
	-- 				"debugpy", -- python
	-- 				"delve", -- go
	-- 				"java-debug-adapter", -- java
	-- 				"js-debug-adapter", -- js, ts
	-- 			},
	-- 		})
	-- 	end,
	-- },

	-- 配置
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nanotee/sqls.nvim" },

    opts = {
      servers = {
        -- lua
        lua_ls = {

          settings = {
            Lua = {
              -- 设置vim是globals的一部分，避免warning
              diagnostics = {
                globals = { 'vim' }
              },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
              -- hints = { enable = true }
            }
          }
        },
        -- c、c++
        clangd = {
          init_options = { clangdFileStatus = true, },
        },
        -- python
        -- pylsp = {
        --   settings = { python = { workspaceSymbols = { enabled = true } } },
        -- },

        pyright = {
            settings = { python = { workspaceSymbols = { enabled = true } } },
        },
        ts_ls = {},
        html = {},
        -- css
        -- tailwindcss = {},
        taplo = {},
        marksman = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        vimls = {},
        dockerls = {},
        rust_analyzer = {},
        -- java
        jdtls = {},
        -- js and ts
        eslint = {},
        -- go
        gopls = {
          on_attach = function(client)
            -- [[ other on_attach code ]]
            -- illuminate highlight cursor word
            require("illuminate").on_attach(client)
          end,
        },
        cmake = {},
        ansiblels = {},
        sqlls = {
          on_attach = function(client)
            client.resolved_capabilities.execute_command = true

            require("sqlls").setup({})
          end,
        },
      }
    },

    config = function(_, opts)
      -- blink.cmp
      local lspconfig = require('lspconfig')
      for server, config in pairs(opts.servers) do
        -- passing config.capabilities to blink.cmp merges with the capabilities in your
        -- `opts[server].capabilities, if you've defined it
        config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      -- keymap
		  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap=true, silent=true })
		  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap=true, silent=true, desc = "显示函数的definition"})
    end
	},

  {
    'kevinhwang91/nvim-bqf',
    opts = {},
  },

  -- lint
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				bash = { "shellcheck" },
				python = { "ruff" },
				c = { "sonarlint" },
				cpp = { "sonarlint" },
				go = { "sonarlint" },
				java = { "sonarlint" },
				js = { "sonarlint" },
				ts = { "sonarlint" },
				html = { "sonarlint" },
				lua = { "lua-lint" },
				json = { "cfn-lint" },
				yaml = { "cfn-lint" },
				cmake = { "cmakelint" },
				markdown = { "vale" },
				ansible = { "ansible-lint" },
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

	-- lsp 右下角进度ui
	{
	  "j-hui/fidget.nvim",
	   tag = "legacy",
	   event = "LspAttach",
	   config = true
	},

	-- diagnosis诊断
	{
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    opts = true
  },

  -- 统计当前关键字的引用次数。
	{
	   "roobert/action-hints.nvim",
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

	-- 代码快速重构
  {
    "ThePrimeagen/refactoring.nvim",
    cmd = { "Refactor" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },

	-- lsp menu
	-- 'glepnir/lspsaga.nvim'

	-- 'github/copilot.vim',
}
