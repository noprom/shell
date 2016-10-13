#!/bin/sh
#china
rpm -Uvh http://mirrors.yun-idc.com/epel//6/x86_64/epel-release-6-8.noarch.rpm
#us
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
rpm -Uvh http://mirror.webtatic.com/yum/el6/latest.rpm
rpm -Uvh http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm
yum -y install gcc gcc-c++ autoconf automake make
yum -y install zlib zlib-devel openssl openssl-devel pcre pcre-devel
yum -y install ack screen wget curl zip unzip ntpdate
yum -y install net-snmp net-snmp-devel net-snmp-utils vim git git-common
yum -y install nc htop iotop iftop telnet wget curl
yum -y remove mysql-server mysql httpd
yum -y install ImageMagick-*
yum -y install nginx Percona-Server-server-56 xtrabackup
yum -y install php56w php56w-fpm php56w-common php56w-cli php56w-devel php56w-intl php56w-mysqlnd php56w-pdo php56w-soap php56w-tidy php56w-xml php56w-xmlrpc php56w-zts php56w-gd php56w-mbstring php56w-mcrypt php56w-pecl-zendopcache php56w-pear php56w-posix php56w-pecl-memcached php56w-pecl-memcache php56w-pecl-memcached php56w-mysqlnd php56w-pecl-redis