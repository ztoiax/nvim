return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#0A0A15',
				base01 = '#0A0A15',
				base02 = '#a5968c',
				base03 = '#a5968c',
				base04 = '#ffece0',
				base05 = '#fff7f2',
				base06 = '#fff7f2',
				base07 = '#fff7f2',
				base08 = '#ff483f',
				base09 = '#ff483f',
				base0A = '#ff7c26',
				base0B = '#6cff4c',
				base0C = '#ffba8c',
				base0D = '#ff7c26',
				base0E = '#ff934c',
				base0F = '#ff934c',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#a5968c',
				fg = '#fff7f2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#ff7c26',
				fg = '#0A0A15',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#a5968c' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#ffba8c', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#ff934c',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#ff7c26',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#ff7c26',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#ffba8c',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#6cff4c',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#ffece0' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#ffece0' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#a5968c',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
