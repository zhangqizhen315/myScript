#!/bin/bash

qa=~/myScript/moXie/qa
qa_id=$( cat ${qa}/qaNumber )
qa_id=$(( ++qa_id ))

read -p "请输入答案:" answer

shiFouCunZai=$( grep "^${answer}.*" $qa/answerBook )

while [ "${shiFouCunZai}" ]
do
    echo "该问题已存在"
    read -p "请输入答案:" answer
    shiFouCunZai=$( grep "^${answer}.*" $qa/answerBook )
done

echo $qa_id > ${qa}/qaNumber
echo "${answer}|${qa_id}" >> $qa/answerBook

touch ${qa}/${qa_id}

vim ${qa}/${qa_id}






















