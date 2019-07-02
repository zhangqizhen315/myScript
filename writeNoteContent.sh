#!/bin/bash
# 这是一个将创建 wiki 内容独立出来作为一个模块的尝试

# 首先判断一下, 一个进来了几个数

if [ $# != 3 ]; then
    # 如果参数不是三个, 提示用法
    echo "请输入目录名, 文件名及分类"
else
    # 确定变量
    dir=$1
    file=$2
    class=$3
    root="/home/zhang/gitpath/note"
    # 判断一下, 内容文件是不是存在的. 不存在就先创建再打开, 存在就直接打开.
    if [ ! -f $root/$file.md ]; then
        sed -i "/* # $class/a * [$file](../$file.md)" $dir/navigation.md
        touch $root/$file.md
        echo "# $file" > $root/$file.md
    fi
    vim $root/$file.md
fi
