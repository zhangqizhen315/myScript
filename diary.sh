#!/bin/bash
# 判断当前月份的目录是否存在, 如果不存在, 就创建一个

# 设置变量
m=$(date +"%Y-%m")
d=$(date +"%d")
diaryDir="/var/www/html/diary"
dir="$diaryDir/$m"
file="$dir/$d.md"
fileUrl="* [$d]($m/$d.md)"

if [ ! -d $dir ]; then
    mkdir -p $dir
    touch $file
    sed -i "/<!--begin-->/a[$m]()\n\n$fileUrl\n" $diaryDir/navigation.md
    vim $file
else   
    if [ ! -f $file ]; then
        touch $file
        echo "# $m-$d" >> $file
        sed -i "N; 6a$fileUrl" $diaryDir/navigation.md
        vim $file
    else
        vim $file
    fi
fi
