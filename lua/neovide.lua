if vim.g.neovide then
  vim.g.neovide_scale_factor = 1.0

  -- 滚动动画长度
  vim.g.neovide_cursor_animation_length = 0.01

  -- 输入时隐藏鼠标
  vim.g.neovide_hide_mouse_when_typing = true

  -- 透明度
  -- local alpha = function()
  --   return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  -- end
  -- vim.g.neovide_transparency = 0.9
  -- vim.g.transparency = 0.9
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()

  -- 刷新率
  vim.g.neovide_refresh_rate = 60
  -- 空闲刷新率
  vim.g.neovide_refresh_rate_idle = 5
  -- 全屏
  vim.g.neovide_fullscreen = true

  -- 快捷键
  vim.keymap.set('v', '<A-c>', '"+y')    -- Copy
  vim.keymap.set('n', '<A-v>', '"+P')    -- Paste normal mode
  vim.keymap.set('v', '<A-v>', '"+P')    -- Paste visual mode
  vim.keymap.set('c', '<A-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<A-v>', '<C-R>+') -- Paste insert mode
end
