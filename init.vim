source ~/.config/nvim/config/plug.vim
call plug#begin('~/.config/nvim/plugins')

""""" ui """""
" Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
" Plug 'glepnir/dashboard-nvim'
Plug 'wellle/context.vim'            "移动时显示函数上下文
Plug 'kyazdani42/nvim-web-devicons'  "标签图标
Plug 'romgrk/barbar.nvim'            "标签
Plug 'mhinz/vim-startify'            "启动界面
Plug 'vim-airline/vim-airline'
" Plug 'hardcoreplayers/spaceline.vim' "spacemcas状态栏
Plug 'liuchengxu/vista.vim'          "侧边栏
Plug 'morhetz/gruvbox'               "主题
Plug 'rafi/awesome-vim-colorschemes' "awesome主题
Plug 'ryanoasis/vim-devicons'        "图标
Plug 'junegunn/goyo.vim'             "沉浸阅读
Plug 'luochen1990/rainbow'           "彩虹括号
Plug 'simnalamburt/vim-mundo'        "undo tree
" Plug 'bagrat/vim-buffet'             "标签
Plug 'liuchengxu/vim-which-key'      "按键提示
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

"git
Plug 'junegunn/gv.vim'               "git commit 浏览器
Plug 'tpope/vim-fugitive'            "在 vim 里使用 git
Plug 'tpope/vim-rhubarb'             "Gbrowse 配合vim-fugitive
Plug 'jreybert/vimagit'              "magit
" Plug 'airblade/vim-gitgutter'      "vim 里显示文件变动

call plug#end()

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
" transparent
" highlight Normal     ctermbg=NONE guibg=NONE
" highlight LineNr     ctermbg=NONE guibg=NONE
" highlight SignColumn ctermbg=NONE guibg=NONE

" spaceline
let g:spaceline_seperate_style= 'slant-cons'
let g:spaceline_colorscheme = 'space'

"bookmarks
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_auto_save = 1
" let g:bookmark_highlight_lines = 1
" let g:bookmark_manage_per_buffer = 1
" let g:bookmark_save_per_working_dir = 1
" let g:bookmark_center = 1
" let g:bookmark_auto_close = 1
" let g:bookmark_location_list = 1
" let g:bookmark_no_default_key_mappings = 1

"session
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
"rainbow
let g:rainbow_active = 1
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

"floaterm
hi FloatermNF guibg=#282828
hi FloatermBorderNF guibg=#282828 guifg=#504945
command! Ranger FloatermNew ranger
command! Broot FloatermNew broot -sdpw
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

"vista
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

" vim-fcitx
let g:input_toggle = 1
function! Fcitx2en()
   let s:input_status = system("fcitx5-remote")
   if s:input_status == 2
      let g:input_toggle = 1
      let l:a = system("fcitx5-remote -c")
   endif
endfunction

function! Fcitx2zh()
   let s:input_status = system("fcitx5-remote")
   " if s:input_status != 2 && g:input_toggle == 1
   if s:input_status == 2
      " let l:a = system("fcitx5-remote -o")
      let l:a = system("fcitx5-remote -c")
      let g:input_toggle = 0
   endif
endfunction

set ttimeoutlen=150
"退出插入模式
autocmd InsertLeave * call Fcitx2en()
"进入插入模式
autocmd InsertEnter * call Fcitx2zh()

" ===
" === vimspector
" ===
" let g:vimspector_enable_mappings = 'HUMAN'
" function! s:read_template_into_buffer(template)
"     " has to be a function to avoid the extra space fzf#run insers otherwise
"     execute '0r ~/.config/nvim/vimspector_json/'.a:template
" endfunction
" command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
"             \   'source': 'ls -1 ~/.config/nvim/vimspector_json',
"             \   'down': 20,
"             \   'sink': function('<sid>read_template_into_buffer')
"             \ })
" noremap <leader>vs :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" sign define vimspectorBP text=🛑 texthl=Normal
" sign define vimspectorBPDisabled text=🚫 texthl=Normal
" sign define vimspectorPC text=👉 texthl=SpellBad

" markdown tab
let g:table_mode_tableize_map = '<leader>it'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" clever-f
" Ignore case (忽略大小写)
let g:clever_f_ignore_case = 1
let g:clever_f_chars_match_any_signs = ';'

" translator
" let g:translator_history_enable = 1
 let g:translator_default_engines = get(g:, 'translator_default_engines', ['youdao'])
" let g:translator_proxy_url = 'http://127.0.0.1:80'
let g:translator_window_type = 'preview'

" source
source ~/.config/nvim/config/function.vim
" source ~/.config/nvim/config/vim-buffet.vim
source ~/.config/nvim/config/fzf-leaderf.vim         "fzf & LeaderF
source ~/.config/nvim/config/markdown-preview.vim
" source ~/.config/nvim/config/keysound.vim
source ~/.config/nvim/config/coc.vim                 "coc
source ~/.config/nvim/config/map.vim                 "map
source ~/.config/nvim/config/barbar.vim
" snippets
source  ~/.config/nvim/snippets/md.vim

"Start up
" function! StartUp()
"     if 0 == argc()
"         Vista
"     end
" endfunction

" autocmd VimEnter * call StartUp()
"
