#!/bin/bash
#监控80端口是否开启
#
#判断80端口是否存在
if netstat -lntp|grep -q ':80 '
then
    exit
fi
#不存在就启动下80服务
/usr/local/apache2/bin/apachectl restart >/dev/null 2>/dev/null
#判断重启80服务是否成功，检测有多少个httpd进程
n=`pgrep -l httpd|wc -l`
if [ $n -eq 0 ]
then
    /usr/local/apache2/bin/apachectl start 2>/tmp/apache2_start.err
fi
