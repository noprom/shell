#install zabbix_agent
#2016.12.5 power by kerwin
#######初始化zabbix_agent
HOSTNAME=$(hostname)
mkdir /opt/soft
cd /opt/soft/
yum remove zabbix -y
wget http://zabbix.nutsapi.com:8082/download/zabbix-agent-3.2.1-1.el6.x86_64.rpm
rpm -ivh zabbix-agent-3.2.1-1.el6.x86_64.rpm
wget http://zabbix.nutsapi.com:8082/download/pip-1.5.4.tar.gz
wget http://zabbix.nutsapi.com:8082/download/setuptools-2.0.tar.gz
cd /etc/zabbix
rm -f zabbix_agentd.conf
wget http://zabbix.nutsapi.com:8082/download/zabbix_agentd.conf
sed -i s#SERVERID#$HOSTNAME#g zabbix_agentd.conf
mkdir alertscripts
/etc/init.d/zabbix-agent restart
########安装python pip
cd /opt/soft
tar xf setuptools-2.0.tar.gz
cd setuptools-2.0
python setup.py build
python setup.py install
cd ..
tar xf pip-1.5.4.tar.gz
cd pip-1.5.4
python setup.py install
######添加elasticsearch监控插件
 pip install elasticsearch
 cd /etc/zabbix/alertscripts/
 wget http://zabbix.nutsapi.com:8082/download/es_status.py
 chmod +x es_status.py
 cd /etc/zabbix/zabbix_agentd.d
 wget http://zabbix.nutsapi.com:8082/download/es_status.conf
 /etc/init.d/zabbix-agent restart
#########安装文件监控插件
cd /etc/zabbix/alertscripts/
wget http://zabbix.nutsapi.com:8082/download/md5sum
wget http://zabbix.nutsapi.com:8082/download/check_pubkey.sh
wget http://zabbix.nutsapi.com:8082/download/check_iptables.sh
chmod 777 check_pubkey.sh
chmod 777 check_iptables.sh
chmod 777 md5sum
chmod u+s md5sum
cd /etc/zabbix/zabbix_agentd.d
wget http://zabbix.nutsapi.com:8082/download/checkfile.conf
/etc/init.d/zabbix-agent restart
##########安装防火墙监控插件
cd /etc/zabbix/alertscripts
wget http://zabbix.nutsapi.com:8082/download/iptables
chmod 777 iptables
chmod u+s iptables
cd /etc/zabbix/zabbix_agentd.d
wget http://zabbix.nutsapi.com:8082/download/iptables_status.conf
/etc/init.d/zabbix-agent restart
##########安装redis监控插件
# cd /etc/zabbix/alertscripts
# wget http://zabbix.nutsapi.com:8082/download/redis_stat.sh
# chmod 777 redis_stat.sh
# cd /etc/zabbix/zabbix_agentd.d
# wget http://zabbix.nutsapi.com:8082/download/zabbix_agentd_redis.conf
# /etc/init.d/zabbix-agent restart
##########安装nginx监控插件
#cd /etc/nginx/conf.d
#wget http://zabbix.nutsapi.com:8082/download/nginx_status_http.conf
#cd /etc/zabbix/alertscripts
#wget http://zabbix.nutsapi.com:8082/download/nginx_status.sh
#chmod 777 nginx_status.sh
#cd /etc/zabbix/zabbix_agentd.d
#wget http://zabbix.nutsapi.com:8082/download/zabbix_nginx.conf
#/etc/init.d/nginx reload
#/etc/init.d/zabbix-agent restart
############安装PHP-FPM插件
# cd /etc/nginx/conf/conf.d
# rm -f nginx_status_http.conf
# wget http://zabbix.nutsapi.com:8082/download/nginx_status_http.conf
# sed -i s#';pm.status_path = /status'#'pm.status_path = /status'#g /etc/php-fpm.d/www.conf
# cd /etc/zabbix/zabbix_agentd.d
# wget http://zabbix.nutsapi.com:8082/download/php_agent.conf
# /etc/init.d/nginx restart
# /etc/init.d/php-fpm restart
# /etc/init.d/zabbix-agent restart
###########安装mysql监控插件
# mkdir /var/lib/zabbix/percona/scripts/ -p
# cd /var/lib/zabbix/percona/scripts/
# wget http://zabbix.nutsapi.com:8082/download/get_mysql_stats_wrapper.sh
# wget http://zabbix.nutsapi.com:8082/download/ss_get_mysql_stats.php
# chmod 777 *
# cd /etc/zabbix/alertscripts
# wget http://zabbix.nutsapi.com:8082/download/mysql_slave_status.sh
# chmod 777 mysql_slave_status.sh
# cd /etc/zabbix/zabbix_agentd.d/
# wget http://zabbix.nutsapi.com:8082/download/userparameter_percona_mysql.conf
# /etc/init.d/zabbix-agent restart




/etc/init.d/zabbix-agent restart
