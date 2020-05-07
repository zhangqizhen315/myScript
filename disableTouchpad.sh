#!/bin/bash

id=$( xinput -list | grep -E ".*TouchPad.*|ELAN2202:00 04F3:306D Touchpad " | cut -f2 | cut -d "=" -f2 )

xinput -disable $id
