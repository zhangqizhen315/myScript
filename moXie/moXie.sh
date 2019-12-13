#!/bin/bash

wd
clear
i=0
word=test
while read line
do
    i=$((++i))
    if [ $i -eq 1 ]; then
        word=$line
    elif [ $i -ge 3 ] && ! [[ "$line" =~ .*CET.* ]]; then
        echo $line
    fi
done <<< $(wd $1)
read -p "请输入单词:" answer
if [ "$answer" = "$1" ]; then
    read -p "对了"
    if [ $2 -eq 1 ]; then
        echo "$1|2" >> ~/memory/$(date -d "+1 day" +%y-%m-%d)
    elif [ $2 -eq 2 ]; then
        echo "$1|3" >> ~/memory/$(date -d "+3 day" +%y-%m-%d)
    elif [ $2 -eq 3 ]; then
        echo "$1|4" >> ~/memory/$(date -d "+7 day" +%y-%m-%d)
    elif [ $2 -eq 4 ]; then
        echo "$1|5" >> ~/memory/$(date -d "+15 day" +%y-%m-%d)
    fi
else
    echo $1 
    read -p "错了"
    echo "$1|1" >> ~/memory/$( date +%y-%m-%d )
fi
