-- lspkind
require("lspkind").init({
    -- with_text = true,
    symbol_map = {
        Text = "",
        Method = "ƒ",
        Function = "",
        Constructor = "",

        Variable = "",
        Class = "",
        Interface = "ﰮ",
        Module = "",
        Property = "",
        Unit = "",
        Value = "",
        Enum = "了",
        Keyword = "",
        Snippet = "﬌",
        Color = "",
        File = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "",
        Codeium = "",
    },
})

-- hrsh7th/nvim-cmp
local cmp = require("cmp")
local lspkind = require("lspkind")

local luasnip = require("luasnip")
local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  formatting = {
    -- 配置nvim-highlight-colors插件 + lspkind插件
    format = function(entry, item)
      local color_item = require("nvim-highlight-colors").format(entry, { kind = item.kind })
      item = require("lspkind").cmp_format({
        -- any lspkind format settings here
        -- mode = "symbol",
        mode = 'skkymbol_text',
        maxwidth = 50,
        ellipsis_char = '...',
        with_text = true,
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          latex_symbols = "[Latex]",
        },
      })(entry, item)
      if color_item.abbr_hl_group then
        item.kind_hl_group = color_item.abbr_hl_group
        item.kind = color_item.abbr
      end
      return item
    end
  },
    snippet = {
        expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
        end,
    },
    mapping = {
        ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        -- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        -- ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),

        ["<C-e>"] = cmp.mapping.abort(),
        ["<leader><tab>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),

        -- ["<C-n>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_next_item()
        --     elseif luasnip.expand_or_jumpable() then
        --         luasnip.expand_or_jump()
        --     elseif has_words_before() then
        --         cmp.complete()
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),

        -- ["<C-p>"] = cmp.mapping(function(fallback)
        --     if cmp.visible() then
        --         cmp.select_prev_item()
        --     elseif luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end, { "i", "s" }),

        ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<leader><esc>"] = cmp.mapping.close(),
        -- ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<CR>"] = cmp.mapping.confirm({}),
    },
    experimental = {
        native_menu = false,
        ghost_text = true,
    },

    -- snip
    sources = {
        { name = "codeium" }, -- ai 补全
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = "luasnip" }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
        { name = "path" },
        { name = "buffer" },
        { name = "rg" },
        { name = "treesitter" },
    },
})


-- luasnip
local ls = require "luasnip"

ls.snippets = {
    all = {
        ls.parser.parse_snippet("func", "function $1\n $2\n $0 endfunction")
    },

    vim = {
        ls.parser.parse_snippet("func", "function $1\n $2\n $0 endfunction")
    },
}

