
比如你写了一些 bash 脚本代码，保存在了一个 .sh 文件中

然后你给它赋予了可执行权限，并尝试执行它

如下图所示（mcd means mkdir and cd into it）

![image-20220519104812597](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220519104812597.png)

发现并没有 cd 到 foo 目录中

这时你想起了[这篇总结](https://cs-notes-lpj.github.io/mit-missing-semester-tools/#/docs/1-Shell/why-cd-is-builtin)

然后你理解了上述现象的原因（子进程只能影响它自己，而无法影响父进程）

那该怎么实现`mcd`这个功能呢 ？

> 应该把上述脚本代码封装成一个函数，然后「加载」到 shell 中 ！就搞定了 ！

![image-20220519105543636](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220519105543636.png)

不妨再看一下[这篇文章](https://cs-notes-lpj.github.io/mit-missing-semester-tools/#/docs/2-ShellTools%26BashScripting/dollar-0)以加深理解

（完）
