#!/bin/bash
#
#Description:备份数据库，本地保存1周，远程保存1一个月，每天凌晨3点执行。已知数据库账户密码
#
#定义PATH,因为mysqldump命令不在默认的PATH里
PATH=`echo $PATH`
#定义账户信息变量
zh='root'
pass='demaxmedical'
#定义日期变量
#定义周变量，周的范围是0-6
d1=`date +%w`
#定义日变量，日的范围是1-31
d2=`date +%d`
#备份目录
lobakdir=/bak/mysql
rebakdir=192.168.1.40:/root/bak
#接下来的命令涉及的正确错误输出都记录到日志里
exec 1 >/root/bak.log 2>/root/bak.log
echo "备份开始`date +%F %T`"
#备份开始
mysqldump -u$zh -p$pass --default-cahracter-set=gbk discuz > $lobakdir/$d1.sql
#远程备份
rsync -az $lobakdir/$d1.sql $rebakdir/$d2.sql
