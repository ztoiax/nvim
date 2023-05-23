local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- 空格颜色
vim.cmd('hi ExtraWhitespace ctermbg=lightblue guibg=LightBlue')
vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- 去除分屏后的边框
vim.cmd('hi WinSeparator guibg=None')

-- lsp
vim.cmd('hi LspReferenceRead cterm=bold ctermbg=237 guibg=LightYellow')
vim.cmd('hi LspReferenceText cterm=bold ctermbg=237 guibg=LightYellow')
vim.cmd('hi LspReferenceWrite cterm=bold ctermbg=237 guibg=LightYellow')

-- cmp
vim.cmd('hi! CmpItemAbbrMatch guibg=NONE guifg=#569CD6')
vim.cmd('hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6')
vim.cmd('hi! CmpItemKindFunction guibg=NONE guifg=#C586C0')
vim.cmd('hi! CmpItemKindMethod guibg=NONE guifg=#C586C0')
vim.cmd('hi! CmpItemKindVariable guibg=NONE guifg=#9CDCFE')
vim.cmd('hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4')
