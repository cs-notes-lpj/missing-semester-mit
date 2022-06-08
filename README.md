
# The Missing Semester of Your CS Education

> 本站记录我自己的「听课笔记、作业实践、思考总结」

[official_link](https://missing.csail.mit.edu/)

http://mywiki.wooledge.org/BashFAQ

Functions have to be in the same language as the shell, while scripts can be written in any language

Remember, one of the best properties of the shell is that you are just calling programs

As you have seen so far commands will take input from both arguments and STDIN.

but some commands like tar take inputs from arguments. To bridge this disconnect there’s the xargs command which will execute a command using STDIN as arguments. For example ls | xargs rm will delete the files in the current directory.

