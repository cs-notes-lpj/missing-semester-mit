---
title: 两个程序：su、sudo；程序只做 3 件事（接收输入、计算、进行输出），而（stream 的重定向、使用管道拼接程序）由 Shell 负责
date: 2022-05-14
categories: LinuxTips
---

> On GNU/Linux or macOS

### 两个程序：su、sudo

*su is a complicated command that gets you a shell as the superUser*

```bash
man su
man sudo
```

当你本人确实是当前系统的所有者，也就是说这个电脑就是你的，那么你肯定就知道 superUser 的密码啦

那么你可以直接告诉 shell，你就是超级管理员，你需要一个拥有超级管理员权限的 shell

你可以直接执行 `su`

![image-20220514220807900](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514220807900.png)

但当你只是当前系统的一个使用成员，你不知道超级管理员的密码，因为这不是你的电脑，但是你还想使用拥有超级管理员权限的 shell，那么你需要使用提权工具 `sudo` 来执行 `su`

![image-20220514222052140](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514222052140.png)

### 程序只做 3 件事（接收输入、计算、进行输出），而（stream 的重定向、使用管道拼接程序）由 Shell 负责

举个例子：假设我想改变笔记本电脑显示屏的亮度

![image-20220522111801768](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220522111801768.png)

你可能会觉得奇怪，诶我明明加`sudo`了啊，不应该是拥有 superUser 的权限了么 ？怎么仍然权限不够 ？

其实，`sudo echo 5000 > brightness` 的意思是：

*I'm telling my shell run the program sudo with the arguments echo and 500 and send its output to the file called brightness*

运行`sudo`这个程序，并将`echo`程序作为其第一个参数，于是`echo`程序以 superUser 的权限运行

我们让 5000 作为`echo`程序的第一个参数，于是`echo`程序将该参数进行输出

输出到哪里呢 ？由于这里我们使用了`>`符号，所以 Shell 会尝试将标准输出重定向到文件 brightness

可是我们是以普通用户的身份运行的 Shell，所以 Shell 无法打开需要 superUser 权限的文件 brightness

所以会看到提示：权限不够

显然，我们可以让 Shell 以 superUser 的身份运行，如此一来，Shell 就可以打开 brightness 文件

![image-20220522113409776](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220522113409776.png)

Great ！

有没有更好的做法呢 ？要知道，以 superUser 的身份运行 Shell 是十分危险的，因为在这种 Shell 中你拥有所有权限 ！你一旦运行错误的程序就很可能破坏掉你的系统。

所以能不能不以 superUser 的身份运行 Shell 但仍然实现我们的需求呢 ？答案是肯定的

在普通用户运行的 Shell 下（这是不可改变的前提条件），直接将 echo 的输出流重定向到文件是行不通了，这意味着我们需要以 superUser 的权限打开文件 brightness

即：`sudo TOOL brightness`，这个 TOOL 应能将收到的输入，输出到文件 brightness 中

从哪里接收输入呢 ？从`echo 5000`的标准输出

如何才能将一个程序的输出流对接到下一个程序呢 ？用管道`|`告诉 Shell 将前一条命令的标准输出流对接到下一条命令的标准输入流

即：`echo 5000 | sudo TOOL brightness`

这样的 TOOL 有没有呢 ？有 ！`tee`

最终，我们就构造出了一条实现我们的需求的完美命令，如下

```bash
echo 5000 | sudo tee brightness
```

效果如下

![image-20220522115008607](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220522115008607.png)

*注意：tee 会将输出同时输出到文件和屏幕上*

（完）

