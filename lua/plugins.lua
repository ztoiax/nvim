local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    -- 对当前缓冲区, 打开一个lua的repl
    use {'rafcamlet/nvim-luapad', cmd = {'Luapad', 'LuaRun'}}
    use 'svermeulen/vimpeccable'        -- nvim lua函数
    use 'nvim-lua/plenary.nvim'         -- lua库函数

    -- Moonscript(lua的语法糖), 实现 +=, ..=, python的列表推导式
    use {'svermeulen/nvim-moonmaker', cmd = {'Moon', 'MoonCompile'}}

    use 'jaawerth/fennel-nvim'          -- lua写的lisp方言
    use 'Olical/conjure'                -- fennel的repl
    -- 语法树
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        cmd = {'TSModuleInfo', 'TSUpdate', 'TSInstall'},
        require'nvim-treesitter.configs'.setup {
            ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
            highlight = {
              enable = true,              -- false will disable the whole extension
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
        },
        vim.cmd([[
        " 折叠
        " set foldmethod=expr
        " set foldexpr=nvim_treesitter#foldexpr()
        ]])
    }
    -- 语法树库函数
    use {
        'nvim-treesitter/playground',
        run = ':TSInstall query',
        cmd = {'TSPlaygroundToggle', 'TSHighlightCapturesUnderCursor'},
    }
    -- rename, 函数跳转
    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        require'nvim-treesitter.configs'.setup {
            refactor = {
                highlight_definitions = { enable = true },
                -- highlight_current_scope = { enable = true },
                smart_rename = {
                    enable = true,
                    keymaps = {
                        smart_rename = ",rw",
                    },
                },
                navigation = {
                    enable = true,
                    keymaps = {
                        goto_definition = ",k",
                        goto_next_usage = ",j",
                        -- goto_previous_usage = ",j",

                        list_definitions = "gnD",
                        list_definitions_toc = "gO",
                },
            },
          },
        }
    }
    --彩虹括号
    use {
        'p00f/nvim-ts-rainbow',
        require'nvim-treesitter.configs'.setup {
            -- 彩虹括号
            rainbow = {
              enable = true,
              extended_mode = true,
            },
        }
    }
    -- 移动时显示函数上下文
    use {
        'romgrk/nvim-treesitter-context',
        cmd = 'TSContextToggle',
        -- require'treesitter-context'.setup{}
    }
    -- highlight if, else语法块
    use {
        'andymass/vim-matchup',
        require'nvim-treesitter.configs'.setup {
          matchup = {
            enable = true,
          },
        }
    }

    -- 图标(icons)
    use {
        'kyazdani42/nvim-web-devicons',
        config = function()
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
        end
    }
    -- 状态栏lsp
    use {'SmiteshP/nvim-gps', require'nvim-gps'.setup()}
    -- 状态栏
    use {
        'nvim-lualine/lualine.nvim',
        require'lualine'.setup{
            options = {
                theme = 'OceanicNext'
            },
            sections = {
                lualine_c = {
                    -- "require'lsp-status'.status()"
                    { require'nvim-gps'.get_location, cond = require'nvim-gps'.is_available },
                }
            }
        }
    }
    -- 单词跳转
    use {'phaazon/hop.nvim', require'hop'.setup()}
    use 'gcmt/wildfire.vim'             -- 快速块选
    use {'mfussenegger/nvim-treehopper',} -- 语法树块选
    use {'numToStr/Comment.nvim', require'Comment'.setup()} -- 注释

    ---------- ui ----------
    use 'kevinhwang91/nvim-hlslens'       -- highlight /
    use 'Yggdroot/hiPairs'                -- highlight cursor pairs
    -- highlight identline
    use {
        'lukas-reineke/indent-blankline.nvim',
        -- vim.opt.list = true
        -- vim.opt.listchars:append("space:⋅")
        -- vim.opt.listchars:append("eol:↴")
        require'indent_blankline'.setup {
            space_char_blankline = " ",
            show_current_context = true,
            -- 下划线
            -- show_current_context_start = true,
        }
    }
    -- highlight yank
    use {
        'machakann/vim-highlightedyank',
        vim.cmd([[let g:highlightedyank_highlight_duration = 300]])
    }
    use 'RRethy/vim-illuminate'           -- highlight cursor word
    -- highlight color
    use {
        'norcalli/nvim-colorizer.lua',
        require'colorizer'.setup()
    }
    use 'romainl/vim-cool'              -- 搜索后自动取消highlight
    use 'romgrk/barbar.nvim'            -- 标签
    use {
        'folke/trouble.nvim',
        cmd = 'TroubleToggle',
        config = function()
        require("trouble").setup {}
      end
    }
    use 'rafi/awesome-vim-colorschemes' -- awesome主题
    use 'junegunn/goyo.vim'             -- 沉浸阅读
    use 'simnalamburt/vim-mundo'        -- undo tree
    use 'psliwka/vim-smoothie'          -- 移动动画
    --浮动窗口
    use "numToStr/FTerm.nvim"
    use {
        'voldikss/vim-floaterm',
        vim.cmd([[
            hi FloatermNF guibg=#282828
            hi FloatermBorderNF guibg=#282828 guifg=#504945
            command! Ranger FloatermNew ranger
            command! Broot FloatermNew broot -sdpw
            command! Lazygit FloatermNew lazygit
            command! Lazydocker FloatermNew lazydocker
            command! Ptpython FloatermNew ptpython
            command! Pudb FloatermNew python -m pudb %
            let g:floaterm_height = 0.9
            let g:floaterm_width = 0.9
            let g:floaterm_wintype = 'normal'
            " autocmd FileType floaterm wincmd H
            let g:floaterm_autoclose = 2
            let g:floaterm_position = 'center'
            let g:floaterm_opener = 'edit'

            " 取消边框
            let g:floaterm_borderchars = '        '
            let g:floaterm_title = ''
        ]])
    }
    use 'camspiers/animate.vim'         -- 窗口动画
    use 'chrisbra/csv.vim'              -- csv file format
    -- 翻译
    use {
        'voldikss/vim-translator',
        vim.cmd([[
            " let g:translator_history_enable = 1
            let g:translator_default_engines = get(g:, 'translator_default_engines', ['bing'])
            " let g:translator_proxy_url = ''
            let g:translator_window_type = 'popup'
        ]])
    }
    use 'skywind3000/vim-keysound'      -- 打字机声音
    -- 通知menu
    use {
        'rcarriga/nvim-notify',
        config = 'vim.notify = require("notify")'
    }
    use {'simrat39/symbols-outline.nvim'} -- lsp侧边栏
    -- markdown侧边栏
    use {
        'liuchengxu/vista.vim',
        vim.cmd([[
            let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
            let g:vista#renderer#enable_icon = 1
            " nnoremap T :SymbolsOutline<cr>
            nnoremap T :Vista!!<cr>
        ]])
    }
    use 'gelguy/wilder.nvim'            -- command补全
    -- 启动时恢复会话
    use {
        'rmagatti/auto-session',
        config = function()
            require('auto-session').setup {
              log_level = 'info',
              auto_session_suppress_dirs = {'~/.config/nvim/sessions'}
            }
        end
    }
    -- use 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } --在浏览器嵌入nvim

    -- ---------- Enhace text ----------
    use 'rhysd/accelerated-jk'          -- 快速移动
    use 'brooth/far.vim'                -- instead and replace
    use 'wellle/targets.vim'            -- enhance di da
    -- extends f
    use {
        'rhysd/clever-f.vim',
        vim.cmd([[
            let g:clever_f_ignore_case = 1 " Ignore case (忽略大小写)
            let g:clever_f_chars_match_any_signs = ';'
            let g:clever_f_not_overwrites_standard_mappings = 1
        ]])
    }

    use 'sbdchd/neoformat'              -- formatting
    use 'mhartington/formatter.nvim'

    use 'kristijanhusak/vim-dadbod-ui'
    use 'tpope/vim-dadbod'              -- 数据库
    use 'tpope/vim-surround'            -- 快速添加特殊符号--(<[]>)--'
    use 'tpope/vim-abolish'             -- 替换和驼峰命名
    use 'tpope/vim-repeat'              -- 可重复插件操作
    use 'junegunn/vim-easy-align'       -- 多行对齐
    use 'mg979/vim-visual-multi'        -- 光标多选
    -- autopairs
    use {'windwp/nvim-autopairs', require'nvim-autopairs'.setup()}
    use 'tversteeg/registers.nvim'      --registers menu
    -- 参数位置交换
    use {'mizlan/iswap.nvim', require'iswap'.setup{}}

    -- use 'chentau/marks.nvim'

    -- ---------- Quick jump ----------
    -- fzf
    use {
        'junegunn/fzf',--[[ , { 'dir': '~/.fzf', 'do': './install --all' } ]]
        run = 'cd ~/.fzf && ./install --all'
    }

    use 'vijaymarupudi/nvim-fzf'
    use 'ibhagwan/fzf-lua'

    -- -- telescope
    -- -- use 'nvim-lua/popup.nvim'
    -- -- use 'nvim-telescope/telescope.nvim'
    -- -- use 'nvim-telescope/telescope-fzy-native.nvim'

    ---------- Other ----------
    -- use 'puremourning/vimspector', {'do': './install_gadget.py --enable-python --enable-go --enable-bash'}  --调试器
    use 'lambdalisue/suda.vim'
    use 'skywind3000/asyncrun.vim'      -- 异步
    use 'bfredl/nvim-miniyank'          -- yank历史
    use { 'michaelb/sniprun', run = 'bash ./install.sh'} -- 部分代码运行

    -- markdown
    use 'masukomi/vim-markdown-folding' -- 折叠

    -- use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
    use {
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
        ft = {'markdown'}
    }
    use 'mzlogin/vim-markdown-toc'      -- 自动生成目录
    use 'dhruvasagar/vim-table-mode'    -- 快速插入markdown表格

    -- completion
    -- -- use 'ms-jpq/coq_nvim', {'branch': 'coq'}
    -- -- use 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    -- -- use 'ms-jpq/coq.thirdparty', {'branch': '3p'}

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'onsails/lspkind-nvim'          -- completion icon

    use {
        'saadparwaiz1/cmp_luasnip',
        requires = { { 'L3MON4D3/LuaSnip' }, { 'rafamadriz/friendly-snippets' } },
    }

    -- lsp
    use 'nanotee/sqls.nvim'             -- lsp sql
    use 'neovim/nvim-lspconfig'         -- lsp
    use 'ray-x/lsp_signature.nvim'      -- 参数提示
    use 'glepnir/lspsaga.nvim'          -- completion menu
    -- use 'kiteco/vim-plugin'             -- kite ai completion
    -- use 'codota/tabnine-vim'            -- tabnine ai completion

    -- test
    use 'roxma/nvim-yarp'
    use 'roxma/vim-hug-neovim-rpc'

    use {'rcarriga/vim-ultest',
        requires = {"vim-test/vim-test"},
        run = ':UpdateRemoteuseins',
        vim.cmd([[
            let test#python#pytest#options = "--color=yes"
            let test#javascript#jest#options = "--color=always"
            let test#javascript#reactscripts#options = "--watchAll=false"
            let g:ultest_use_pty = 1
        ]])
    }

    -- debug
    use {
        'rcarriga/nvim-dap-ui',
        requires = { { 'mfussenegger/nvim-dap' }, { 'thehamsta/nvim-dap-virtual-text' } },
    }

    use 'jbyuki/one-small-step-for-vimkind' -- nvim lua dap
    -- use 'mfussenegger/nvim-dap-python'

    -- git
    use 'tpope/vim-fugitive'            -- 在 vim 里使用 git
    use 'tpope/vim-rhubarb'             -- Gbrowse 配合vim-fugitive
    use 'jreybert/vimagit'              -- magit
    use {
        'f-person/git-blame.nvim',       -- 当前行显示commit信息
        vim.cmd([[ let g:gitblame_date_format = '%x, %X']])
    }
    -- 显示文件变动
    use {
        'lewis6991/gitsigns.nvim',
        require'gitsigns'.setup ()
    }

    if packer_bootstrap then
        require'packer'.sync()
    end
end)
