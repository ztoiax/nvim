if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
  -- 字体
  vim.o.guifont = "DroidSansMono Nerd Font:h16"
  vim.g.neovide_scale_factor = 1.0

  -- 滚动动画长度
  vim.g.neovide_scroll_animation_length = 0.3

  -- 当一次滚动多个屏幕时，只有滚动动作末尾的这几行才会显示动画。将其设置为0以在没有任何动画的情况下捕捉到最终位置，或者设置为9999之类的大值以始终滚动整个屏幕，就像Neovide<=0.10.4所做的那样。
  vim.g.neovide_scroll_animation_far_lines = 1

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
end
