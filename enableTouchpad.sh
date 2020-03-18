#!/bin/bash

id=$( xinput -list | grep ".*Touch.ad.*" | cut -f2 | cut -d "=" -f2 )
echo $id

xinput -enable $id
