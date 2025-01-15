return {

  -- highlight
  -- {
  --   'MeanderingProgrammer/markdown.nvim',
  --   main = "render-markdown",
  --   opts = {},
  --   name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  -- },

	-- preview
	{
		"iamcco/markdown-preview.nvim",
		-- call mkdp#util#install()
		build = function() vim.fn["mkdp#util#install"]() end,
		ft = { "markdown" },
		opts = {},
	   config = function ()
		  vim.cmd([[
	       let g:mkdp_auto_close = 0        " 切换buffer后不关闭预览
	       let g:mkdp_open_to_the_world = 0 " 如果set 1，那么网络其他人也可以访问
	       let g:mkdp_markdown_css = ''     " 设置自定义css路径

		    nmap <Leader>rr <Plug>MarkdownPreviewToggle
		  ]])
		end
	},


  -- 完全lua写，不需要外部程序。
  -- {
  --   'brianhuster/live-preview.nvim',
  --   dependencies = {'brianhuster/autosave.nvim'}, -- Not required, but recomended for autosaving
  --   config = function ()
  --     vim.keymap.set('n', '<Leader>rr', ':LivePreview<CR>')
  --   end
  -- },

	-- 需要安装bun（js包管理器）。安装后进入插件目录运行bun install（安装很慢，大概300多M）
  -- {
  --   "wallpants/github-preview.nvim",
  --   cmd = { "GithubPreviewToggle" },
  --   keys = { "<leader>rr" },
  --   opts = {
  --     -- config goes here
  --   },
  --   config = function(_, opts)
  --     require("github-preview").setup(opts)
  --     vim.keymap.set("n", "<leader>rr", require("github-preview").fns.toggle)
  --     vim.keymap.set("n", "<leader>rs", require("github-preview").fns.single_file_toggle)
  --     vim.keymap.set("n", "<leader>mpd", require("github-preview").fns.details_tags_toggle)
  --   end,
  -- },

  -- highlight markdown
  -- {
  --   "OXY2DEV/markview.nvim",
  --   lazy = false,      -- Recommended
  --   ft = "markdown" -- If you decide to lazy-load anyway
  -- },

	-- typst preview
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '0.1.*',
    build = function() require 'typst-preview'.update() end,
  },

	-- 自动生成目录
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown",  -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    config = function ()
      require('mtoc').setup({})
      vim.keymap.set('n', '<Leader>rd', ':Mtoc<CR>')
    end
  },

  -- 自动对齐表格
  {
    'Kicamon/markdown-table-mode.nvim',
    config = function()
      require('markdown-table-mode').setup()
    end
  },

	-- 快速插入markdown表格
  -- {
  --   'SCJangra/table-nvim',
  --   ft = 'markdown',
  --   opts =
  --     {
  --       padd_column_separators = true,   -- Insert a space around column separators.
  --       mappings = {                     -- next and prev work in Normal and Insert mode. All other mappings work in Normal mode.
  --         next = '<leader>tt',                -- Go to next cell.
  --         prev = '<leader>tT',              -- Go to previous cell.
  --         insert_row_up = '<leader>tK',       -- Insert a row above the current row.
  --         insert_row_down = '<leader>tJ',     -- Insert a row below the current row.
  --         move_row_up = '<leader>tk',       -- Move the current row up.
  --         move_row_down = '<leader>tj',     -- Move the current row down.
  --         insert_column_left = '<leader>tH',  -- Insert a column to the left of current column.
  --         insert_column_right = '<leader>tL', -- Insert a column to the right of current column.
  --         move_column_left = '<leader>th',  -- Move the current column to the left.
  --         move_column_right = '<leader>tl', -- Move the current column to the right.
  --         insert_table = '<leader>ti',        -- Insert a new table.
  --         insert_table_alt = '<leader>tI',  -- Insert a new table that is not surrounded by pipes.
  --         delete_column = '<leader>td',       -- Delete the column under cursor.
  --       }
  --     }
  -- },

  -- 显示思维导图。支持mermai、d2、d2。有点卡
  -- {
  --   "3rd/diagram.nvim",
  --   dependencies = {
  --     "3rd/image.nvim",
  --   },
  --   config = function ()
  --     require("diagram").setup({
  --       integrations = {
  --         require("diagram.integrations.markdown"),
  --         require("diagram.integrations.neorg"),
  --       },
  --       renderer_options = {
  --         mermaid = {
  --           theme = "forest",
  --         },
  --         plantuml = {
  --           charset = "utf-8",
  --         },
  --         d2 = {
  --           theme_id = 1,
  --         },
  --       },
  --     })
  --   end
  -- },

  -- 集成markmap
  {
    "Zeioth/markmap.nvim",
		ft = { "markdown" },
    build = "yarn global add markmap-cli",
    cmd = {"MarkmapOpen", "MarkmapSave", "MarkmapWatch", "MarkmapWatchStop"},
    opts = {
      html_output = "/tmp/markmap.html", -- (default) Setting a empty string "" here means: [Current buffer path].html
      hide_toolbar = false, -- (default)
      grace_period = 3600000 -- (default) Stops markmap watch after 60 minutes. Set it to 0 to disable the grace_period.
    },
    config = function(_, opts) require("markmap").setup(opts) end,

    init = function ()
      vim.cmd([[ nmap <Leader>rm :MarkmapWatch<cr> ]])
    end
  },

