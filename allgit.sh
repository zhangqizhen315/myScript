#!/bin/bash

obj=("/home/zhang/myScript" "/var/www/html/diary" "/var/www/html/document" "/var/www/html/note" "/var/www/html/src" "/var/www/html/zhangqizhen")

for i in ${obj[@]}
do
#    echo "现在我们要进入${i}"
#    echo "我们进来了"
#   pwd

# 进入目标文件夹;
    echo "现在开始对${i}提交 git 了"
    cd ${i}
    sudo git add .
    sudo git commit -m "`date '+%Y-%m-%d:%H:%M:S'`"
    sudo git pull origin master:master
    sudo git branch master
    sudo git merge dev
    sudo push push origin master
    sudo git branch dev
    echo "======================"
    echo "======================"
done
