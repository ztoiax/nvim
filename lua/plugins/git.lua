return {
	-- 在 vim 里使用 git
	-- {
	-- 	"tpope/vim-fugitive",
	--    init = function ()
	-- 	  vim.cmd([[
	--        let g:fugitive_no_maps = v:true
	--      ]])
	-- 		vim.keymap.set("n", "<leader>gd", "<Cmd>Gvdiffsplit<CR>")
	--    end
	-- },

	-- magit
	"jreybert/vimagit",

  {
    'SuperBo/fugit2.nvim',
    opts = {
      width = 80,
    },
    dependencies = {
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-lua/plenary.nvim',
      {
        'chrisgrieser/nvim-tinygit', -- optional: for Github PR view
        dependencies = { 'stevearc/dressing.nvim' }
      },
    },
    cmd = { 'Fugit2', 'Fugit2Diff', 'Fugit2Graph' },
    keys = {
      { '<leader>gf', mode = 'n', '<cmd>Fugit2<cr>' },
      { '<leader>gd', mode = 'n', '<cmd>Fugit2Diff<cr>' }
    }
  },

	-- 当前行显示commit信息
	{
		"f-person/git-blame.nvim",
    confing = function ()
		  vim.cmd([[ let g:gitblame_date_format = '%x, %X']])
    end
	},

	-- 显示文件变动
	{ "lewis6991/gitsigns.nvim", config = true },

  -- 处理git conflict
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function ()
      require'git-conflict'.setup {
        default_mappings = {
          ours = 'o', -- 保留当前分支
          theirs = 't', -- 保留所有分支
          none = '0', -- 保留当前分支
          both = 'b',
          next = 'n',
          prev = 'p',
        },
      }
    end
  },

  -- git分支
  {
    'isakbm/gitgraph.nvim',
    dependencies = { 'sindrets/diffview.nvim' },
    ---@type I.GGConfig
    opts = {
      hooks = {
        -- Check diff of a commit
        on_select_commit = function(commit)
          vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
          vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
        end,
        -- Check diff from commit a -> commit b
        on_select_range_commit = function(from, to)
          vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
          vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
        end,
      },
      keys = {
        {
          "<leader>gl",
          function()
            require('gitgraph').draw({}, { all = true, max_count = 5000 })
          end,
          desc = "GitGraph - Draw",
        },
      },
    },
  },

	-- github
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    config = function()
      require("litee.gh").setup()
    end,
  },

  -- github代码搜索
  -- {
  --   'napisani/nvim-github-codesearch',
  --   build = 'make',
  --   config = function ()
  --     require("nvim-github-codesearch").setup({
  --       -- an optional table entry to explicitly configure the API key to use for Github API requests.
  --       -- alternatively, you can configure this parameter by export an environment variable named "GITHUB_AUTH_TOKEN"
  --       github_auth_token = "",
  --
  --       -- this table entry is optional, if not provided "https://api.github.com" will be used by default
  --       -- otherwise this parameter can be used to configure a different Github API URL.
  --       github_api_url = "https://api.github.com",
  --
  --       -- whether to use telescope to display the github search results or not
  --       use_telescope = false,
  --     })
  --
  --     -- Usage
  --
  --     -- this will display a prompt to enter search terms
  --     -- require("nvim-github-codesearch").prompt()
  --
  --     -- this will submit a search for the designated query without displaying a prompt
  --     -- require("nvim-github-codesearch").search("some query")
  --
  --     -- removes any temp files created by nvim-github-codesearch
  --     -- require("nvim-github-codesearch").cleanup()
  --   end
  -- },
}
