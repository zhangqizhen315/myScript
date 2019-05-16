#!/bin/bash
# 用来试东西的脚本

echo "hello"
let a=$#==1
echo $a
 
for line in $( cat $1 )
do
    echo "ile : $line"
done
