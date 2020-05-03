#############################################################
#   File Name: cmd.sh
#     Autohor: Hui Chen (c) 2020
#        Mail: chenhui13@baidu.com
# Create Time: 2020/05/03-22:16:23
#############################################################
#!/bin/sh 
gcc -g -o frame frame.c
gdb frame
b _start
r
info reg rsp
info reg rbp

b main
c
info frame
info reg rbp
info reg rsp
print *frame

