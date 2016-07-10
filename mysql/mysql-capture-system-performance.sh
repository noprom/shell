#!/bin/sh

# 检查传递的参数
if [ $# != 2 ] ; then 
	echo "USAGE: $0 username password" 
	echo " e.g.: $0 root root" 
	exit 1; 
fi

# 用户名和密码
USERNAME=$1
PASSWORD=$2
INTERVAL=5
PREFIX=$INTERVAL-sec-status
RUNFILE=/home/benchmarks/running
RUNDIR=/home/benchmarks/
mysql -u$USERNAME -p$PASSWORD -e 'SHOW GLOBAL VARIABLES' >> mysql-variables
while test -e $RUNFILE; do
	file=$(date +%F_%I)
	sleep=$(date +%s.%N | awk "{print $INTERVAL - (\$1 % $INTERVAL)}")
	sleep $sleep
	ts="$(date +"TS %s.%N %F %T")"
	loadavg="$(uptime)"
	echo "$ts $loadavg" >> $RUNDIR$PREFIX-${file}-status
	mysql -u$USERNAME -p$PASSWORD -e 'SHOW GLOBAL STATUS' >> $RUNDIR$PREFIX-${file}-status &
	echo "$ts $loadavg" >> $RUNDIR$PREFIX-${file}-innodbstatus
	mysql -u$USERNAME -p$PASSWORD -e 'SHOW ENGINE INNODB STATUS\G' >> $RUNDIR$PREFIX-${file}-innodbstatus & 
	echo "$ts $loadavg" >> $RUNDIR$PREFIX-${file}-processlist
	mysql -u$USERNAME -p$PASSWORD -e 'SHOW FULL PROCESSLIST\G' >> $RUNDIR$PREFIX-${file}-processlist & echo $ts
done
echo Exiting because $RUNFILE does not exist.