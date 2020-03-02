#############################################################
#   File Name: ast2dot.sh
#     Autohor: Hui Chen (c) 2020
#        Mail: chenhui13@baidu.com
# Create Time: 2020/03/02-22:52:11
#############################################################
#!/bin/sh 
./pre.awk test.c.* | ./treeviz.awk > tree.dot
