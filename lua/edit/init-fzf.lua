local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
    fullscreen       = false,           -- start fullscreen?
    winopts = {
        height           = 0.95,            -- window height
        width            = 0.95,            -- window width
        row              = 0.25,            -- window row position (0=top, 1=bottom)
        col              = 0.55,            -- window col position (0=left, 1=right)
        fullscreen       = true,            -- start fullscreen?
        preview = {
          default        = 'bat',           -- override the default previewer?
          layout         = 'vertical',      -- horizontal|vertical|flex
          vertical       = 'down:75%',      -- up|down:size
          horizontal     = 'right:55%',     -- right|left:size
        },
    },
    keymap = {
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          ["<F2>"]        = "toggle-fullscreen",
          -- Only valid with the 'builtin' previewer
          ["<F3>"]        = "toggle-preview-wrap",
          ["<F4>"]        = "toggle-preview",
          -- Rotate preview clockwise/counter-clockwise
          ["<F5>"]        = "toggle-preview-ccw",
          ["<F6>"]        = "toggle-preview-cw",
          ["<S-down>"]    = "preview-page-down",
          ["<S-up>"]      = "preview-page-up",
          ["<S-left>"]    = "preview-page-reset",
        },
        fzf = {
          -- fzf '--bind=' options
          ["ctrl-z"]      = "abort",
          ["ctrl-u"]      = "unix-line-discard",
          ["ctrl-f"]      = "half-page-down",
          ["ctrl-b"]      = "half-page-up",
          ["ctrl-a"]      = "beginning-of-line",
          ["ctrl-e"]      = "end-of-line",
          ["alt-a"]       = "toggle-all",
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"]          = "toggle-preview-wrap",
          ["f4"]          = "toggle-preview",
          ["shift-down"]  = "preview-page-down",
          ["shift-up"]    = "preview-page-up",
        },
        fzf_opts = {
            -- options are sent as `<left>=<right>`
            -- set to `false` to remove a flag
            -- set to '' for a non-value flag
            -- for raw args use `fzf_args` instead
            ['--ansi']        = '',
            ['--prompt']      = '> ',
            ['--info']        = 'inline',
            ['--height']      = '100%',
            ['--layout']      = 'reverse',
        },
    },
    previewers = {
        grep = {
            prompt            = 'Rg❯ ',
            input_prompt      = 'Grep For❯ ',
            multiprocess      = true,           -- run command in a separate process
            git_icons         = true,           -- show git icons?
            file_icons        = true,           -- show file icons?
            color_icons       = true,           -- colorize file|git icons
            -- executed command priority is 'cmd' (if exists)
            -- otherwise auto-detect prioritizes `rg` over `grep`
            -- default options are controlled by 'rg|grep_opts'
            -- cmd            = "rg --vimgrep",
            rg_opts           = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
            grep_opts         = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
            -- 'live_grep_glob' options:
            glob_flag         = "--iglob",  -- for case sensitive globs use '--glob'
            glob_separator    = "%s%-%-"    -- query separator pattern (lua): ' --'
        },
    },
    files = {
        prompt            = 'Files❯ ',
        multiprocess      = true,           -- run command in a separate process
        -- find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts           = "--color=never --files --hidden --follow -g '!.git' *",
        -- fd_opts           = "--color=never --type f --hidden --follow --exclude .git",
    },
    tags = {
        preview = 'bat'
    },
    lsp = {
      prompt_postfix    = '❯ ',       -- will be appended to the LSP label
                                      -- to override use 'prompt' instead
      cwd_only          = false,      -- LSP/diagnostics for cwd only?
      async_or_timeout  = 5000,       -- timeout(ms) or 'true' for async calls
      file_icons        = false,
      git_icons         = false,
      lsp_icons         = true,
      severity          = "hint",
      icons = {
        ["Error"]       = { icon = "", color = "red" },       -- error
        ["Warning"]     = { icon = "", color = "yellow" },    -- warning
        ["Information"] = { icon = "", color = "blue" },      -- info
        ["Hint"]        = { icon = "", color = "magenta" },   -- hint
      },
    },
}

-- vim.api.nvim_set_keymap('n', '<Leader>ff', ':FzfLua files<CR>', { noremap = true, silent = true })

vim.cmd([[
    nmap <leader>ff :lua require'fzf-lua'.files({ cmd = 'rg --color=never --files --hidden --no-ignore', cwd=vim.loop.cwd(), show_cwd_header=true })<cr>
    " nmap <leader>fh :FzfLua oldfiles<cr>
    nmap <leader>fh :FzfLua help_tags<cr>
    nmap <leader>fm :FzfLua oldfiles<cr>
    nmap <leader>fb :FzfLua buffers<cr>
    nmap <leader>ft :lua require'fzf-lua'.lsp_document_symbols({ fzf_cli_args = '--with-nth 2..' })<cr>
    " autocmd FileType markdown nmap <buffer> <leader>ft :lua require'fzf-lua'.btags({ ctags_file = '~/.cache/ctags/tags', cwd='' })<cr>

    " nmap <leader>f/ :FzfLua lines<cr>
    nmap <leader>f/ :FzfLua blines<cr>
    nmap <leader>f. :lua require'fzf-lua'.grep_cword({ cwd=vim.loop.cwd(), fzf_cli_args = '--with-nth 2..' })<cr>
    vmap <leader>f. :lua require'fzf-lua'.grep_cword({ cwd=vim.loop.cwd(), fzf_cli_args = '--with-nth 2..' })<cr>
    " nmap <leader>a :lua require'fzf-lua'.grep({ cmd = 'grep --binary-files=without-match --line-number --recursive --color=auto --perl-regexp', cwd=vim.loop.cwd(), show_cwd_header=true })<cr>
    nmap <leader>a :lua require'fzf-lua'.grep({ cmd = "rg --column --line-number --no-heading --color=never --smart-case --max-depth 3 --no-ignore ", cwd=vim.loop.cwd(), show_cwd_header=true })<cr>
    nmap <leader>A :lua require'fzf-lua'.grep({ cmd = "rg --column --line-number --no-heading --color=never --smart-case --max-depth 1 --no-ignore ", cwd=vim.loop.cwd(), show_cwd_header=true })<cr>
    nmap <leader>fc :FzfLua colorschemes<cr>

    nmap <leader>K :FzfLua lsp_definitions<cr>
    nmap <leader>J :FzfLua lsp_references<cr>

    nmap <leader><space>  :FzfLua marks<cr>

    nmap <leader>/ :FzfLua search_history<cr>
    nmap <leader>: :FzfLua commands<cr>
    nmap <leader>fk  :FzfLua keymaps<cr>
    cmap <C-r> FzfLua command_history<cr>
]])
