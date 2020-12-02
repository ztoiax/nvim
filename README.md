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

- 可以在 `vim` 打开 `htop` 等终端命令,进行监控
  ![avatar](/Pictures/htop.png)

- 快速打开**最近**使用过的文件
  ![avatar](/Pictures/leader.png)

- `ag插件(类似 grep)`预览包含`linux`(我这里输入的是`linux`)的文件,选择文件后在 `vim` 里打开
  ![avatar](/Pictures/ag.png)

使用`lazygit`,对`git`进行快速管理
![avatar](/Pictures/lazygit.png)

---

- 以上几个插件是比较直观，使用比较多的
- 还有几十个插件,有机会我会一并整理出来

# reference

- [AT LEAST ONE VIM TRICK YOU MIGHT NOT KNOW](https://www.hillelwayne.com/post/intermediate-vim/)
