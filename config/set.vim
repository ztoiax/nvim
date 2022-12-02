" set scrollbind               "多文件下窗口同步移动
" set shell=/usr/bin/dash      "dash的速度比bash,zsh快

set guifont=DroidSansMono\ Nerd\ Font:h20
set shell=/usr/bin/zsh
set completeopt=menu,menuone,noselect " menu菜单
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
set updatetime=150           "刷新时间
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
set nofoldenable             "关闭markdown折叠
set cmdheight=1              "搜索栏高度
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
" colorscheme kanagawa
colorscheme oceanic_material

let g:mapleader = ","
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python3'

" highlight markdown code block
let g:markdown_fenced_languages = ['bash=sh', 'sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css', 'rust', 'python', 'py=python', 'lua']

"highlight
hi ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+$/

" 去除分屏后的边框
hi WinSeparator guibg=None

"lsp
hi LspReferenceRead cterm=bold ctermbg=237 guibg=LightYellow
hi LspReferenceText cterm=bold ctermbg=237 guibg=LightYellow
hi LspReferenceWrite cterm=bold ctermbg=237 guibg=LightYellow

" cmp
hi! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
hi! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6
hi! CmpItemKindFunction guibg=NONE guifg=#C586C0
hi! CmpItemKindMethod guibg=NONE guifg=#C586C0
hi! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
hi! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
