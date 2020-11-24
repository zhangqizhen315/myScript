#!/bin/bash

# 这个脚本用于从当日问题中循环取出问题传入 qa.sh 脚本, 直到当日问题为空

#read -p "执行到 todayanswer 了"
today=$(date +%y-%m-%d)
# 获取当日问题数
i=$( wc -l ~/myScript/moXie/answer/$today | cut -d " " -f1 )
echo $i
until [ $i -eq 0 ]
do
    # 获取单词内容和单词级别, 并且分别传入 qa.sh 脚本
    word=$( head -n 1 ~/myScript/moXie/answer/$today | cut -d "|" -f1 )
    level=$( head -n 1 ~/myScript/moXie/answer/$today | cut -d "|" -f3 )
    #echo "------------------------------"
    #echo "${word}"
    #echo "--------------------------------"
    #echo "${level}"
    #echo "------------------"
    bash ~/myScript/moXie/qa.sh $word $level
    # 删除当前行
    sed -i '1d' ~/myScript/moXie/answer/$today
    # 将行数减 1
    i=$( wc -l ~/myScript/moXie/answer/$today | cut -d " " -f1 )
done
