require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        prompt_position = "bottom",
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "horizontal",
        layout_defaults = {
            horizontal = {
                preview_width = 0.5
            },
            vertical = {
                mirror = false
            }
        },
        file_sorter = require "telescope.sorters".get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require "telescope.sorters".get_generic_fuzzy_sorter,
        shorten_path = true,
        winblend = 0,
        width = 0.75,
        preview_cutoff = 120,
        results_height = 1,
        results_width = 0.8,
        border = {},
        borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
        color_devicons = true,
        use_less = true,
        set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
        file_previewer = require "telescope.previewers".vim_buffer_cat.new,
        grep_previewer = require "telescope.previewers".vim_buffer_vimgrep.new,
        qflist_previewer = require "telescope.previewers".vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require "telescope.previewers".buffer_previewer_maker
    },
    extensions = {
        media_files = {
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rga" -- find command (defaults to `fd`)
        },
        undo = {
          -- telescope-undo.nvim config, see below
        },
--        fzy_native = {
--                  override_generic_sorter = false,
--                  override_file_sorter = true,
--        }
    }
}

vim.cmd([[
    nnoremap <leader>ff :lua require('telescope.builtin').find_files({theme='dropdown'})<cr>
    nnoremap <leader>fm :lua require('telescope.builtin').oldfiles({theme='dropdown'})<cr>
    nnoremap <leader>a :lua require('telescope.builtin').live_grep()<cr>
    nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
    nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>
    nnoremap <leader>f. :lua require'telescope.builtin'.current_buffer_fuzzy_find{}<CR>
    nnoremap <leader>/ :lua require'telescope.builtin'.search_history{}<CR>
    nnoremap <leader><space> :lua require'telescope.builtin'.marks{}<CR>
    nnoremap <leader>fc :lua require'telescope.builtin'.colorscheme{}<CR>
    nnoremap <leader>fj :lua require'telescope.builtin'.jumplist{}<CR>
    nnoremap <leader>fv :lua require'telescope.builtin'.vim_options{}<CR>
    nnoremap <leader>fk :lua require'telescope.builtin'.keymaps{}<CR>
    nnoremap <leader>" :lua require'telescope.builtin'.registers{}<CR>

    nnoremap <leader>ft :lua require'telescope.builtin'.lsp_document_symbols{}<CR>
    nnoremap <leader>J :lua require'telescope.builtin'.lsp_references{}<CR>
    nnoremap <leader>K :lua require'telescope.builtin'.lsp_definitions{}<CR>

    nnoremap <leader>c :lua require'telescope.builtin'.symbols{}<CR>

    cmap <c-r> lua require'telescope.builtin'.command_history{}<CR>
]])
