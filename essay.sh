#!/bin/bash

# 一个用来写随笔的脚本.

today=$( date +%y-%m-%d )
path=~/myScript/essay/${today}

if [ ! -d "${path}" ] ; then
    mkdir ${path}
fi 

    ls -al ${path}
    read -p "请输入文件名:" filename
if [ "${filename}" = "" ] ; then
    echo "yes"
    filename=$( date +%H-%M-%S )
fi
    touch ${path}/$filename
    vim ${path}/$filename
