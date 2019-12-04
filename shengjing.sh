#!/bin/bash

i=0
cat shengjing | while read line
do 
    first=$(echo $line | cut -d " " -f 1)
    if [[ "$first" =~ ^[0-9]?[0-9]:[0-9]?[0-9]$ ]] ; then
        echo $old_first $en2 $en \| $zh >> shengjing_anki.txt
        zh=$line
        en=""
        old_first=$first
    else
        en2=$en
        en=$line 
        
    fi
done
