#!/bin/bash

useage="answer 命令的用法: \n answer : 开始今天的默写; \n answer -n : 查看今日的需要默写的问题数量 \n answer -a : 为今天添加 50 个问题 \n answer -d 删除当前的第一个问题 \n answer -h : 查看帮助"

todayNamber=$(date -d "today 12:00:00" +%s)
while read line
do
    lineNamber=$(date -d "$line 12:00:00" +%s)
    if [[ $todayNamber -gt $lineNamber ]]; then
        cat ~/myScript/moXie/answer/$line >> ~/myScript/moXie/answer/$(date +%y-%m-%d)
        rm ~/myScript/moXie/answer/$line
    fi
done <<< $(ls ~/myScript/moXie/answer/ |grep "[0-9][0-9]-[0-9][0-9]-[0-9][0-9]" )


if [ $# -eq 0 ] && [ -f ~/myScript/moXie/answer/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/todayanswer.sh
elif [ $# -eq 0 ] && ! [ -f ~/myScript/moXie/answer/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/addTodayAnswer.sh
    bash ~/myScript/moXie/todayanswer.sh
elif [ $1 = '-n' ]; then
    cut -d "|" -f2 ~/myScript/moXie/answer/$(date +%y-%m-%d) | sort | uniq -c
elif [ $1 = '-a' ]; then
    bash ~/myScript/moXie/addTodayAnswer.sh
    wc -l ~/myScript/moXie/answer/$(date +%y-%m-%d)
elif [ $1 = '-d' ]; then
    sed -i "1d" ~/myScript/moXie/answer/$(date +%y-%m-%d)
elif [ $1 = '-h' ]; then
    echo -e $useage
else 
    echo -e $useage
fi
