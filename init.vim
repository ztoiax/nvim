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
" Plug 'skywind3000/vim-keysound'    "打字机声音
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
" Plug 'neoclide/coc.nvim', { 'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc.nvim', {'branch': 'release'} "代码补全

" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' } "目录树
" Plug 'kristijanhusak/defx-icons'

call plug#end()

"let
filetype plugin on
syntax on
colorscheme gruvbox

let g:mapleader = ","
let g:python3_host_prog = "/usr/bin/python3"
let g:python_host_prog  = "/usr/bin/python"

let g:spaceline_seperate_style= 'slant-cons'
let g:spaceline_colorscheme = 'space'
"config
" source  ~/.config/nvim/defx/config.vim                 "defx
source  ~/.config/nvim/config/keysound.vim
" source  ~/.config/nvim/config/vim-translate-me.vim
source  ~/.config/nvim/config/indentLine.vim
source  ~/.config/nvim/config/fzf.vim              "fzf & LeaderF
source  ~/.config/nvim/config/vim-buffet.vim
source  ~/.config/nvim/config/markdown-preview.vim
source  ~/.config/nvim/config/coc.vim                 "coc

"snippets
source  ~/.config/nvim/snippets/md.vim

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

imap <Leader><Leader> <Esc>/<++><CR>:nohlsearch<CR>c4i
" Run the current line
nnoremap <leader>e :exe getline(line('.'))<cr>

if has("nvim")
  command! W w! !sudo -n tee % > /dev/null || echo "Press <leader>w to authenticate and try again"
else
  command! W w! !sudo tee % > /dev/null
end

cnoremap  p!  PlugInstall <CR>
noremap  S  :source % <CR>
noremap  \  :%s//g<Left><Left>
vnoremap \  :s//g<Left><Left>
nmap t<Enter> :bo sp term://zsh\|resize 10<CR>i
"remove unwanted space
nnoremap <silent> <F7> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

noremap Y y$
noremap E v$
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" tags
" noremap <F5> :!ctags -R .
noremap <Leader>k <C-i>
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
noremap <Leader>sh :vsplit <cr>
noremap <Leader>sk :split <cr>
noremap <Leader>sl :belowright vsplit <cr>
noremap <Leader>sj :belo split <cr>
noremap <Leader>sq <C-w>c
noremap <Leader>sz :Goyo <cr>

" incert keymap like emacs
inoremap <C-w> <C-[>diwa
inoremap <C-h> <BS>
inoremap <C-d> <Del>
" inoremap <C-k> <ESC>d$a inoremap <C-u> <C-G>u<C-U>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-z> <ESC>ua

inoremap <expr><C-e> pumvisible() ? "\<C-e>" : "\<End>"

noremap  <space> `
noremap Q q
noremap q :q <CR>

nnoremap <silent> <Leader>tt :Bw<CR>
"关闭高亮
noremap  <Leader>u  :<C-U><C-R>=printf("nohlsearch %s", "")<CR><CR>
"ag
noremap  <Leader>a  :Ag <CR>
"change theme
noremap  <Leader>fc :Colors<CR>
"目录
" nnoremap <Leader>eh :Defx -show-ignored-files -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
" nnoremap <Leader>ee :Defx  -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
nnoremap <Leader>e :CocCommand explorer<CR>

"git浏览器
nnoremap <Leader>tv  :GV <CR>
"undo tree
nnoremap <Leader>tm  :MundoToggle <CR>
"align
xmap     <Leader>ia <Plug>(EasyAlign)
nmap     <Leader>ia <Plug>(EasyAlign)

" vim-easymotion
nmap <Leader>f1 <Plug>(easymotion-overwin-f)
nmap <Leader>f2 <Plug>(easymotion-overwin-f2)
nmap <Leader>0  <Plug>(easymotion-overwin-line)
nmap <Leader>fw  <Plug>(easymotion-overwin-w)
"coc-git
set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
"coc-translate
" nmap <Leader>tr <Plug>(coc-translator-e)
"coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

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
command! Ipython3 FloatermNew ipython3
let g:floaterm_height = 0.9
let g:floaterm_width = 0.7
" let g:floaterm_wintype = 'normal'
" autocmd FileType floaterm wincmd H
let g:floaterm_position = 'center'
map <Leader>fr :Ranger<CR>
map <Leader>tg :Lazygit<CR>
map <Leader>tp :Ipython3<CR>
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


function! OpenAnimatedbashtop() abort
  " Open a bashtop in terminal
  new term://bashtop
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.86)
endfunction
command! Bashtop call OpenAnimatedbashtop()

function! OpenAnimatedglances() abort
  " Open a glances in terminal
  new term://glances
  " Send window to bottom and start with small height
  wincmd J | resize 1
  " Animate height to 66%
  call animate#window_percent_height(0.86)
endfunction
command! Glances call OpenAnimatedglances()

map <Leader>th :Htop<CR>
map <Leader>tb :Bashtop<CR>

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

"highlight
highlight ExtraWhitespace ctermbg=lightblue guibg=lightblue
match ExtraWhitespace /\s\+$/

"tags
let g:gen_tags#gtags_default_map = 1

"vim-which-key
nnoremap <silent> <leader> :WhichKey ','<CR>
set timeoutlen=800

"coc
nmap <Leader>cc :CocCommand 
"coc-spell-checker
vmap <leader>cs <Plug>(coc-codeaction-selected)
nmap <leader>cs <Plug>(coc-codeaction-selected)

"coc-translator
" popup
nmap <Leader>tr <Plug>(coc-translator-p)
vmap <Leader>tr <Plug>(coc-translator-pv)
" echo
nmap <Leader>er <Plug>(coc-translator-e)
vmap <Leader>er <Plug>(coc-translator-ev)
" replace
nmap <Leader>rr <Plug>(coc-translator-r)
vmap <Leader>rr <Plug>(coc-translator-rv)
