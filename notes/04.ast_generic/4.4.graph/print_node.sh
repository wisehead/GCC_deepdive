#############################################################
#   File Name: print_node.sh
#     Autohor: Hui Chen (c) 2020
#        Mail: chenhui13@baidu.com
# Create Time: 2020/03/07-21:27:56
#############################################################
 #/bin/bash
# $1 AST文件名称
# $2 节点编号
# $3 打印方向，取值为LR|RL|BT，分别表示按从left-to-right, right-to-left, bottom-to-top的 方向画图，省略则表示从top-to-bottom
# 例如：./print_node.sh AST-FILE 5 LR 表示图示@5号节点及其相关联的节点，图示的方向为从左到右
# 获取AST文件名称
f=$1
# 获取给定的节点编号
node=$2
# 获取绘图方向
rank=$3

#对AST文件中一些特殊字段进行处理，将不必要的空格去掉
sed -i "s/op\ 1/op1/g" $f
sed -i "s/op\ 2/op2/g" $f
sed -i "s/op\ 0/op0/g" $f

#对AST文件进行预处理，为了清晰起见，将一些“次要的”信息删除，减少图形中的信息
./pre.awk $f | sed 's/srcp:[a-z_.:0-9<>-]*// g' | sed 's/note:[a-z]*// g' > tmp1

#将预处理后的文件进行dot脚本的转换
./treeviz.awk tmp1 > $f.dot

rm -f tmp; touch tmp

# 生成dot脚本的首部
echo "digraph G {" >> tmp
echo " node [shape = record]; " >> tmp

rm -rf tmp_header
# 筛选与node节点有关的关联关系
grep " $node " $f.dot >> tmp
grep " $node:" $f.dot >> tmp_header

# 查找以node为起始节点的关联关系
tail=`grep " $node:" $f.dot | awk '{print $3}' | sed 's/; // g'`

# 将node关联的子节点信息加入到tmp文件中
for n in $tail
do
  grep " $n " $f.dot >> tmp
  grep " $n:" $f.dot >> tmp_header
done

[ -f tmp_header ] && sort tmp_header | uniq   >> tmp

# 生成dot脚本的结束部分
echo " }" >> tmp

# 根据方向参数，调用graphviz中的dot工具绘图
if [ -z $rank ]
then
  #dot -Nfontsize=10 -Tsvg tmp -o ${f}_${node}.svg
  dot -Nfontsize=10 -Tpng tmp -o ${f}_${node}.png
else
  #dot -Nfontsize=10 -Grankdir=${rank} -Tsvg tmp -o ${f}_${node}.svg
  dot -Nfontsize=10 -Grankdir=${rank} -Tpng tmp -o ${f}_${node}.png
fi
