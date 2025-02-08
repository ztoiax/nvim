return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
    },
    config = true,
    keys = {
      { '<leader>gG', mode = 'n', '<cmd>Neogit<cr>' },
    }
  },

  -- diff
  {
    'sindrets/diffview.nvim',
    opts = {
      view = {
        default = {
          -- diff2_horizontal
          layout = "diff2_vertical",
        },
        merge_tool = {
          layout = "diff3_horizontal",
        },
        file_history = {
          layout = "diff2_horizontal",
        },
      },
      keymaps = {
        disable_defaults = true, -- Disable the default keymaps
      }
    },
    keys = {
      { '<leader>gL', mode = 'n', '<cmd>DiffviewFileHistory<cr>' },
      { '<leader>gD', mode = 'n', '<cmd>DiffviewOpen<cr>' },
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
	{
    "lewis6991/gitsigns.nvim",
    opts = {},
    conifg = function ()
      vim.keymap.set("n", "<leader>gd", "Gitsigns diffthis<cr>")
      vim.keymap.set("n", "<leader>ud", "Gitsigns toggle_current_line_blame<cr>")
	  end,
  },

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
  --       github_auth_token = "GITHUB_AUTH_TOKEN",
  --
  --       -- this table entry is optional, if not provided "https://api.github.com" will be used by default
  --       -- otherwise this parameter can be used to configure a different Github API URL.
  --       github_api_url = "https://api.github.com",
  --
  --       -- whether to use telescope to display the github search results or not
  --       use_telescope = true,
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
