#!/bin/bash

## 换壁纸脚本

while [ true ]
do
    pic=~/图片/wallpaper/${line}
    feh --randomize --bg-fill ~/图片/wallpaper
    sleep 300
done
