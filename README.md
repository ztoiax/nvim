# nvim

## why nvim

即使是最新的 vim8.2 也还在用 `select` 系统调用 ，而 nvim 已经用 `epoll` 了

![avatar](/Pictures/epoll.png)

以下统计是 nvim 和 vim 的系统调用测试：

先打开 nvim 和 vim , 然后通过 `strace` 查看它们的系统调用

```sh
sudo strace -p $(pgrep nvim) 2>&1 | tee /tmp/nvim.log
sudo strace -p $(pgrep vim) 2>&1 | tee /tmp/vim.log
```

分别在 vim 和 nvim 简单的操作后关闭，通过 `awk` 进行统计

```sh
awk -F '(' '{print $1}'  /tmp/nvim.log | sort | uniq -c | sort -n
awk -F '(' '{print $1}'  /tmp/vim.log | sort | uniq -c | sort -n
```

- 左为 nvim
- 右为 vim
  ![avatar](/Pictures/strace.png)

## 配置

- 在学 `linux` 等开源软件的过程中，了解 `vim` 的操作到安装各种高效率**插件**.花费了大量的时间,打造成现在的**配置**.

- 其中参考最多是 [Thinkvim](https://github.com/hardcoreplayers/ThinkVim)

一共有`46` 个插件
![avatar](/Pictures/init.png)

- 可以在 `vim` 打开 `htop` `glance` 等终端命令,进行监控
  ![avatar](/Pictures/floaterm.gif)

- 快速打开**最近**使用过的文件
  ![avatar](/Pictures/leaderf.gif)
  ![avatar](/Pictures/ranger.gif)

- `ag插件(类似 grep)`预览包含`linux`(我这里输入的是`linux`)的文件,选择文件后在 `vim` 里打开
  ![avatar](/Pictures/ag.gif)

使用`lazygit`,对`git`进行快速管理
![avatar](/Pictures/lazygit.gif)

---

- 以上几个插件是比较直观，使用比较多的
- 还有几十个插件,有机会我会一并整理出来

## Plugin

- [查看每个 plugin 的启动时间](https://github.com/hyiltiz/vim-plugins-profile)
  ![avatar](/Pictures/startuptime.png)

### UI 相关

#### [floaterm(浮动终端)](https://github.com/voldikss/vim-floaterm)

> 通过浮动终端打开 `htop` `glance`

![avatar](/Pictures/floaterm.gif)

### file manager(文件管理器)

#### [LeaderF](https://github.com/Yggdroot/LeaderF)

![avatar](/Pictures/leaderf.gif)

通过 floaterm (浮动终端)打开 `ranger` 文件管理器:
![avatar](/Pictures/ranger.gif)

**ohter iterm:**

- [chadtree](https://github.com/ms-jpq/chadtree)
- [coc plugin coc-explorer](https://github.com/weirongxu/coc-explorer)
- [vim-fzf](https://github.com/junegunn/fzf.vim)
- [vim-clap](https://github.com/liuchengxu/vim-clap)

### git

####

<++>

### [更强大的替换 vim-abolish](https://github.com/tpope/vim-abolish)

示例文本:

```
test
tesa
TEST
TESA

替换后

hello
hello
HELLO
HELLO
```

`vim` 自带的替换，不区分大小写，**因此要 **4** 条命令:**

```vim
:%s/TEST/HELLO/g
:%s/test/hello/g
:%s/TESA/HELLO/g
:%s/tesa/hello/g
```

而插件会自动识别大小写，**只需 1 条命令:**

```vim
:%Subvert/tes{t,a}/hello/g
```

设置快捷键为 `\`

```vim
nmap \ :%Subvert//g<Left><Left>
vmap \ :Subvert//g<Left><Left>
```

### 插入模式文本增强插件

| 命令                                                      | 操作内容                              |
| --------------------------------------------------------- | ------------------------------------- |
| [commentary.vim](https://github.com/tpope/vim-commentary) | **注释**                              |
| gcc                                                       | 注释或取消注释行                      |
| gap                                                       | 注释或取消注释段落                    |
|                                                           |                                       |
| [targets.vim](#targets)                                   | **增强 normal 模式下的 `di` 和 `da`** |
| d2i(                                                      | (b(a)b) -> ()                         |
| dI(                                                       | ( b ) -> ( )                          |

<span id="targets"></span>

#### [targets.vim](https://github.com/wellle/targets.vim#separator-text-objects) 增强 normal 模式下的 `di` 和 `da`

**示例文本:**

```vim
(b(a)b)
───┘
```

输入: `di(`

```vim
(b()b)
```

而输入: `d2i(` 会删除第二括号内的内容

```vim
()
```

**示例文本 2:**

```vim
' test '
───┘
```

输入: `di'` 不保留空格

```vim
''
```

输入: `dI'` 会保留空格

```vim
'  '
```

# reference

- [Vim 从入门到精通](https://github.com/wsdjeg/vim-galore-zh_cn)

- [AT LEAST ONE VIM TRICK YOU MIGHT NOT KNOW](https://www.hillelwayne.com/post/intermediate-vim/)

# other vim ui

- [gonvim](https://github.com/dzhou121/gonvim)

- [Spacevim](https://github.com/SpaceVim/SpaceVim)

- [oni 用 typescript 开发的 Electron 增强版 nvim](https://github.com/onivim/oni)
