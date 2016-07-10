#!/bin/sh

INTERVAL=5
PREFIX=$INTERVAL-sec-status
RUNFILE=/home/benchmarks/running
mysql -uroot -p1q2w3e4r5t -e 'SHOW GLOBAL VARIABLES' >> mysql-variables
while test -e $RUNFILE; do
	file=$(date +%F_%I)
	sleep=$(date +%s.%N | awk "{print $INTERVAL - (\$1 % $INTERVAL)}") sleep $sleep
	ts="$(date +"TS %s.%N %F %T")"
	loadavg="$(uptime)"
	echo "$ts $loadavg" >> $PREFIX-${file}-status
	mysql -e 'SHOW GLOBAL STATUS' >> $PREFIX-${file}-status &
	echo "$ts $loadavg" >> $PREFIX-${file}-innodbstatus
	mysql -e 'SHOW ENGINE INNODB STATUS\G' >> $PREFIX-${file}-innodbstatus & 
	echo "$ts $loadavg" >> $PREFIX-${file}-processlist
	mysql -e 'SHOW FULL PROCESSLIST\G' >> $PREFIX-${file}-processlist & echo $ts
done
echo Exiting because $RUNFILE does not exist.