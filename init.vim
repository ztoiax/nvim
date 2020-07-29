call plug#begin('~/.config/nvim/plugins')
" Plug 'voldikss/vim-translate-me'  "翻译

Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码补全
Plug 'honza/vim-snippets'
Plug 'mhinz/vim-startify'          "启动界面
Plug 'bagrat/vim-buffet'           "标签
Plug 'taigacute/spaceline.vim'     "spacemcas状态栏
Plug 'morhetz/gruvbox'             "主题
Plug 'ryanoasis/vim-devicons'      "图标
Plug 'tpope/vim-surround'          "S("'
Plug 'tpope/vim-abolish'           "替换
Plug 'tpope/vim-repeat'            "可重复插件操作
Plug 'itchyny/vim-cursorword'      "下划线
Plug 'Yggdroot/indentLine'         "缩进线
Plug 'tpope/vim-commentary'        "注释
Plug 'junegunn/vim-easy-align'     "对齐
Plug 'skywind3000/vim-keysound'    "打字机声音
Plug 'junegunn/goyo.vim'           "沉浸阅读
Plug 'easymotion/vim-easymotion'   "跳转
Plug 'MattesGroeger/vim-bookmarks' "收藏跳转
Plug 'camspiers/animate.vim'       "窗口动画
Plug 'voldikss/vim-floaterm'       "浮动窗口
" Plug 'frazrepo/vim-rainbow'        "彩虹括号
Plug 'luochen1990/rainbow'
Plug 'puremourning/vimspector'     "debug
Plug 'haya14busa/vim-edgemotion'   "函数快速移动
Plug 'neomake/neomake'             "语法检查
Plug 'jsfaint/gen_tags.vim'        "tags
Plug 'guns/xterm-color-table.vim'
" Plug 'farmergreg/vim-lastplace'    "恢复光标位置
" Plug 'liuchengxu/vim-which-key'    "按键提示

Plug 'xolox/vim-session'           "打开时恢复分屏
Plug 'xolox/vim-misc'

"git
Plug 'junegunn/gv.vim'             "git commit 浏览器
Plug 'tpope/vim-fugitive'          "在 vim 里使用 git
Plug 'airblade/vim-gitgutter'      "vim 里显示文件变动
Plug 'simnalamburt/vim-mundo'
Plug 'lambdalisue/gina.vim'

"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "目录树
Plug 'kristijanhusak/defx-icons'

call plug#end()

"let
filetype plugin on
syntax on
colorscheme gruvbox

let g:mapleader = ","
let $nvim  = "~/.config/nvim"
let $share = "/mnt/C/Users/ztoia/Desktop/share"
let g:python3_host_prog = "/usr/bin/python3"
let g:python_host_prog  = "/usr/bin/python"

"config
source  ~/.config/nvim/defx/config.vim                 "defx
source  ~/.config/nvim/defx/defx-git.vim
source  ~/.config/nvim/coc/config.vim                 "coc
source  ~/.config/nvim/config/keysound.vim
source  ~/.config/nvim/config/vim-translate-me.vim
source  ~/.config/nvim/config/indentLine.vim
source  ~/.config/nvim/config/fzf.vim              "fzf & LeaderF
source  ~/.config/nvim/config/vim-buffet.vim

set termguicolors          "enable true colors support
set ignorecase             "不区分大小写
set smartcase              "小写包含大写
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
set listchars+=trail:·     "空格显示为·
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·

set background=dark
set laststatus=2
set showtabline=2

set makeprg=gcc\ -Wall\ -g\ %\ -o\ %

cnoremap w! w! !sudo % tee > /dev/null <CR>
cnoremap  p!  PlugInstall <CR>
noremap  S  :source % <CR>
noremap  \  :%s//g<Left><Left>
vnoremap \  :s//g<Left><Left>
nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
"remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

noremap Y y$
noremap j gj
noremap k gk
" tags
" noremap <F5> :!ctags -R .
noremap <Leader>k g<C-]>
noremap <Leader>j <C-o>

