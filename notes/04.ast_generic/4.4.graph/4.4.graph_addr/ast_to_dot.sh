#############################################################
#   File Name: ast_to_dot.sh
#     Autohor: Hui Chen (c) 2020
#        Mail: chenhui13@baidu.com
# Create Time: 2020/03/07-21:18:14
#############################################################
#!/bin/bash
# $1 为AST文件名称
# $2 可以是字符串“all”表示图示AST中的所有节点
# $2, $3, $4, …也可以是一系列的AST节点编号，则该脚本只图示指定编号的AST节点
# 例如：
# ./ast_to_dot.sh AST_file all 表示图示所有节点及其相关关系
# ./ast_to_dot.sh AST_file 1 4 5 8 表示图示AST文件中编号为1、4、5、8等几个节点的信息及其关系

# 获取AST文件名称
f=$1

# 对AST文件中一些特殊字段进行处理，将不必要的空格去掉
sed -i "s/op\ 1/op1/g" $f
sed -i "s/op\ 2/op2/g" $f
sed -i "s/op\ 0/op0/g" $f

#  对AST文件进行预处理，为了清晰起见，可以将一些“次要的”信息删除，减少图形中的信息，用户可以 根据需要修改
./pre.awk  $f  |  sed  's/srcp:[a-z_.:0-9<>-]*//  g'  |  sed  's/note:[a-z]*//  g'  | sed 's/link:[a-z]*// g' |   sed 's/used:[0-9]*// g' | sed 's/algn:[0-9]*// g' |sed 's/prec:[0-9]*// g' |   sed 's/lngt:[0-9]*// g' | sed 's/sign:[a-z]*// g' > tmp1

# 对简化后的AST文件进行转换，生成图形脚本文件$f.dot
./treeviz.awk tmp1 > $f.dot

# 创建临时文件
rm -f tmp; touch tmp

#  如果$2表示全部转换，则直接使用上述转换后的dot脚本，否则，从上述生成的dot脚本中筛选相应的 节点，加入到tmp文件中
echo $2
if [ $2 != "all" ]
then
   echo "digraph G {" >> tmp
   echo " node [shape = record]; " >> tmp

   shift
   rm -rf tmp_header
# 筛选给定的节点
   for n in $*
   do
        grep " $n " $f.dot >> tmp
        grep " $n:" $f.dot >> tmp_header
   done

   rm -rf tmp_header_tail
   for n in $*
   do
        grep " $n; " tmp_header >> tmp_header_tail
   done
# 去除冗余的节点信息
   sort tmp_header_tail | uniq   >> tmp
   echo " }" >> tmp
# 否则图示所有节点
else
   cat $f.dot > tmp
fi

#调用graphviz中的dot工具绘图，节点字体大小为10point，输出文件格式为svg矢量图形格式，输 出文件名称为$f.svg
#dot -Nfontsize=10 -Tsvg tmp -o $f.svg
dot -Nfontsize=10 -Tpng tmp -o $f.png

