#!/bin/bash

currentBook=$( cat ./currentBook | awk -F "/" '{print $NF}' | awk -F "." '{print $1}' )

echo $currentBook


