#!/bin/bash

qa=~/myScript/moXie/
qa_id=$( cat ${qa}/qa/qaNumber )
qa_id=$(( ++qa_id ))

read -p "请输入答案:" answer

shiFouCunZai=$( grep "^${answer}.*" $qa/answer/$(date +%y-%m-%d) )

while [ "${shiFouCunZai}" ]
do
    echo "该问题已存在"
    read -p "请输入答案:" answer
    shiFouCunZai=$( grep "^${answer}.*" $qa/answer/$(date +%y-%m-%d) )
done

echo $qa_id > ${qa}/qaNumber
echo "${answer}|${qa_id}" >> $qa/answer/$(date +%y-%m-%d)

touch ${qa}/${qa_id}

vim ${qa}/${qa_id}






















