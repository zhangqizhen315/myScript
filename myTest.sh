#!/bin/bash
# 用来试东西的脚本

fangfa (  ) {
    echo "方法"
}

echo $1 | grep ".*xlsx$" 

if [[ "$1" =~ .*xlsx$ ]] ; then
    echo "对喽"
    fangfa
else
    echo "不对"
fi



#以下是以前的测试
#-------------------------
#echo "hello"
#let a=$#==1
#echo $a
# 
#for line in $( cat $1 )
#do
#    echo "ile : $line"
#done

