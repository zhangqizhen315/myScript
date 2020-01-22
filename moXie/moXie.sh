#!/bin/bash

clear
i=0
word=test
lineNumber=0
remainder=$( cat ~/myScript/moXie/memory/$( date +%y-%m-%d ) | wc -l | cut -d " " -f1 )
echo "还剩 ${remainder} 个"
cut -d "|" -f2 ~/myScript/moXie/memory/$(date +%y-%m-%d) | sort | uniq -c
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
answer=$( echo $answer | tr "[:upper:]" "[:lower:]" )
temp=$( echo $1 | tr "[:upper:]" "[:lower:]" )
if [ "$answer" = "$temp" ]; then
    if [ $2 -eq 1 ]; then
        echo "$1|2" >> ~/myScript/moXie/memory/$(date -d "+1 day" +%y-%m-%d)
    elif [ $2 -eq 2 ]; then
        echo "$1|3" >> ~/myScript/moXie/memory/$(date -d "+3 day" +%y-%m-%d)
    elif [ $2 -eq 3 ]; then
        echo "$1|4" >> ~/myScript/moXie/memory/$(date -d "+7 day" +%y-%m-%d)
    elif [ $2 -eq 4 ]; then
        echo "$1|5" >> ~/myScript/moXie/memory/$(date -d "+15 day" +%y-%m-%d)
    elif [ $2 -eq 0 ]; then
        if [ ${remainder} -gt 3 ]; then
            sed -i "3i$1|6" ~/myScript/moXie/memory/$( date +%y-%m-%d )
        else
            echo "$1|6" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 6 ]; then
        if [ ${remainder} -gt 5 ]; then
            sed -i "5i$1|7" ~/myScript/moXie/memory/$( date +%y-%m-%d )
        else
            echo "$1|7" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 7 ]; then
        if [ ${remainder} -gt 10 ]; then
            sed -i "10i$1|8" ~/myScript/moXie/memory/$( date +%y-%m-%d )
        else
            echo "$1|8" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 8 ]; then
        echo "$1|1" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
    fi
else
    echo $1 
    echo "错了"
    until [ "$temp" = "$answer" ]
    do
        read -p "请确认:" answer
    done
        if [ ${remainder} -gt 2 ]; then
            sed -i "2i$1|0" ~/myScript/moXie/memory/$( date +%y-%m-%d )
        else
            echo "$1|0" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
        fi
fi
fi
