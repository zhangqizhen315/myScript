#!/bin/bash

setcb() {
    echo $1
    echo $1 > currentBook
}

if [[ "$1" =~ .*pdf$ ]] ; then 
    nohup evince $1 &
    echo $1 > currentBook
elif [[ "$1" =~ .*epub$|.*epub3$|.*azw$|.*azw3$|.*mobi$|.*fb2$|.*fb2.zip$|.*cbr$|.*cbz$|.*cbt$|.*cb7$|.*txt$ ]] ; then
    nohup /usr/bin/com.github.johnfactotum.Foliate $1 &
    echo $1 > currentBook
else
    echo "暂不支持这种电子书"
fi
