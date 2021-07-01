#!/bin/bash

# 这个脚本用来自启动一些 i3 / dwm 等需要的脚本

/bin/bash ~/myScript/wpchange.sh &
/bin/bash ~/myScript/disableTouchpad.sh &
ulauncher &
nm-applet &
goldendict &
compton --conf .config/compton/compton.conf 

