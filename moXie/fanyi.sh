#!/bin/bash

while [ true ]
do

    read -p : word
    echo $word
    wd $word
    if [[ $( cat ~/myScript/moXie/memory/$( date +%y-%m-%d ) | grep "${word}|" ) = "" ]]; then
        echo "${word}|1" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
    fi
done
