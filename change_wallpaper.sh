#!/bin/bash

## 换壁纸脚本

while [ true ]
do
    echo 1
    pic=~/图片/wallpaper/${line}
    feh --randomize --bg-fill ~/图片/wallpaper
    sleep 10s
done
