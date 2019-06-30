#!/bin/bash
# 切换桌面背景图片

# 思路非常简单, 先把桌面图片文件夹清空, 再根据传入的参数, 把相应文件夹的图片给复制进去

# 先把变量设了

dir='/mnt/c/Users/w3885/Pictures/luck/'

# 判断入参
if [ $# != 1 ]; then
    # 如果参数不等于 1, 就提示一下, 需要一个参数
    echo "请输入一个参数"
else
    case $1 in 
        work)
            rm -rf $dir/ok/* 
            cp $dir/work/* $dir/ok/
            ;;
        sw)
            rm -rf $dir/ok/*
            cp $dir/sw/* $dir/ok/
            ;;
        space)
            rm -rf ${dir}/ok/*
            cp ${dir}/space/* ${dir}/ok/
            ;;
        *)
            echo "目前还没有定义其他的主题"
            ;;
    esac
fi
