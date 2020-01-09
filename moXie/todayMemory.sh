#!/bin/bash

# 这个脚本用于从当日单词中循环取出单词传入 moxie.sh 脚本, 直到当日单词为空

today=$(date +%y-%m-%d)
# 获取当日词数
i=$( wc -l ~/myScript/moXie/memory/$today | cut -d " " -f1 )
echo $i
until [ $i -eq 0 ]
do
    # 获取单词内容和单词级别, 并且分别传入 moxie.sh 脚本
    word=$( head -n 1 ~/myScript/moXie/memory/$today | cut -d "|" -f1 )
    level=$( head -n 1 ~/myScript/moXie/memory/$today | cut -d "|" -f2 )
    bash ~/myScript/moXie/moXie.sh $word $level
    # 删除当前行
    sed -i '1d' ~/myScript/moXie/memory/$today
    # 将行数减 1
    i=$( wc -l ~/myScript/moXie/memory/$today | cut -d " " -f1 )
done
