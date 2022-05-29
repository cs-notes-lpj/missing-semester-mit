
![image-20220514180929310](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514180929310.png)

看，文件夹是拥有可执行权限的

嗯 ？文件夹咋会被执行 ？能被执行的不应该是可执行程序/文件吗 ？

#### `d`irectory 的 rwx 权限的含义

r：是否允许你查看这个目录中都有哪些文件（Linux 中一切皆文件）

w：是否允许你「create、remove、rename」这个目录中的文件

> eg：如果你拥有对一个文件的写权限，但没有对其所在目录的写权限，那么你就算清空了该文件的内容，你也无法删除该文件

x：是否允许你进入这个目录

*what that means is are you allowed to enter this directory, if you want to get to a file（if you want to open it or read it or write it whatever you want to do, you must have the execute permission on all parent directories of that directory and the directory itself.）*

> eg：如果你想访问 /usr/bin 下的文件，比如 /usr/bin/echo，你就必须拥有路径上所有目录的执行权限，否则你就无法访问这个文件 ！

#### 嗐，新手可别尝试改 /usr/bin 目录的可执行权限，就比如我改了，就出乱子了

```bash
[lpj@lpj-swiftsf314511 ~]$ sudo chmod a-x /usr/bin/ # 这条命令千万别执行（如果你不知道会有什么后果以及如何处理这种后果）
[sudo] lpj 的密码：
[lpj@lpj-swiftsf314511 ~]$ ls
bash: ls：未找到命令
[lpj@lpj-swiftsf314511 ~]$ mv
bash: mv：未找到命令
[lpj@lpj-swiftsf314511 ~]$ cp
bash: cp：未找到命令
```

无奈你可能只能长按电源键强制关机，但你会发现关机后再开机你甚至无法进入桌面环境 ！

#### 幸好我有一个 LiveCD of Linux，做了如下步骤救回来了

![image-20220514182951274](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220514182951274.png)

（完）
