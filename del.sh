#!/bin/bash
#Description:删除前5行中包含字母的行和6-10行的字母删掉
file=/usr/local/sbin/shell/passwd
sed -n '1,5'p $file |sed '/[a-zA-Z]/d'
sed -n '6,10'p $file |sed 's/[a-zA-Z]//g'
sed -n '11,$'p $file