-- markdown管理和快捷键
  -- {
  --     'jakewvincent/mkdnflow.nvim',
  --   ft = { "markdown" },
  --     config = function()
  --     require('mkdnflow').setup({
  --         modules = {
  --             bib = true,
  --             buffers = true,
  --             conceal = true,
  --             cursor = true,
  --             folds = true,
  --             links = true,
  --             lists = true,
  --             maps = true,
  --             paths = true,
  --             tables = true,
  --             yaml = false,
  --             cmp = false
  --         },
  --         filetypes = {md = true, rmd = true, markdown = true},
  --         create_dirs = true,
  --         perspective = {
  --             priority = 'first',
  --             fallback = 'current',
  --             root_tell = false,
  --             nvim_wd_heel = false,
  --             update = false
  --         },
  --         wrap = false,
  --         bib = {
  --             default_path = nil,
  --             find_in_root = true
  --         },
  --         silent = false,
  --         cursor = {
  --             jump_patterns = nil
  --         },
  --         links = {
  --             style = 'markdown',
  --             name_is_source = false,
  --             conceal = false,
  --             context = 0,
  --             implicit_extension = nil,
  --             transform_implicit = false,
  --             transform_explicit = function(text)
  --                 text = text:gsub(" ", "-")
  --                 text = text:lower()
  --                 text = os.date('%Y-%m-%d_')..text
  --                 return(text)
  --             end
  --         },
  --         new_file_template = {
  --             use_template = false,
  --             placeholders = {
  --                 before = {
  --                     title = "link_title",
  --                     date = "os_date"
  --                 },
  --                 after = {}
  --             },
  --             template = "# {{ title }}"
  --         },
  --         to_do = {
  --             symbols = {' ', '-', 'X'},
  --             update_parents = true,
  --             not_started = ' ',
  --             in_progress = '-',
  --             complete = 'X'
  --         },
  --         tables = {
  --             trim_whitespace = true,
  --             format_on_move = true,
  --             auto_extend_rows = false,
  --             auto_extend_cols = false,
  --             style = {
  --                 cell_padding = 1,
  --                 separator_padding = 1,
  --                 outer_pipes = true,
  --                 mimic_alignment = true
  --             }
  --         },
  --         yaml = {
  --             bib = { override = false }
  --         },
  --         mappings = {
  --             MkdnEnter = {{'n', 'v'}, '<CR>'},
  --             MkdnTab = false,
  --             MkdnSTab = false,
  --             -- MkdnNextLink = {'n', '<Tab>'},
  --             -- MkdnPrevLink = {'n', '<S-Tab>'},
  --             MkdnNextHeading = {'n', ']]'},
  --             MkdnPrevHeading = {'n', '[['},
  --             MkdnGoBack = {'n', '<BS>'},
  --             MkdnGoForward = {'n', '<Del>'},
  --             MkdnCreateLink = false, -- see MkdnEnter
  --             MkdnCreateLinkFromClipboard = {{'n', 'v'}, '<leader>p'}, -- see MkdnEnter
  --             MkdnFollowLink = false, -- see MkdnEnter
  --             MkdnDestroyLink = {'n', '<M-CR>'},
  --             MkdnTagSpan = {'v', '<M-CR>'},
  --             MkdnMoveSource = {'n', '<F2>'},
  --             MkdnYankAnchorLink = {'n', 'yaa'},
  --             MkdnYankFileAnchorLink = {'n', 'yfa'},
  --             MkdnIncreaseHeading = {'n', '+'},
  --             MkdnDecreaseHeading = {'n', '-'},
  --             MkdnToggleToDo = {{'n', 'v'}, '<C-Space>'},
  --             MkdnNewListItem = false,
  --             MkdnNewListItemBelowInsert = {'n', 'o'},
  --             MkdnNewListItemAboveInsert = {'n', 'O'},
  --             MkdnExtendList = false,
  --             MkdnUpdateNumbering = {'n', '<leader>nn'},
  --             MkdnTableNextCell = {'i', '<Tab>'},
  --             MkdnTablePrevCell = {'i', '<S-Tab>'},
  --             MkdnTableNextRow = false,
  --             MkdnTablePrevRow = {'i', '<M-CR>'},
  --             MkdnTableNewRowBelow = {'n', '<leader>ir'},
  --             MkdnTableNewRowAbove = {'n', '<leader>iR'},
  --             MkdnTableNewColAfter = {'n', '<leader>ic'},
  --             MkdnTableNewColBefore = {'n', '<leader>iC'},
  --             MkdnFoldSection = {'n', '<leader>f'},
  --             MkdnUnfoldSection = {'n', '<leader>F'}
  --         }
  --     })
  --     end
  -- },
}
