source ~/.config/nvim/config/plug.vim
call plug#begin('~/.config/nvim/plugins')

""""" ui """""
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'glepnir/dashboard-nvim'        "启动界面
Plug 'mhinz/vim-startify'            "启动界面
Plug 'romainl/vim-cool'              "搜索后自动取消高亮
Plug 'wellle/context.vim'            "移动时显示函数上下文
Plug 'kyazdani42/nvim-web-devicons'  "标签图标
Plug 'romgrk/barbar.nvim'            "标签
Plug 'vim-airline/vim-airline'
Plug 'liuchengxu/vista.vim'          "侧边栏
Plug 'rafi/awesome-vim-colorschemes' "awesome主题
Plug 'ryanoasis/vim-devicons'        "图标
Plug 'junegunn/goyo.vim'             "沉浸阅读
Plug 'luochen1990/rainbow'           "彩虹括号
Plug 'simnalamburt/vim-mundo'        "undo tree
" Plug 'liuchengxu/vim-which-key'      "按键提示
Plug 'rhysd/accelerated-jk'          "快速移动
Plug 'psliwka/vim-smoothie'          "移动动画
Plug 'voldikss/vim-floaterm'         "浮动窗口
Plug 'camspiers/animate.vim'         "窗口动画
Plug 'chrisbra/csv.vim'              "csv file format
Plug 'voldikss/vim-translator'       "翻译
Plug 'skywind3000/vim-keysound'      "打字机声音
Plug 'xolox/vim-session'             "启动时恢复会话
Plug 'xolox/vim-misc'
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } } "在浏览器嵌入nvim

""""" Enhace text """""
Plug 'brooth/far.vim'                "instead and replace
Plug 'wellle/targets.vim'            "enhance di da
Plug 'rhysd/clever-f.vim'            "extends f
Plug 'honza/vim-snippets'            "代码片段
Plug 'gcmt/wildfire.vim'             "快速块选
Plug 'tpope/vim-surround'            "快速添加特殊符号"(<[]>)"'
Plug 'tpope/vim-abolish'             "替换
Plug 'tpope/vim-repeat'              "可重复插件操作
Plug 'Yggdroot/indentLine'           "缩进线
Plug 'tpope/vim-commentary'          "注释
Plug 'junegunn/vim-easy-align'       "多行对齐
Plug 'mg979/vim-visual-multi'        "光标多选
" Plug 'itchyny/vim-cursorword'        "下划线
" Plug 'MattesGroeger/vim-bookmarks'   "收藏跳转

""""" Quick jump """""
Plug 'easymotion/vim-easymotion'     "跳转
Plug 'haya14busa/vim-edgemotion'     "函数快速移动
Plug 'pechorin/any-jump.vim'         "lsp-jump

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ojroques/nvim-lspfuzzy'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

""""" Other """""
" Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-python --enable-go --enable-bash'}  "调试器
Plug 'neomake/neomake'               "语法edgemotion检查
Plug 'sbdchd/neoformat'              "代码排版
Plug 'skywind3000/asyncrun.vim'      "异步

"markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}                                "markdown预览
Plug 'mzlogin/vim-markdown-toc'      "自动生成目录
Plug 'dhruvasagar/vim-table-mode'    "快速插入markdown表格
Plug 'guns/xterm-color-table.vim'

"coc
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码补全

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"git
Plug 'junegunn/gv.vim'               "git commit 浏览器
Plug 'tpope/vim-fugitive'            "在 vim 里使用 git
Plug 'tpope/vim-rhubarb'             "Gbrowse 配合vim-fugitive
Plug 'jreybert/vimagit'              "magit
" Plug 'airblade/vim-gitgutter'      "vim 里显示文件变动

"playground
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/playground'

call plug#end()

" set scrollbind               "多文件下窗口同步移动
set shell=/usr/bin/dash      "dash的速度比bash,zsh快
set noswapfile               "关闭swap file
set termguicolors            "enable true colors support
set ignorecase               "不区分大小写
set smartcase                "搜大写时不显示小写
set hidden                   "不需保存切换文件
set number                   "显示行号
set relativenumber           "相对行
set expandtab                "Don't expand tabs to spaces
set shiftwidth=4             "tab space
set tabstop=4                "The number of spaces a tab is
set cmdheight=2              "Height of the command line
set hlsearch                 "高亮搜索
set clipboard+=unnamedplus   "直接复制剪切板
set updatetime=100           "刷新时间
set path+=**                 "find 子目录
set showcmd                  "显示命令
set mouse=a                  "开启鼠标
set list                     "开启空格字符
set listchars=tab:»·,trail:· "空格显示为·
set lazyredraw               "不要在宏和脚本执行期间更新屏幕。
set cursorline               "突出显示当前在光标下的行。
" set undofile                 "保留撤销历史。
set autochdir                "自动切换工作目录
set autoread                 "文件发生外部改变就会发出提示
set encoding=UTF-8
set ttimeoutlen=150
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
" colorscheme gruvbox
colorscheme oceanic_material

let g:mapleader = ","
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'

"highlight
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+$/

" Far
let g:far#enable_undo=1

" source
" source ~/.config/nvim/config/keysound.vim
source ~/.config/nvim/config/function.vim
source ~/.config/nvim/config/fzf-leaderf.vim
source ~/.config/nvim/config/markdown.vim
source ~/.config/nvim/config/code.vim
source ~/.config/nvim/config/barbar.vim
source ~/.config/nvim/config/move.vim
source ~/.config/nvim/config/tui.vim
source ~/.config/nvim/config/ui.vim

" map
source ~/.config/nvim/config/map.vim
source ~/.config/nvim/config/emacs-map.vim
source ~/.config/nvim/config/window-map.vim

" snippets
source  ~/.config/nvim/snippets/md.vim

" Start up
function! StartUp()
    if 0 == argc()
        :Vista
    end
endfunction

" autocmd
au VimEnter * call StartUp()

" 打开终端自动进入插入模式
au TermOpen * startinsert
" au TermClose * :q

" command
command! Ecentos :e scp://root@192.168.100.208//
command! Esuse :e scp://root@192.168.100.71//
