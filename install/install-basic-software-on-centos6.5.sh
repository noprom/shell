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
yum -y install nginx Percona-Server-server-55 xtrabackup
yum -y install php70w php70w-opcache php70w-fpm php70w-common php70w-cli php70w-devel php70w-intl php70w-mysqlnd php70w-pdo php70w-soap php70w-tidy php70w-xml php70w-xmlrpc php70w-zts php70w-gd php70w-mbstring php70w-mcrypt php70w-pecl-zendopcache php70w-pear php70w-posix php70w-pecl-memcached php70w-pecl-memcache php70w-pecl-memcached php70w-mysqlnd php70w-pecl-redis