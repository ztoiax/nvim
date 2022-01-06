" context.vim 移动时显示函数上下文
let g:context_add_mappings = 0

" session 开启vim时恢复会话
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" treesitter
" 折叠
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  rainbow = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "gnr",
      scope_incremental = "gnc",
      node_decremental = "gnm",
    },
  },
  additional_vim_regex_highlighting = true,
}
EOF

" 树折叠
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

" highlight markdown code block
let g:markdown_fenced_languages = ['bash=sh', 'sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'python', 'py=python']

" devicons
lua <<EOF
require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
EOF

" indent-blankline

lua << EOF
-- vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    -- 下划线
    -- show_current_context_start = true,
}
EOF

" colorizer
lua require'colorizer'.setup()

" highlightedyank
let g:highlightedyank_highlight_duration = 300

" gitsigns
lua require('gitsigns').setup ()

" hipairs
let g:hiPairs_stopline_more = 150

" registers
nmap <silent> <leader>" :Registers<cr>

" notify
lua <<EOF
vim.notify = require("notify")
EOF

" symbols-outline
lua << EOF
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = 'right',
    relative_width = true,
    width = 40,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "i",
        hover_symbol = "o",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}
EOF

" Vista
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista#renderer#enable_icon = 1
" nnoremap T :SymbolsOutline<cr>
nnoremap T :Vista!!<cr>

" iswap
lua << EOF
require('iswap').setup{
  -- The keys that will be used as a selection, in order
  -- ('asdfghjklqwertyuiopzxcvbnm' by default)
  keys = 'qwertyuiop',

  -- Grey out the rest of the text when making a selection
  -- (enabled by default)
  grey = 'disable',

  -- Highlight group for the sniping value (asdf etc.)
  -- default 'Search'
  hl_snipe = 'ErrorMsg',

  -- Highlight group for the visual selection of terms
  -- default 'Visual'
  hl_selection = 'WarningMsg',

  -- Highlight group for the greyed background
  -- default 'Comment'
  hl_grey = 'LineNr',

  -- Automatically swap with only two arguments
  -- default nil
  autoswap = true
}
EOF
nmap <leader>is :ISwap<CR>

" Comment
lua require('Comment').setup()

" renamer
lua << EOF
local mappings_utils = require('renamer.mappings.utils')
require('renamer').setup {
    -- The popup title, shown if `border` is true
    title = 'Rename',
    -- The padding around the popup content
    padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    },
    -- Whether or not to shown a border around the popup
    border = true,
    -- The characters which make up the border
    border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    -- Whether or not to highlight the current word references through LSP
    show_refs = true,
    -- Whether or not to add resulting changes to the quickfix list
    with_qf_list = true,
    -- Whether or not to enter the new name through the UI or Neovim's `input`
    -- prompt
    with_popup = true,
    -- The keymaps available while in the `renamer` buffer. The example below
    -- overrides the default values, but you can add others as well.
    mappings = {
        ['<c-i>'] = mappings_utils.set_cursor_to_start,
        ['<c-a>'] = mappings_utils.set_cursor_to_end,
        ['<c-e>'] = mappings_utils.set_cursor_to_word_end,
        ['<c-b>'] = mappings_utils.set_cursor_to_word_start,
        ['<c-c>'] = mappings_utils.clear_line,
        ['<c-u>'] = mappings_utils.undo,
        ['<c-r>'] = mappings_utils.redo,
    },
    -- Custom handler to be run after successfully renaming the word. Receives
    -- the LSP 'textDocument/rename' raw response as its parameter.
    handler = nil,
}
EOF
nnoremap <silent> <leader>r <cmd>lua require('renamer').rename()<cr>
vnoremap <silent> <leader>r <cmd>lua require('renamer').rename()<cr>

" lualine
lua << END

local lsp_status = require('lsp-status')
lsp_status.register_progress()
require('lualine').setup{
    options = {
        theme = 'OceanicNext'
    },
    sections = { lualine_c = { "require'lsp-status'.status()" } }
}
END
