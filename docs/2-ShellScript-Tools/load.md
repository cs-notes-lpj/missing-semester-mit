我们当然可以直接在 shell-prompt 中，交互式地进行 bashScripting，可以利用 pipe 将一些命令串起来，做一些有意思的事

但有时，我们可能会希望顺序地执行一大段代码，ok，那么我们可能会编写一个函数

当然，函数也是可以被直接敲在 shell-prompt 中执行的

但是往往更好的做法是放到一个文件中，就像下图这样

![image-20220531185717082](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220531185717082.png)

然后，我们就可以使用 `source` 命令，将 mcd.sh 中的代码加载到我们当前的 shell 会话

然后你就可以使用 `mcd` 这个命令了（因为这时函数 mcd 已经被定义在当前的 shell 会话中了）

![image-20220531190108099](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220531190108099.png)

