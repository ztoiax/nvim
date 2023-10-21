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

	-- 表格自动对齐
	{
		"masukomi/vim-markdown-folding",
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

  -- 集成markmap
  {
    "Zeioth/markmap.nvim",
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
}
