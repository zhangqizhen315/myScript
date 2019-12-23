#!/bin/bash

for ((i=1;i<=50;i++))
do
    word=$(head -n 1 ~/myScript/moXie/memory/wordbook)
    echo "$word|1" >> ~/myScript/moXie/memory/$(date +%y-%m-%d)
    sed -i '1d' ~/myScript/moXie/memory/wordbook
done
