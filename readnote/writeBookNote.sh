#!/bin/bash

currentBook=$( cat ./currentBook | awk -F "/" '{print $NF}' | awk -F "." '{print $1}' )

# echo $currentBook

if [ ! -d ~/myContent/readnote/${currentBook} ]; then
    mkdir ~/myContent/readnote/${currentBook}
fi

cd ~/myContent/readnote/${currentBook}

vim


