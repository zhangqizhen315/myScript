#!/bin/bash

# 一个用来写随笔的脚本.

today=$( date +%y-%m-%d )
path=~/myScript/essay/${today}

if [ ! -d "${path}" ] ; then
    mkdir ${path}
    ls -al ${path}
    read -p "请输入文件名:" filename
    touch ${path}/$filename
    vim ${path}/$filename
else
    ls -al ${path}
    read -p "请输入文件名:" filename
    touch ${path}/$filename
    vim ${path}/$filename
fi 
