#!/bin/bash

# 用于把 gitpath 里的所有 git 文件夹都创建 dev 分支

obj=~/gitpath/*

for i in ~/gitpath/*
do
# 进入目标文件夹;
    echo "======================"
    echo "现在开始对${i} 创建 dev 分支了"
    # 为了可能出现的权限问题, 先把属主属组给改成我的
    cd ${i}
    cd .git 
    sudo chown -R zhang:zhang *
    cd ..
    # 开始创建 dev 分支了
    git checkout -b dev
    sudo chown -R zhang:zhang *
    echo "======================"
done
