#!/bin/bash
# 写作读书笔记的脚本

source ~/myScript/config
dir='/var/www/html/note'
exce='/mnt/c/excerpt'
model='/home/zhang/myScript/model/readNote'
if [ $# == 1 ]; then
    if [ -f ${exce}/${1}.png ]; then
        if [ ! -d ${dir}/${book} ]; then
            bash ~/myScript/mkReadNote.sh $book
        fi
        mv ${exce}/${1}.png ${dir}/excerpt/${book}_${1}.png
        bash ~/myScript/writeReadnoteContent.sh ${dir}/${book} ${book}_${1} 摘录
    else
        if [ -f ${dir}/${book}_${1}.md ]; then
            vim ${dir}/${book}_${1}.md
        else
            echo "摘录不存在, 相应的读书笔记也不存在"
        fi
    fi
else
    echo "请输入摘录"
fi
