#!/bin/bash

process=$(ps -aux | grep "change_wallpaper.sh" | grep -v "grep")

if [ ! -n "$process" ]; then
    /bin/bash ~/myScript/change_wallpaper.sh
else
    psID=$(echo $process | cut -d" " -f2)
    kill -9 $psID
    /bin/bash ~/myScript/change_wallpaper.sh
fi
