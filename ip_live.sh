#!/bin/bash
#
#Description:通过IP监控主机存活状态
#
ip=192.168.1.5
time=`date "+%F %T"`
while :
do
   n=`ping -c100 $ip|grep -i 'received, '|awk -F'received, |%' '{print $2}'`
   if [ -z $n ]
   then
      echo "脚本错误"
      exit
   fi
   if [ $n -ge 20 ]
   then
#     [ -f ./iplive.log ]&&touch ./iplive.log
      echo "$time 该主机有问题" >>./iplive.log
   else
      echo "该主机正常"
   fi
#   sleep 3600 
done
