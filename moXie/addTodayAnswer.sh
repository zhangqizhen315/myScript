#!/bin/bash


j=$(wc -l ~/myScript/moXie/qa/answerBook | cut -d " " -f1)
if [[ $j -ge 50 ]]; then
    j=50
else
    j=$j
fi

for ((i=1;i<=j;i++))
do
    answer=$(head -n 1 ~/myScript/moXie/qa/answerBook)
    echo "$answer|1" >> ~/myScript/moXie/answer/$(date +%y-%m-%d)
    sed -i '1d' ~/myScript/moXie/qa/answerBook
done
