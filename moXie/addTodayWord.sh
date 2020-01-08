#!/bin/bash


j=$(wc -l ~/myScript/moXie/memory/wordbook | cut -d " " -f1)
if [[ $j -ge 50 ]]; then
    j=50
else
    j=$j
fi

for ((i=1;i<=j;i++))
do
    word=$(head -n 1 ~/myScript/moXie/memory/wordbook)
    echo "$word|1" >> ~/myScript/moXie/memory/$(date +%y-%m-%d)
    sed -i '1d' ~/myScript/moXie/memory/wordbook
done
