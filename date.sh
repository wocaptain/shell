#!/bin/bash
#
#Description:按指定格式生成文件并把当前磁盘情况写到这个文件中
#
#按日期格式生成一个文件
time=`date +%F`
file=$time.log
#将磁盘使用情况写到文件里
df -h > $file
