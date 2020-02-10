#!/bin/bash

## 换壁纸脚本

while [ true ]
do
while read line
do
    pic=~/图片/wallpaper/${line}
    sudo ~/.local/share/nautilus/scripts/SetAsWallpaper $pic
    sleep 10
done <<< $( ls ~/图片/wallpaper )
done
