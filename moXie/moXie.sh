#!/bin/bash

clear
i=0
word=test
lineNumber=0
cut -d "|" -f2 ~/memory/$(date +%y-%m-%d) | sort | uniq -c
while read line
do
    i=$((++i))
    if [ $i -eq 1 ]; then
        word=$line
    elif [ $i -ge 3 ] && ! [[ "$line" =~ .*CET[1-9].* ]] && ! [[ "$line" =~ .*TEM[1-9].* ]] && ! [[ "$line" =~ .*（.*[a-z]+.*\）.* ]] && ! [[ "$line" =~ .*\(.*[a-z]+.*\).* ]]; then
        lineNumber=$((++lineNumber))
        echo $line
    fi
done <<< $(wd $1)
if [ $lineNumber -gt 0 ]; then
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
    elif [ $2 -eq 0 ]; then
        sed -i "3i$1|6" ~/memory/$( date +%y-%m-%d )
    elif [ $2 -eq 6 ]; then
        sed -i "5i$1|7" ~/memory/$( date +%y-%m-%d )
    elif [ $2 -eq 7 ]; then
        sed -i "10i$1|8" ~/memory/$( date +%y-%m-%d )
    elif [ $2 -eq 8 ]; then
        echo "$1|1" >> ~/memory/$( date +%y-%m-%d )
    fi
else
    echo $1 
    read -p "错了"
    until [ "$1" = "$answer" ]
    do
        read -p "请确认:" answer
    done
    sed -i "2i$1|0" ~/memory/$( date +%y-%m-%d )
fi
fi
