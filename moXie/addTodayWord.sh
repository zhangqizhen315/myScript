#!/bin/bash

for ((i=1;i<=50;i++))
do
    word=$(head -n 1 ~/memory/wordbook)
    echo "$word|1" >> ~/memory/$(date +%y-%m-%d)
    sed -i '1d' ~/memory/wordbook
done
