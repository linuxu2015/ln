#############################安装必要的包######################
yum install  vim gcc gcc-c++ openssl openssl-devel db4-devel ntpdate mysql mysql-devel mysql-server bzip2 php-mysql cyrus-sasl-md5 perl-GD perl-DBD-MySQL perl-GD perl-CPAN perl-CGI perl-CGI-Session cyrus-sasl-lib cyrus-sasl-plain cyrus-sasl cyrus-sasl-devel libtool-ltdl-devel telnet mail libicu-devel  -y vim wget screen  libc-client libc-client-devel libxml2 libxml2-devel bzip2 bzip2-devel pcre* openssl* gcc gcc-c++ gcc make gd-devel libjpeg-devel libpng-devel libxml2-devel bzip2-devel libcurl-devel cmake ncurses-devel perl-Data-Dumper
#############################安装nginx################################
wget http://nginx.org/download/nginx-1.8.0.tar.gz
tar xf nginx-1.8.0.tar.gz
cd nginx-1.8.0
./configure --prefix=/usr/local/nginx \
--with-http_ssl_module --with-http_spdy_module \
--with-http_stub_status_module --with-pcre
make && make install
echo "export PATH=/usr/local/nginx/sbin:$PATH" > /etc/profile.d/nginx.sh
source /etc/profile.d/nginx.sh
############################安装mcrypt前提#######################
wget http://7xj1qf.com1.z0.glb.clouddn.com/libmcrypt-2.5.8.tar.gz
wget http://7xj1qf.com1.z0.glb.clouddn.com/mcrypt-2.6.8.tar.gz
wget http://7xj1qf.com1.z0.glb.clouddn.com/mhash-0.9.9.tar.gz
tar xf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8
./configure
make && make install
cd ..
tar xf mhash-0.9.9.tar.gz
cd mhash-0.9.9
./configure
make && make install
cd ..
export LD_LIBRARY_PATH=/usr/local/lib: LD_LIBRARY_PATH
tar xf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8
./configure
make && make install
cd ..
########################安装php######################
wget http://cn2.php.net/distributions/php-5.6.8.tar.gz
tar xf php-5.6.8.tar.gz
cd php-5.6.8
./configure  --prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc --with-bz2 --with-curl \
--enable-ftp --enable-sockets --disable-ipv6 --with-gd \
--with-jpeg-dir=/usr/local --with-png-dir=/usr/local \
--with-freetype-dir=/usr/local --enable-gd-native-ttf \
--with-iconv-dir=/usr/local --enable-mbstring --enable-calendar \
--with-gettext --with-libxml-dir=/usr/local --with-zlib \
--with-pdo-mysql=mysqlnd --with-mysqli=mysqlnd --with-mysql=mysqlnd \
--enable-dom --enable-xml --enable-fpm --with-libdir=lib64 --enable-bcmath --with-imap=/usr  --with-imap-ssl=/usr --with-kerberos=/usr --with-openssl 
make && make install
cp php.ini-production /usr/local/php/etc/php.ini
cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
echo "export PATH=/usr/local/php/sbin:$PATH" > /etc/profile.d/php-fpm.sh
echo "export PATH=/usr/local/php/bin:$PATH" > /etc/profile.d/php.sh
. /etc/profile.d/php-fpm.sh
. /etc/profile.d/php.sh
cd ..
##########################安装数据库###################################
wget http://7xj1qf.com1.z0.glb.clouddn.com/mysql-5.6.23-linux-glibc2.5-x86_64.tar.gz
tar xf mysql-5.6.23-linux-glibc2.5-x86_64.tar.gz
cd mysql-5.6.23-linux-glibc2.5-x86_64
cmake .
make && make install
groupadd mysql
useradd -r -g mysql mysql 
cd /usr/local/mysql 
chown -R mysql.mysql .
scripts/mysql_install_db --user=mysql --datadir=/usr/local/mysql/data --basedir=/usr/local/mysql/
chown -R root .
chown -R mysql data/
