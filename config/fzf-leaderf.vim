"fzf
nmap <Leader>fh :History <CR>
nmap <Leader>ff :Files  <CR>
nmap <Leader>a  :Rg! <CR>
nmap <Leader>fc :Colors<CR>
nmap <Leader>f<Space> :Marks  <CR>
nmap <Leader>fg :GF  <CR>
" nmap <Leader>ft :BTags  <CR>
" nmap <Leader>f/ :BLines  <CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
 " let g:fzf_layout = {
 "  \ 'window': 'new | wincmd J | resize 1 | call animate#window_percent_height(0.5)'
 "  \ }
 
 " rga instead rg
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rga --column --line-number --no-heading --color=always --smart-case -- %s * || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

"LeaderF
let g:Lf_PreviewInPopup = 1
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1

nmap <Leader>fb :<C-U><C-R>=printf("Leaderf --regexMode buffer %s", "")<CR><CR>
nmap <Leader>fm :<C-U><C-R>=printf("Leaderf --regexMode mru %s", "")<CR><CR>
nmap <Leader>ft :<C-U><C-R>=printf("Leaderf --regexMode bufTag %s", "")<CR><CR>
nmap <Leader>f/ :<C-U><C-R>=printf("Leaderf --regexMode line %s", "")<CR><CR>
nmap <Leader>f. :<C-U><C-R>=printf("Leaderf rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
nmap <Leader>fa :<C-U><C-R>=printf("Leaderf rg -e %s ", expand("<cword>"))<CR><CR>

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
" let $GTAGSCONF = '/path/to/share/gtags/gtags.conf'

" telescope
"lua <<EOF
"require("telescope").setup {
"    defaults = {
"        vimgrep_arguments = {
"            "rga",
"            "--color=never",
"            "--no-heading",
"            "--with-filename",
"            "--line-number",
"            "--column",
"            "--smart-case"
"        },
"        prompt_position = "bottom",
"        prompt_prefix = " ",
"        selection_caret = " ",
"        entry_prefix = "  ",
"        initial_mode = "insert",
"        selection_strategy = "reset",
"        sorting_strategy = "descending",
"        layout_strategy = "horizontal",
"        layout_defaults = {
"            horizontal = {
"                preview_width = 0.5
"            },
"            vertical = {
"                mirror = false
"            }
"        },
"        file_sorter = require "telescope.sorters".get_fuzzy_file,
"        file_ignore_patterns = {},
"        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
"        shorten_path = true,
"        winblend = 0,
"        width = 0.75,
"        preview_cutoff = 120,
"        results_height = 1,
"        results_width = 0.8,
"        border = {},
"        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
"        color_devicons = true,
"        use_less = true,
"        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
"        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
"        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
"        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
"        -- Developer configurations: Not meant for general override
"        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
"    },
"    extensions = {
"        media_files = {
"            filetypes = {"png", "webp", "jpg", "jpeg"},
"            find_cmd = "rga" -- find command (defaults to `fd`)
"        }
"--        fzy_native = {
"--                  override_generic_sorter = false,
"--                  override_file_sorter = true,
"--        }
"    }
"}
" EOF

" nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
" nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
" nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
" nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
" nnoremap <leader>fr <cmd>lua require'telescope.builtin'.lsp_references{}<CR>

" fzf-lsp
lua require'fzf_lsp'.setup()
nmap <leader>j :References<cr>
nmap <leader>k :Definitions<cr>

nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
