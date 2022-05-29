
> on ubuntu_21.04

#### 现象

当你执行

```bash
man cd
```

会发现

```bash
No manual entry for cd
```

> 为什么呢 ？

#### 前置知识

```bash
$ tldr type

- Display the type of a command:
type command

- Display all locations containing the specified executable:
type -a command

- Display the name of the disk file that would be executed:
type -p command
```

> use `man` for more information.

#### 探究：cd 到底是个啥 ？

平时用的命令（command）都是二进制可执行程序，供 CLI 用户使用

比如

```bash
$ type -a cat
cat is /usr/bin/cat
cat is /bin/cat

$ type -p cat
/usr/bin/cat
```

但`cd`和那些平时用的命令一样吗 ？不妨验证一下

```bash
$ type -a cd
cd is a shell builtin

$ type -p cd
# 啥也没输出
```

> 显然：`cd`不一样，它太不一样了

#### 所以为什么`cd`是一个 shell builtin，而不是存放在 bin 目录下的二进制程序呢 ？

stack overflow 给到的答案是这样的：

如果将`cd`做成了 bin 目录下的二进制程序，那么当你执行`/bin/cd`这个子进程，由于**子进程无法改变父进程的环境变量**，所以其父进程中的环境变量`PWD`就无法被改变

但实际情况是**你当前的工作目录是被环境变量`PWD`控制着的**

> Tips：`PWD` means 「print working directory」

参考：https://stackoverflow.com/questions/41147818/no-man-page-for-the-cd-command

#### 怎么查看`cd`这种 shell builtin 的帮助手册呢 ？

同样是 stack overflow 给出的答案：

```bash
help cd
```

OR

```bash
man builtins
# then type the '/' key, then search cd
```

#### 拓展

如果你使用的 Shell 并非 [bash](https://en.wikipedia.org/wiki/Bash_(Unix_shell))，比如你执行`echo $SHELL`的输出**并非**如下所示

![image-20220514180449243](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514180449243.png)

那么你有可能会发现你执行`which echo`，竟然输出 shell builtin，而**并非**如下图所示

![image-20220514175846069](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514175846069.png)

如果你对此感到 confusing，[这里](https://unix.stackexchange.com/questions/1355/why-is-echo-a-shell-built-in-command)有一个关于此问题的讨论

（完）
