#!/bin/bash

cd ~/myScript
git add .
git commit -m "${1}"
git push
echo "myScript 已经 git 了"

cd ~/vimplus
git add .
git commit -m "${1}"
git push 
echo "vimplus 已经 git 了"

cd ~/zhangqizhen315.github.io/
git add .
git commit -m "${1}"
git push
echo "博客已经 git 了 "

cd ~/.task
git add .
git commit - "${1}"
git push 
echo ".task 已经 git 了"

cd /var/www/html/note 
git add .
git commit -m "${1}"
git push 
echo "note 已经 git 了"

cd  /var/www/html/diary
git add .
git commit -m "${1}"
git push
echo "diary 已经 git 了"

