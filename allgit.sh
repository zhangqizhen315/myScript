#!/bin/bash

obj=("/home/zhang/myScript" "/var/www/html/diary" "/var/www/html/note" "/var/www/html/src" "/home/zhang/vimplus")
sina=("/var/www/html/document" "/var/www/html/zhangqizhen")

cp -f /home/zhang/.zshrc /home/zhang/myScript

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
    git merge master
    sudo chown -R zhang:zhang *
    echo "======================"
done



for i in ${sina[@]}
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
    git pull origin 1:master
    git merge dev
    git push origin master:1
    git checkout dev
    git checkout master
    chown -R zhang:zhang *
    echo "======================"
done

cp -f /home/zhang/myScript/.zshrc /home/zhang/
source /home/zhang/.zshrc
