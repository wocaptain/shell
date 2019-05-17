#!/bin/bash
#
#Description:LNMP出现502错误重启Php-fpm
#
#定义日志文件路径
log=/data/log/access.log
#设定502报错阈值为10
n=10
#精确匹配502报错次数,大于10次就重启php_fpm。每一分钟检测一次
while :
do
  tail -n 300 $log >/tmp/log
  n_502=`grep -c '502" ' /tmp/log`
  if [ $n_502 -ge $n ]
  then
     /etc/init.d/php-fpm restart 2>/dev/null
     sleep 60
  fi
#每10s检查一次
  sleep 10
done
