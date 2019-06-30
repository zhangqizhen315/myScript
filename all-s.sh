#!/bin/bash
# 给 s 添加单词

i=0
for line in $( tac  /home/zhang/en.txt )
do
    let i=$i+1
    echo $i
    s -a $line
done
