1.readelf -s test.o
查看符号表， symtab

2.readelf -S test
查看可执行文件的Section信息。
ld test.o -lc -o test
