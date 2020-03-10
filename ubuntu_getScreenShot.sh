#!/bin/bash

file=$( date +%y-%m-%d-%H-%M-%S ).jpg
$( gnome-screenshot -a -f $(pwd)/img/${file} ) &

echo "![a](img/${file})" 
