#!/bin/bash

# 一个用来写随笔的脚本.

today=$( date +%y-%m-%d )
path=~/myScript/essay/${today}
if [ -d "${path}" ]; then ls ${path}
read -p "请输入文件名:" filename

if [ ! -d "${path}" ] && [ ! -n ${filename} ]; then
    mkdir ${path}
    touch ${path}/$filename
    vim ${path}/$filename
elif [ ! -n ${filename} ]; then 
    touch ${path}/$filename
    vim ${path}/$filename
fi 
