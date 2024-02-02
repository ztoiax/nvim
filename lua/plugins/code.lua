return {

	------ ai ------

  -- ai补全
  -- {
  --     "Exafunction/codeium.nvim",
  --     config = function()
  --         require("codeium").setup({
  --         })
  --     end
  -- },

  -- LLMs with customizable prompts
  {
      "David-Kunz/gen.nvim",
      opts = {
          model = "mistral", -- The default model to use.
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
      }
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
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"lukas-reineke/cmp-rg",

			-- icon
			"onsails/lspkind-nvim",

			-- luasnip
			"saadparwaiz1/cmp_luasnip",
			{
			  "L3MON4D3/LuaSnip",
	      -- follow latest release.
	      version = "<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	      -- install jsregexp (optional!).
	      build = "make install_jsregexp",
	      config = function ()
			    require("lua-snip")
	      end
			},
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

      -- 创建当前的snippets
      {
	      "chrisgrieser/nvim-scissors",
	      dependencies = "nvim-telescope/telescope.nvim", -- optional
			  config = function ()
          require("scissors").setup {
		        snippetDir = "~/.config/nvim/nvim-scissors",
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
	          },
	          -- `none` writes as a minified json file using `vim.encode.json`.
	          -- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
	          -- you version control your snippets.
	          jsonFormatter = "none", -- "yq"|"jq"|"none"
          }

          vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
          -- When used in visual mode prefills the selection as body.
          vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

			  end
      },

			-- vim-dadbod补全
      {
        "kristijanhusak/vim-dadbod-completion",
        init = function()
          vim.api.nvim_create_autocmd("FileType", {
            desc = "dadbod completion",
            group = vim.api.nvim_create_augroup("dadbod_cmp", { clear = true }),
            pattern = { "sql", "mysql", "plsql" },
            callback = function() require("cmp").setup.buffer { sources = { { name = "vim-dadbod-completion" } } } end,
          })
        end,
      },
		},
		config = function()
			require("completion/init-cmp")
		end,
	},

  -- nvim api的文档补全
  { "folke/neodev.nvim", opts = {} },

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
		config = function()
			require("code/init-lsp")
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { noremap=true, silent=true })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap=true, silent=true, desc = "显示函数的definition"})
		end,
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
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
			-- 启动lsp_lines
			vim.keymap.set("", "<Leader>l", require("lsp_lines").toggle, { desc = "Toggle lsp_lines" })

			-- 关闭默认的lsp diagnosis
			vim.diagnostic.config({ virtual_text = false })

			-- icons
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " ", other = "﫠" }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
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

	-- lsp menu
	-- 'glepnir/lspsaga.nvim'

	-- 'github/copilot.vim',
}
