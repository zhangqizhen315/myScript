#!/bin/bash

obj=("/home/zhang/myScript" "/var/www/html/diary" "/var/www/html/note" "/var/www/html/src")
sina=("/var/www/html/document" "/var/www/html/zhangqizhen")

for i in ${obj[@]}
do
# 进入目标文件夹;
    echo "======================"
    echo "现在开始对${i}提交 git 了"
    cd ${i}
    git add .
    git commit -m "`date '+%Y-%m-%d:%H:%M:S'`"
    git checkout master
    git pull origin master:master
    git merge dev
    git push
    git checkout dev
    sudo chown -R zhang:zhang *
    echo "======================"
done



for i in ${sina[@]}
do
# 进入目标文件夹;
    echo "======================"
    echo "现在开始对${i}提交 git 了"
    cd ${i}
    sudo git add .
    sudo git commit -m "`date '+%Y-%m-%d:%H:%M:S'`"
    sudo git checkout master
    sudo git pull origin master:master
    sudo git merge dev
    sudo git push origin master:1
    sudo git checkout dev
    sudo chown -R zhang:zhang *
    echo "======================"
done
