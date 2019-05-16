#!/bin/bash
# 为 wiki 创造一个主题

dir="/var/www/html/note"
model="/home/zhang/myScript/model/wiki"
if [ $# == 1 ]; then
  if [ ! -d $dir/$1 ]; then
      cp -r $model $dir/$1 
      sed -i "1i# $1" $dir/$1/navigation.md
#      sed -i "N; 20a<li><a href='/wiki/$1/index.html'>$1</a></li>" $dir/../wiki.html
      echo "# $1" > $dir/$1/index.md
      vim $dir/$1/index.md
  else
      echo "$1 主题已存在"
      vim $dir/$1/index.md
  fi
else
    echo "请输入一个参数"
fi