" Write buffer (save)
noremap <Leader>w :w<CR>
imap <C-S> <esc>:w<CR>
imap <C-Q> <esc>:wq<CR>

" window
" noremap <C-h> <C-w>h
" noremap <C-j> <C-w>j
" noremap <C-k> <C-w>k
" noremap <C-l> <C-w>l
noremap <Tab> :wincmd w <cr>
noremap <Leader>sm :only <cr>
noremap <Leader>s :vsplit <cr>
noremap <Leader>sk :split <cr>
noremap <Leader>sl :belowright vsplit <cr>
noremap <Leader>sj :belo split <cr>
noremap <Leader>sz :Goyo <cr>

" incert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <ESC>d$a
inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

norema  <space> `
noremap q :q <CR>


noremap  <Leader>tt  :tabe<CR>
"关闭高亮
noremap  <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>
"ag
noremap  <Leader>a  :Ag <CR>
"change theme
noremap  <Leader>fc :Colors<CR>
"目录
" nnoremap <Leader>eh :Defx -show-ignored-files -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <Leader>ee :Defx  -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
"git版本回溯
nnoremap <Leader>tm  :MundoToggle <CR>
"align
xmap     <Leader>ia <Plug>(EasyAlign)
nmap     <Leader>ia <Plug>(EasyAlign)

" vim-easymotion
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <Leader>f2 <Plug>(easymotion-overwin-f2)
nmap <Leader>L  <Plug>(easymotion-overwin-line)
nmap <Leader>F  <Plug>(easymotion-overwin-w)
"coc-git
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"coc-translate
nmap <Leader>tr <Plug>(coc-translator-e)
"coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
"bookmarks
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_save = 1
let g:bookmark_highlight_lines = 1
let g:bookmark_manage_per_buffer = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_center = 1
let g:bookmark_auto_close = 1
let g:bookmark_location_list = 1
nmap mm <Plug>BookmarkToggle
nmap ma <Plug>BookmarkAnnotate
nmap ml <Plug>BookmarkShowAll
nmap mj <Plug>BookmarkNext
nmap mk <Plug>BookmarkPrev
nmap mc <Plug>BookmarkClear
nmap mC <Plug>BookmarkClearAll
nmap mu <Plug>BookmarkMoveUp
nmap me <Plug>BookmarkMoveDown
"animate
nnoremap <silent> <Up>    :call animate#window_delta_height(10)<CR>
nnoremap <silent> <Down>  :call animate#window_delta_height(-10)<CR>
nnoremap <silent> <Left>  :call animate#window_delta_width(10)<CR>
nnoremap <silent> <Right> :call animate#window_delta_width(-10)<CR>
"session
let g:session_autosave = 'no'
"rainbow
let g:rainbow_active = 1
"floaterm
hi FloatermNF guibg=#282828
hi FloatermBorderNF guibg=#282828 guifg=#504945
command! Ranger FloatermNew ranger
command! Lazygit FloatermNew lazygit
let g:floaterm_type = 'norrmal'
" let g:floaterm_position = 'center'
autocmd FileType floaterm wincmd H
map <Leader>fr :Ranger<CR>
map <Leader>tg :Lazygit<CR>

"edgemotion
map <space>j <Plug>(edgemotion-j)
map <space>k <Plug>(edgemotion-k)

"function
function! OpenAnimatedHtop() abort
  " Open a htop in terminal
  new term://htop
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.66)
endfunction
command! Htop call OpenAnimatedHtop()

function! OpenAnimatedGtop() abort
  " Open a gtop in terminal
  new term://gtop
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.86)
endfunction
command! Gtop call OpenAnimatedGtop()

map <Leader>th :Htop<CR>
map <Leader>tg :Gtop<CR>

"neomake
let g:neomake_open_list = 2
" call neomake#configure#automake('rw', 1000)
call neomake#configure#automake('w')

"highlight
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+$/

"tags
let g:gen_tags#gtags_default_map = 1
