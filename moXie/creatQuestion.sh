#!/bin/bash

qa=~/myScript/moXie/qa
qa_id=$( ls $qa | wc -l )
qa_id=$(( ++qa_id ))

read -p "请输入答案:" answer

shiFouCunZai=$( grep "^${answer}.*" ~/myScript/moXie/answerBook )

if [[ "$shiFouCunZai" == "" ]] ; then
    echo "yes"
fi

while [[ "$shiFouCunZai" != "" ]]
do
    echo "该问题已存在"
    read -p "请输入答案:" answer
done


#
#echo "${answer}|${qa_id}" >> answerBook
#
#touch ${qa}/${qa_id}






















