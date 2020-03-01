1.gcc -c -o test.o test.c

2.objdump -d test.o

3.nm test.o

4.readelf -a test.o
readelf can work only on Linux.

otool -l test.o (on Mac)