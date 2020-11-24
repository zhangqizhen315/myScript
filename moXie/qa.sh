#!/bin/bash

#clear
echo "执行到 qa.sh 了 传入参数是 ${@} $2 $3 $4"
read 
i=0
#qa_answer=test
lineNumber=0
remainder=$( cat ~/myScript/moXie/answer/$( date +%y-%m-%d ) | wc -l | cut -d " " -f1 )
echo "还剩 ${remainder} 个"
reply=$( echo $@ | awk -F " " '{$NF="";print$0}' )
level=$( echo $@ | awk -F " " '{print $NF}' )
cut -d "|" -f3 ~/myScript/moXie/answer/$(date +%y-%m-%d) | sort | uniq -c
qa_id=$(echo ${reply} | grep -f ~/myScript/moXie/answer/$(date +%y-%m-%d) | cut -d "|" -f2 )
if [ -f ~/myScript/moXie/qa/${qa_id} ]; then
    cat ~/myScript/moXie/qa/${qa_id}
else
    read -p "？？？？？？？？???"
fi
if [ -f ~/myScript/moXie/qa/${qa_id} ]; then
read -p "请输入单词:" answer
#answer=$( echo $answer | tr "[:upper:]" "[:lower:]" )
temp=$( echo ${reply} | sed 's/[ \t]*//g' )
echo "temp 是" $temp"."
echo "answer 是" $answer"."

if [ "$answer" = "$temp" ]; then
    if [ $level -eq 1 ]; then
        echo "$reply|${qa_id}|2" >> ~/myScript/moXie/answer/$(date -d "+1 day" +%y-%m-%d)
    elif [ $level -eq 2 ]; then
        echo "$reply|${qa_id}|3" >> ~/myScript/moXie/answer/$(date -d "+3 day" +%y-%m-%d)
    elif [ $level -eq 3 ]; then
        echo "$reply|${qa_id}|4" >> ~/myScript/moXie/answer/$(date -d "+7 day" +%y-%m-%d)
    elif [ $level -eq 4 ]; then
        echo "$reply|${qa_id}|5" >> ~/myScript/moXie/answer/$(date -d "+15 day" +%y-%m-%d)
    elif [ $level -eq 0 ]; then
        if [ ${remainder} -gt 3 ]; then
            sed -i "3i$reply|${qa_id}|6" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$reply|${qa_id}|6" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $level -eq 6 ]; then
        if [ ${remainder} -gt 5 ]; then
            sed -i "5i$reply|${qa_id}|7" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$reply|${qa_id}|7" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $level -eq 7 ]; then
        if [ ${remainder} -gt 10 ]; then
            sed -i "10i$reply|${qa_id}|8" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$reply|${qa_id}|8" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
    elif [ $level -eq 8 ]; then
        echo "$reply|${qa_id}|1" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
    fi
else
    echo $reply 
    echo "错了"
    until [ "$temp" = "$answer" ]
    do
        read -p "请确认:" answer
    done
        if [ ${remainder} -gt 2 ]; then
            sed -i "2i$reply|${qa_id}|0" ~/myScript/moXie/answer/$( date +%y-%m-%d )
        else
            echo "$reply|${qa_id}|0" >> ~/myScript/moXie/answer/$( date +%y-%m-%d )
        fi
fi
fi
