
> [Vim](https://www.vim.org/) is a modal editor.

![image-20220521104635288](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-picgo/image-20220521104635288.png)

*Vim's normal mode, like, Vim's interface, itself, is a programming language ! Repeat ! The interface is a programming language !*

*What does that mean ? It means that different key combinations have different effects, and, once you learn the different effects, you can actually combine them together - just like in a programming language - you can learn different functions and glue them all together to make an interesting program. In the same way, once you learned Vim's different movement and editing commands, and things like that, you can talk to Vim by programming through it's interface !*

#### vim manual

```bash
# official tutorial
vimtutor
```

```vim
:help [key || commands]

" eg
:help i 
:help :q
```

#### The model of「buffers & windows & tabs」

Vim 维护着一组缓冲区（buffer），供打开文件使用，所以 Vim 允许同时打开好几个文件

Vim 允许你开启好几个标签页（tab），每一个标签页都可以由几个窗口（window）组成

但是，缓冲区和窗口不需要一一对应，这就意味着 Vim 支持多个窗口打开同一个缓冲区（方便同一个文件的不同部分可以同时展示在显示屏上）

```vim
:q
" 这实际上是退出当前所在的 window，只有当只有 1 个 window 时，执行 :q 才会退出 Vim

:qa
" 这能够退出所有的 window，也就退出了 Vim
```

#### 4 categories

movement

edits

counts

modifiers

#### Swap Caps_Lock and Escape

> for higher efficiency.

*If you are using Xorg*

```bash
# configuration method
cd ~
wget https://raw.githubusercontent.com/Brannua/cfg-files/master/.remapkeyrc
xmodmap .remapkeyrc

# for more information ?
man xmodmap
```

*On ubuntu with gnome*

> This method not support remote connection basing ssh.

```bash
sudo apt install gnome-tweaks
gnome-tweaks
```

Keyboard & Mouse => Additional Layout Options => Caps Lock Behavior => ...

#### 关于插件管理

![20220625141249](https://aliyun-oss-lpj.oss-cn-qingdao.aliyuncs.com/images/by-clipboard/20220625141249.png)

