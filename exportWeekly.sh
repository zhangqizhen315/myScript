#!/bin/bash

today=$( date +%y-%m-%d )
if [ ! -f "$today" ] ; then
    touch $today
fi

allperson=$(cut -d "^" -f9 $1 | sort | uniq)

for person in $allperson
do
    if [ "$person " != "经办人" ] && [ "$person" ]; then
        echo $person 
        echo "本周" 
        grep "完成.*${person}" $1 | cut -d "^" -f5  
        echo ""
        echo "下周"
        grep "待办.*${person}" $1 | cut -d "^" -f5
    fi
    echo ""
    echo "========"
    echo ""
done 
