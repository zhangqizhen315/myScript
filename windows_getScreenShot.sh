#!/bin/bash

$(cmd.exe /C snipaste.exe snip -o quick-save) > /dev/null 2>&1

sleep 10

file=$( ls -t ~/gitpath/document/screenshot | head -n 1 )

cp ~/gitpath/document/screenshot/${file} $(pwd)/img/${file}

echo "![](../img/${file})"
