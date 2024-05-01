return {
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
	-- typst preview
  {
    'chomosuke/typst-preview.nvim',
    lazy = false, -- or ft = 'typst'
    version = '0.1.*',
    build = function() require 'typst-preview'.update() end,
  },

	-- 自动生成目录
	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
		opts = {},
    config = function ()
		  vim.cmd([[ nmap <Leader>rd :GenTocGFM<cr> ]])
		end
	},

	-- 快速插入markdown表格
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },
    init = function ()
      		vim.cmd([[ let g:table_mode_tableize_map = '<leader>m' ]])
    end
	},

  -- 使用ui快速插入markdown表格
	{
    "Myzel394/easytables.nvim",
		ft = { "markdown" },
    config = function ()
      require("easytables").setup({})
    end,
  },

	-- 表格自动对齐
	{
		"masukomi/vim-markdown-folding",
		ft = { "markdown" },
		opts = {},
		config = function()
			vim.cmd([[
        function! s:isAtStartOfLine(mapping)
            let text_before_cursor = getline('.')[0 : col('.')-1]
            let mapping_pattern = '\V' . escape(a:mapping, '\')
            let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
            return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
        endfunction

        inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'

        inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'
      ]])
		end,
	},
  -- 快速编辑表格中的其中一个选项
  {
      'kiran94/edit-markdown-table.nvim',
		  ft = { "markdown" },
      config = true,
      cmd = "EditMarkdownTable",
  },

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
