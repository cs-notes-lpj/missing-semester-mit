---
title: missing-semester-of-cs-edu-solution-1
date: 2022-05-23
caterories: missing-semester-of-cs-edu
---

> 第一节课后作业

[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html)

[man-page-online](https://man7.org/linux/man-pages/index.html)

![image-20220523190832403](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523190832403.png)

![image-20220523191127267](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523191127267.png)

![image-20220523191218794](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523191218794.png)

![image-20220523191413276](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523191413276.png)

![image-20220523191947506](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523191947506.png)

![image-20220523192054152](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523192054152.png)

![image-20220523192203934](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523192203934.png)

![image-20220523192416903](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523192416903.png)

![image-20220523192541920](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523192541920.png)

此时文件 semester 并不具备执行权限，故 `./semester` didn't work.

![image-20220523192818139](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523192818139.png)

![image-20220523193131472](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523193131472.png)

![image-20220523193615869](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523193615869.png)

![image-20220523194622346](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523194622346.png)

![image-20220523194710762](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523194710762.png)

![image-20220523202205204](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523202205204.png)

#### Dig into 56789

首先，我们可以将需要执行的代码放到一个文件中，然后尝试使用合适的 interpreter 执行其中的代码

![image-20220524075548613](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524075548613.png)

显然，我们需要让文件是可读的，因为只有这样，interpreter 才能读取到其中的代码，进而才能解析并执行

![image-20220524075745930](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524075745930.png)

再试试 Node.js ?

![image-20220524080047386](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524080047386.png)

但是我希望 to run the command `./file` rather than having to type `interpreter file`，就像执行 an executable in a Unix-like operating system 那样

如何才能实现呢 ？

经过查阅资料，我发现可以使用 [Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) 来指定 interpreter

![image-20220523213533280](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220523213533280.png)

不妨来尝试一下

![image-20220524082200965](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524082200965.png)

上图中，我新建了一个空文件，将其命名为了 foo，使用 which 工具查询了 interpreter node 的存放位置，进而使用 Shebang 在文件 foo 的首行指定了 interpreter 为 node，并继续在该文件中编写了一行可被 interpreter node 正确解释执行的代码

按照上面资料中的说明，我需要给该文件赋予可执行权限，这个 text file with a shebang 才能像 an Unix-like OS 中的 an executable 那样被使用（run）

```bash
chmod u+x foo
```

同样如上面资料中的说明，当我 run the command `./foo`，the program loader 就会按照文件 foo 中 shebang line，运行程序 /home/lpj/.nvm/versions/node/v16.14.2/bin/node，并将 `./foo` 作为被运行的 interpreter 的第一个参数，正如上面资料中所说：the program use the file as input data，显然，file foo 的可读权限也是必要的

不妨来试一下

![image-20220524084540641](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524084540641.png)

![image-20220524091503936](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524091503936.png)

如果不使用 shebang 会怎样 ？

![image-20220524092430715](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524092430715.png)

显然，the program loader 并没有将和文件 foo 中的代码对应正确的 interpreter 运行起来，也就无法正确解析代码语法，于是提示语法错误

现在，我想知道在没有使用 shebang 的时候，the program loader 到底运行的是哪个 interpreter

怎么让这个“潜藏”着的 interpreter 现身呢 ？

可以尝试撤掉文件 foo 的读权限，interpreter 无法打开文件 ./foo，这个“潜藏”着的 interpreter 就不得不“喊话求饶”现身了

![image-20220524100436665](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524100436665.png)

我去 ！没有 shebang line 说明的情况下，被运行起来的 interpreter 是 zsh ！这不就是我当前的 shell 么 ？！interpreter zsh 显然无法正确解析 Node.js 语法的代码，所以就会出现上图中的语法错误啦 ！

```bash
# 查看当前的 shell
echo $SHELL
```
不如再来验证一下 shell 代码 ？

![image-20220524092830905](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524092830905.png)

符合预期，嘿嘿

#### 一些细节

> 以下图片可点击，跳转到原文

1.

[![image-20220524101704465](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524101704465.png)](https://stackoverflow.com/questions/8967902/why-do-you-need-to-put-bin-bash-at-the-beginning-of-a-script-file)

2.

[![image-20220524102330645](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524102330645.png)](https://stackoverflow.com/questions/72343093/why-the-shell-knows-the-interpreter-specified-in-the-shebang-line-of-a-file-with)

#### shebang

https://en.wikipedia.org/wiki/Shebang_(Unix)

![image-20220524104427044](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524104427044.png)

![image-20220524104618900](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220524104618900.png)

#### shebang line 比较好的写法

其实，如果我们写的 shebang line 类似于 `#!/usr/bin/python3` 这样，其实我们是在假设 python3 这个 interpreter 的路径就是 /usr/bin/python3，但其实 python3 的路径不一定在这儿，这就导致我们这种写法的可移植性不是很好，换台电脑可能就执行不了了，怎么办呢 ？我们只能在 shebang line 中说我们需要用哪种 interpreter，但不写明该 interpreter 的路径，而借用 env 程序的帮助，帮助我们在当前系统中自动搜寻所需 interpreter 的路径，即写成类似于 `#!/usr/bin/env python3`

![image-20220528164858645](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220528164858645.png)

#### 注意

![image-20220528162232505](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220528162232505.png)

![image-20220528173004071](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220528173004071.png)

（完）

