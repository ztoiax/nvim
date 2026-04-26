return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- 必须在这里声明依赖，确保主插件加载前，这些插件已经下载完成
    dependencies = {
      -- "nvim-treesitter/nvim-treesitter-textobjects",
      -- "nvim-treesitter/nvim-treesitter-refactor",
      "hiphish/rainbow-delimiters.nvim",
    },
    config = function()
      -- 1. 基础配置与扩展插件全部整合
      require("nvim-treesitter.configs").setup({
        -- 解析器管理
        -- ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "python", "javascript", "typescript", "c", "cpp" },
        ensure_installed = "all",
        auto_install = true,

        -- 基础高亮
        highlight = {
          enable = true,
          -- 性能优化：大文件禁用高亮
          disable = function(lang, buf)
            local max_filesize = 100 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then return true end
          end,
        },

        -- 智能缩进
        indent = { enable = true },


        -- 扩展：Textobjects (文本对象选择与跳转)
      --   textobjects = {
      --     select = {
      --       enable = true,
      --       lookahead = true,
      --       keymaps = {
      --         ["af"] = "@function.outer",
      --         ["if"] = "@function.inner",
      --         ["ac"] = "@class.outer",
      --         ["ic"] = "@class.inner",
      --       },
      --     },
      --     move = {
      --       enable = true,
      --       set_jumps = true,
      --       goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
      --       goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
      --     },
      --   },
      --
      --   -- 扩展：Refactor (重命名与跳转)
      --   refactor = {
      --     highlight_definitions = { enable = true },
      --     smart_rename = {
      --       enable = true,
      --       keymaps = { smart_rename = ",rw" },
      --     },
      --   },
      })

      --  代码折叠
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldenable = false -- 默认不折叠，手动打开
    end,
  },
}
