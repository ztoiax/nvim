" context.vim 移动时显示函数上下文
let g:context_add_mappings = 0

" session 开启vim时恢复会话
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'

" vista 侧边栏
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.

" change update
let g:vista_update_on_text_changed = 1

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
\   "function": "\uf794",
\   "variable": "\uf71b",
\  }

nnoremap tt :Vista!!<cr>
nnoremap T :Vista!!<cr>

" treesitter
" 折叠
" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
  rainbow = {
    enable = true
  }
}
EOF

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

" LocalIndentLie
let g:localIndentLie_insertDisable = 1
let g:localIndentLie_termColor = 240
let g:localIndentLie_guiColor  = '#af005f' " or '#RRGGBB'
let g:localIndentLie_char = '|' " '¦', '┊', '┆',...
autocmd FileType * LocalIndentLieOn

" colorizer
lua require'colorizer'.setup()

" highlightedyank
let g:highlightedyank_highlight_duration = 300

" gitsigns
" lua require('gitsigns').setup()

"hipairs
let g:hiPairs_stopline_more = 150
