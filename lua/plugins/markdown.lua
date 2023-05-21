return {
	-- preview
	{
		"iamcco/markdown-preview.nvim",
		-- call mkdp#util#install()
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		vim.cmd([[
            nmap <Leader>rr <Plug>MarkdownPreview
        ]]),
	},

	-- 自动生成目录
	{
		"mzlogin/vim-markdown-toc",
		ft = { "markdown" },
		vim.cmd([[
          nmap <Leader>rd :GenTocGFM<cr>
      ]]),
	},

	-- 快速插入markdown表格
	{
		"dhruvasagar/vim-table-mode",
		ft = { "markdown" },

		vim.cmd([[
          let g:table_mode_tableize_map = '<leader>m'
      ]]),
	},

	-- 表格自动对齐
	{
		"masukomi/vim-markdown-folding",
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
}
