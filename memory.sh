#!/bin/bash

useage="memory 命令的用法: \n memory : 开始今天的默写; \n memory -n : 查看今日的需要默写的单词数量 \n memory -a : 为今天添加 50 个单词 \n memory -h : 查看帮助"

todayNamber=$(date -d "today 12:00:00" +%s)
while read line
do
    lineNamber=$(date -d "$line 12:00:00" +%s)
    if [[ $todayNamber -gt $lineNamber ]]; then
        cat ~/myScript/moXie/memory/$line >> ~/myScript/moXie/memory/$(date +%y-%m-%d)
        rm ~/myScript/moXie/memory/$line
    fi
done <<< $(ls ~/myScript/moXie/memory/ |grep "[0-9][0-9]-[0-9][0-9]-[0-9][0-9]" )


if [ $# -eq 0 ] && [ -f ~/myScript/moXie/memory/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/todayMemory.sh
elif [ $# -eq 0 ] && ! [ -f ~/myScript/moXie/memory/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/addTodayWord.sh
    bash ~/myScript/moXie/todayMemory.sh
elif [ $1 = '-n' ]; then
    cut -d "|" -f2 ~/myScript/moXie/memory/$(date +%y-%m-%d) | sort | uniq -c
elif [ $1 = '-a' ]; then
    bash ~/myScript/moXie/addTodayWord.sh
    wc -l ~/myScript/moXie/memory/$(date +%y-%m-%d)
elif [ $1 = '-h' ]; then
    echo -e $useage
else 
    echo -e $useage
fi
