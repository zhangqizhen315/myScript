#!/bin/bash

obj=("/home/zhang/myScript" "/var/www/html/diary" "/var/www/html/note" "/var/www/html/src" "/var/www/html/learnhtml" "/var/www/html/document" "/var/www/html/zhangqizhen" "/var/www/html/old")

for i in ${obj[@]}
do
# 进入目标文件夹;
    echo "======================"
    echo "现在开始对${i}提交 git 了"
    cd ${i}
    cd .git 
    sudo chown -R zhang:zhang *
    cd ..
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
