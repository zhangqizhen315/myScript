#!/bin/bash

useage="memory 命令的用法: \n memory : 开始今天的默写; \n memory -n : 查看今日的需要默写的单词数量 \n memory -a : 为今天添加 50 个单词 \n memory -h : 查看帮助"

if [ $# -eq 0 ] && [ -f ~/memory/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/todayMemory.sh
elif [ $# -eq 0 ] && ! [ -f ~/memory/$(date +%y-%m-%d) ]; then
    bash ~/myScript/moXie/addTodayWord.sh
    bash ~/myScript/moXie/todayMemory.sh
elif [ $1 = '-n' ]; then
    wc -l ~/memory/$(date +%y-%m-%d)
elif [ $1 = '-a' ]; then
    bash ~/myScript/moXie/addTodayWord.sh
    wc -l ~/memory/$(date +%y-%m-%d)
elif [ $1 = '-h' ]; then
    echo -e $useage
else 
    echo -e $useage
fi
