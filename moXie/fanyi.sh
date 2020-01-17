#!/bin/bash

wd $1

if [[ $( cat ~/myScript/moXie/memory/$( date +%y-%m-%d ) | grep "${1}|" ) = "" ]]; then
    echo "${1}|1" >> ~/myScript/moXie/memory/$( date +%y-%m-%d )
fi
