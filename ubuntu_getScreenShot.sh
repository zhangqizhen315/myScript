#!/bin/bash


file=$( date +%y-%m-%d-%H-%M-%S ).png

bash /home/zhang/myScript/enableTouchpad.sh 

sleep 1

deepin-screenshot -s $(pwd) 

shot=$( ls $(pwd) | grep "深度截图" ) 

mv $shot $(pwd)/img/$file

echo "![a](img/${file})"
