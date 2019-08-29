#!/bin/bash
# 判断当前月份的目录是否存在, 如果不存在, 就创建一个

# 设置变量
diaryDir="/home/zhang/gitpath/diary"
file="$diaryDir/index.md"

vim $file
