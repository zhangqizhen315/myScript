#!/bin/bash

#clear
i=0
#qa_answer=test
lineNumber=0
remainder=$( cat ~/myScript/moXie/answer/$( date +%y-%m-%d ) | wc -l | cut -d " " -f1 )
echo "还剩 ${remainder} 个"
echo "========================="
echo $1
cut -d "|" -f3 ~/myScript/moXie/answer/$(date +%y-%m-%d) | sort | uniq -c
qa_id=$( grep "${1}" ~/myScript/moXie/answer/$(date +%y-%m-%d) | cut -d "|" -f2 )
if [ -f ~/myScript/moXie/qa/${qa_id} ]; then
    cat ~/myScript/moXie/qa/${qa_id}
fi
if [ -f ~/myScript/moXie/qa/${qa_id} ]; then
read -p "请输入单词:" answer
#answer=$( echo $answer | tr "[:upper:]" "[:lower:]" )
temp=$1
if [ "$answer" = "$temp" ]; then
    if [ $2 -eq 1 ]; then
        echo "$1|${qa_id}|2" >> ~/myScript/moXie/answer/$(date -d "+1 day" +%y-%m-%d)
    elif [ $2 -eq 2 ]; then
        echo "$1|${qa_id}|3" >> ~/myScript/moXie/answer/$(date -d "+3 day" +%y-%m-%d)
    elif [ $2 -eq 3 ]; then
        echo "$1|${qa_id}|4" >> ~/myScript/moXie/answer/$(date -d "+7 day" +%y-%m-%d)
    elif [ $2 -eq 4 ]; then
        echo "$1|${qa_id}|5" >> ~/myScript/moXie/answer/$(date -d "+15 day" +%y-%m-%d)
    elif [ $2 -eq 0 ]; then
        if [ ${remainder} -gt 3 ]; then
            sed -i "3i$1|${qa_id}|6" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$1|${qa_id}|6" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 6 ]; then
        if [ ${remainder} -gt 5 ]; then
            sed -i "5i$1|${qa_id}|7" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$1|${qa_id}|7" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 7 ]; then
        if [ ${remainder} -gt 10 ]; then
            sed -i "10i$1|${qa_id}|8" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$1|${qa_id}|8" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $2 -eq 8 ]; then
        echo "$1|${qa_id}|1" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
    fi
else
    echo $1 
    echo "错了"
    until [ "$temp" = "$answer" ]
    do
        read -p "请确认:" answer
    done
        if [ ${remainder} -gt 2 ]; then
            sed -i "2i$1|${qa_id}|0" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$1|${qa_id}|0" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
fi
fi
