call plug#begin('~/.config/nvim/plugins')
" Plug 'voldikss/vim-translate-me'  "翻译
" Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'          "启动界面
Plug 'hardcoreplayers/spaceline.vim' "spacemcas状态栏
Plug 'morhetz/gruvbox'             "主题
Plug 'ryanoasis/vim-devicons'      "图标
Plug 'tpope/vim-surround'          "S("'
Plug 'tpope/vim-abolish'           "替换
Plug 'tpope/vim-repeat'            "可重复插件操作
" Plug 'itchyny/vim-cursorword'      "下划线
Plug 'Yggdroot/indentLine'         "缩进线
Plug 'tpope/vim-commentary'        "注释
Plug 'junegunn/vim-easy-align'     "对齐
Plug 'skywind3000/vim-keysound'    "打字机声音
Plug 'junegunn/goyo.vim'           "沉浸阅读
Plug 'easymotion/vim-easymotion'   "跳转
Plug 'MattesGroeger/vim-bookmarks' "收藏跳转
Plug 'camspiers/animate.vim'       "窗口动画
Plug 'luochen1990/rainbow'         "彩虹括号
Plug 'puremourning/vimspector'     "debug
Plug 'haya14busa/vim-edgemotion'   "函数快速移动
Plug 'neomake/neomake'             "语法检查
Plug 'sbdchd/neoformat'            "排版
Plug 'jsfaint/gen_tags.vim'        "tags
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mzlogin/vim-markdown-toc'    "自动生成目录
Plug 'padde/jump.vim'              "autojump
Plug 'simnalamburt/vim-mundo'      "undo tree
" Plug 'farmergreg/vim-lastplace'    "恢复光标位置
Plug 'liuchengxu/vim-which-key'    "按键提示
Plug 'bagrat/vim-buffet'           "标签
Plug 'rhysd/accelerated-jk'        "快速移动
Plug 'psliwka/vim-smoothie'        "移动动画
Plug 'guns/xterm-color-table.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'voldikss/vim-floaterm'       "浮动窗口
Plug 'xolox/vim-session'           "打开时恢复分屏
Plug 'xolox/vim-misc'

"git
Plug 'junegunn/gv.vim'             "git commit 浏览器
Plug 'tpope/vim-fugitive'          "在 vim 里使用 git
" Plug 'airblade/vim-gitgutter'      "vim 里显示文件变动

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"coc
Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码补全

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "目录树
" Plug 'kristijanhusak/defx-icons'

call plug#end()

set termguicolors          "enable true colors support
set ignorecase             "不区分大小写
set smartcase              "搜大写时不显示小写
set hidden                 "不需保存切换文件
set number                 "显示行号
set relativenumber         "相对行
set expandtab              "Don't expand tabs to spaces
set shiftwidth=4           "tab space
set tabstop=4              "The number of spaces a tab is
set cmdheight=2            "Height of the command line
set hlsearch               "高亮搜索
set clipboard+=unnamedplus "直接复制剪切板
set updatetime=100         "刷新时间
set path+=**               "find 子目录
set showcmd                "显示命令
set mouse=a                "开启鼠标
set list                   "开启空格字符
set listchars=tab:»·,trail:· "空格显示为·
set lazyredraw             "不要在宏和脚本执行期间更新屏幕。
set cursorline              "突出显示当前在光标下的行。
set undofile               "保留撤销历史。
set autochdir              "自动切换工作目录
set autoread               "文件发生外部改变就会发出提示
set encoding=UTF-8
" set spell                  "拼写检查
" set noswapfile             "Disable swap files.
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·

set background=dark
set laststatus=2
set showtabline=2

set makeprg=gcc\ -Wall\ -g\ %\ -o\ %

"let
filetype plugin on
syntax on
colorscheme gruvbox

let g:mapleader = ","
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'

"highlight
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+$/
" transparent
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE

" spaceline
let g:spaceline_seperate_style= 'slant-cons'
let g:spaceline_colorscheme = 'space'

"bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1

"session
let g:session_autosave = 'no'
"rainbow
let g:rainbow_active = 1
"neomake
let g:neomake_open_list = 2
" call neomake#configure#automake('rw', 1000)
call neomake#configure#automake('w')
" 选择pylint作py检查
let g:neomake_python_enabled_makers = ['pylint']

" neoformat
let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

let g:neoformat_enabled_python = ['autopep8', 'yapf', 'docformatter']

"tags
let g:gen_tags#gtags_default_map = 1

"floaterm
hi FloatermNF guibg=#282828
hi FloatermBorderNF guibg=#282828 guifg=#504945
command! Ranger FloatermNew ranger
command! Lazygit FloatermNew lazygit
command! Ipython FloatermNew ipython
let g:floaterm_height = 0.9
let g:floaterm_width = 0.7
" let g:floaterm_wintype = 'normal'
" autocmd FileType floaterm wincmd H
let g:floaterm_position = 'center'

"indentLine
"竖线
let g:indentLine_enabled = 1
let g:indentLine_char='┆'
let g:indentLine_fileTypeExclude = ['denite','startify','tagbar','vista_kind','vista']
let g:indentLine_concealcursor = 'niv'
let g:indentLine_color_term = 239
let g:indentLine_color_gui= '#504945'
let g:indentLine_showFirstIndentLevel =1
