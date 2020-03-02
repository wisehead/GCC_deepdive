#1.downloads
##1.1.ftp 
ftp://ftp.mirrorservice.org/sites/sourceware.org/pub/gcc

##1.2 github
https://github.com/gcc-mirror/gcc

##1.3 wget
wget -c http://mirror1.baby1on.network/gcc/releases/gcc-4.4.0/gcc-4.4.0.tar.bz2


#2.依赖
![](res/gcc_download.png)

因为缺少gcc依赖的gmp、mpfr、mpc三个软件，所以需要下载安装他们，他们在上面的
 infrastructure 文件夹内可以找到。同时gmp与mpfr及mpc之间还有相互依赖关系，所以
 要按下面顺序安装，并在 configure后面的选项后面带上所依赖软件的路径
 
#3.安装及错误解决

```bash
//1、解压gcc
$tar -jxvf gcc-4.8.2.tar.bz2
$cd gcc-4.8.2
 
//2、解压安装gmp
$tar -jxvf gmp-4.3.2.tar.bz2
$cd gmp-4.3.2
$./configure --prefix=/usr/local/gmp-4.3.2 //gmp安装路径
$./configure --prefix=/home/chenhui/bin/gmp-4.3.2 //gmp安装路径
$make
$make check
$sudo make install
 
//3、解压安装mpfr
$tar -jxvf mpfr-2.4.2.tar.bz2
$cd mpfr-2.4.2
//congfigure后面是mpfr安装路径及依赖的gmp路径
$configure --prefix=/usr/local/mpfr-2.4.2 --with-gmp=/usr/local/gmp-4.3.2
./configure --prefix=/home/chenhui/bin/mpfr-2.4.2 --with-gmp=/home/chenhui/bin/gmp-4.3.2
$make
$make check
$sudo make install
 
//4、解压安装mpc
$tar -zxvf mpc-0.8.1.tar.gz
$cd mpc-0.8.1
//congfigure后面是mpc安装路径及依赖的gmp和mpfr路径
$configure --prefix=/usr/local/mpc-0.8.1
--with-gmp=/usr/local/gmp-4.3.2 --with-mpfr=/usr/local/mpfr-2.4.2
./configure --prefix=/home/chenhui/bin/mpc-0.8.1 --with-gmp=/home/chenhui/bin/gmp-4.3.2 --with-mpfr=/home/chenhui/bin/mpfr-2.4.2
$make
$make check
$sudo make install
 
 
若没有下面的配置，则会出现如下的mpc库错误及其他库错误等等，所以需要进行一系列配置
 
//================================出现错误======================================
gcc error while loading shared libraries: libmpc.so.2:
cannot open shared object file:No such file or directory
//===============================================================================
 
//5、配置库路径
 
#vi /etc/profile  //向/etc/profile文件末尾添加下面的语句（root权限下）：
 
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/gmp-4.3.2/lib:
/usr/local/mpfr-2.4.2/lib:/usr/local/mpc-0.8.1/lib
 
#source /etc/profile //使其立即生效
 
#echo $LD_LIBRARY_PATH //查看配置是否成功
 
/usr/local/gmp-4.3.2/lib:/usr/local/mpfr-2.4.2/lib:/usr/local/mpc-0.8.1/lib //显示这个表示成功
 
 
#vi /etc/ld.so.conf //编辑这个文件，添加下面路径
 
/usr/local/mpc-0.8.1/lib
/usr/local/gmp-4.3.2/lib
/usr/local/mpfr-2.4.2/lib
 
$sudo ldconfig
 
 
 
//6、安装gcc
$./configure --prefix=/usr/local/gcc4.8.2 --enable-threads=posix --disable-checking --disable-multilib 
--enable-languages=c,c++ --with-gmp=/usr/local/gmp-4.3.2 --with-mpfr=/usr/local/mpfr-2.4.2 --with-mpc=/usr/local/mpc-0.8.1
 ./configure --prefix=/home/chenhui/bin/gcc44 --with-gmp=/home/chenhui/bin/gmp-4.3.2 --with-mpfr=/home/chenhui/bin/mpfr-2.4.2 --with-mpc=/home/chenhui/bin/mpc-0.8.1
 
 ./configure --prefix=/home/chenhui/bin/gcc44 --enable-threads=posix --disable-checking --disable-multilib   --enable-languages=c,c++ --with-gmp=/home/chenhui/bin/gmp-4.3.2 --with-mpfr=/home/chenhui/bin/mpfr-2.4.2 --with-mpc=/home/chenhui/bin/mpc-0.8.1
 
$make
$sudo make install
 
//7、配置gcc
#vi /etc/profile  //向/etc/profile文件末尾添加下面的语句（root权限下）：
 
export PATH=$PATH:/usr/local/gcc4.8.2
 
#source /etc/profile //使其立即生效
 
#rm /usr/bin/gcc    //删除旧的软连接
#ln -s /usr/local/gcc4.8.2/bin/gcc /usr/bin/gcc  //使新版本建立软连接
 
//下面的同理
#rm /usr/bin/g++
#ln -s /usr/local/gcc4.8.2/bin/g++ /usr/bin/g++
```
 
/ssd1/chenhui3/dbpath/lib/mysql:/ssd1/chenhui3/dbpath/lib/private:/home/chenhui3/.jumbo/lib:/home/chenhui3/mysql-8018-trunk/release/library_output_directory:

/home/chenhui3/bin/gmp-4.3.2/lib:
/home/chenhui3/bin/mpfr-2.4.2/lib:
/home/chenhui3/bin/mpc-0.8.1/lib


./configure --prefix=/home/chenhui3/bin/gcc44 --enable-threads=posix --disable-checking --disable-multilib   
--enable-languages=c,c++ --with-gmp=/home/chenhui3/bin/gmp-4.3.2 --with-mpfr=/home/chenhui3/bin/mpfr-2.4.2 --with-mpc=/home/chenhui3/bin/mpc-0.8.1 



1.root安装
2.目录不对
3.版本不对
4.用其它的版本重新装一下
5.LD_LIBRARY_PATH