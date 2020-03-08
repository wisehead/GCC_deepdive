#############################################################
#   File Name: print_node.sh
#     Autohor: Hui Chen (c) 2020
#        Mail: chenhui13@baidu.com
# Create Time: 2020/03/07-21:27:56
#############################################################
 #/bin/bash
# $1 AST�ļ�����
# $2 �ڵ���
# $3 ��ӡ����ȡֵΪLR|RL|BT���ֱ��ʾ����left-to-right, right-to-left, bottom-to-top�� ����ͼ��ʡ�����ʾ��top-to-bottom
# ���磺./print_node.sh AST-FILE 5 LR ��ʾͼʾ@5�Žڵ㼰��������Ľڵ㣬ͼʾ�ķ���Ϊ������
# ��ȡAST�ļ�����
f=$1
# ��ȡ�����Ľڵ���
node=$2
# ��ȡ��ͼ����
rank=$3

#��AST�ļ���һЩ�����ֶν��д���������Ҫ�Ŀո�ȥ��
sed -i "s/op\ 1/op1/g" $f
sed -i "s/op\ 2/op2/g" $f
sed -i "s/op\ 0/op0/g" $f

#��AST�ļ�����Ԥ����Ϊ�������������һЩ����Ҫ�ġ���Ϣɾ��������ͼ���е���Ϣ
./pre.awk $f | sed 's/srcp:[a-z_.:0-9<>-]*// g' | sed 's/note:[a-z]*// g' > tmp1

#��Ԥ�������ļ�����dot�ű���ת��
./treeviz.awk tmp1 > $f.dot

rm -f tmp; touch tmp

# ����dot�ű����ײ�
echo "digraph G {" >> tmp
echo " node [shape = record]; " >> tmp

rm -rf tmp_header
# ɸѡ��node�ڵ��йصĹ�����ϵ
grep " $node " $f.dot >> tmp
grep " $node:" $f.dot >> tmp_header

# ������nodeΪ��ʼ�ڵ�Ĺ�����ϵ
tail=`grep " $node:" $f.dot | awk '{print $3}' | sed 's/; // g'`

# ��node�������ӽڵ���Ϣ���뵽tmp�ļ���
for n in $tail
do
  grep " $n " $f.dot >> tmp
  grep " $n:" $f.dot >> tmp_header
done

[ -f tmp_header ] && sort tmp_header | uniq   >> tmp

# ����dot�ű��Ľ�������
echo " }" >> tmp

# ���ݷ������������graphviz�е�dot���߻�ͼ
if [ -z $rank ]
then
  #dot -Nfontsize=10 -Tsvg tmp -o ${f}_${node}.svg
  dot -Nfontsize=10 -Tpng tmp -o ${f}_${node}.png
else
  #dot -Nfontsize=10 -Grankdir=${rank} -Tsvg tmp -o ${f}_${node}.svg
  dot -Nfontsize=10 -Grankdir=${rank} -Tpng tmp -o ${f}_${node}.png
fi
