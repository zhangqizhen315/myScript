#!/bin/bash

process=$(ps -aux | grep "change_wallpaper.sh" | grep -v "grep")

echo $process

if [[ $proess == "" ]]; then
    echo "空"
fi
