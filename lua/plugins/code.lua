return {
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
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
		},
		config = function()
			require("completion/init-cmp")
		end,
	},

	------ lsp ------

	-- 安装界面
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					---- lsp ----
					"awk_ls", -- awk
					"bashls", -- bash
					"clangd", -- c/cpp
					-- "pylsp",         -- python
					"pyright", -- python
					"rust-analyzer", -- rust
					"gopls", -- go
					"jdtls", -- java
					"lua_ls", -- lua
					"tsserver", -- js, ts
					"html", -- html
					"cssls", -- css
					"jsonls", -- json
					"yamlls", -- yaml
					"marksman", -- markdown
					"sqlls", -- sql
					"cmake", -- cmake
					"dockerls", -- docker
					"diagnosticls", -- diagnostic
					"vimls", -- vimls
					"ansiblels", -- ansible

					---- formatter ----
					"beautysh", -- bash, csh, ksh, sh, zsh
					"clang-format", -- c/cpp
					"autopep8", -- python
					"rustfmt", -- rust
					"gofumpt", -- go
					"google-java-format", -- java
					"stylua", -- lua
					"prettierd", -- js ts json html css yaml xml
					"markdownlint", -- markdown
					"sqlfmt", -- sql
					"gersemi", -- cmake
					-- "dockfmt",            -- docker
					-- "nginxbeautifier",    -- nginx

					---- lint ----
					"shellcheck", -- bash
					"sonarlint-language-server", -- c, c++, css, go, html, java, javascript, typescript, python, php, terraform, text
					"luacheck", -- lua
					"cfn-lint", -- json, yaml
					"cmakelint", -- cmake
					"vale", -- text, markdown, latex
					"sqlfluff", -- sql
					"ansible-lint", -- ansible

					---- dap ----
					"bash-debug-adapter", -- bash
					"cpptools", -- c/cpp, rust
					"debugpy", -- python
					"delve", -- go
					"java-debug-adapter", -- java
					"js-debug-adapter", -- js, ts
				},
			})
		end,
	},

	-- 配置
	{
		"neovim/nvim-lspconfig",
		dependencies = { "nanotee/sqls.nvim" },
		config = function()
			require("code/init-lsp")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				bash = { "shellcheck" },
				python = { "sonarlint" },
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
	{ "j-hui/fidget.nvim", config = true },

	-- diagnosis诊断
	{
		"Maan2003/lsp_lines.nvim",
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

	-- lsp menu
	-- 'glepnir/lspsaga.nvim'

	-- 'github/copilot.vim',
}
