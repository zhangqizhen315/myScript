#!/bin/bash

for ((i=$( cat $1 | jq 'length' ); i >= 0; i --))
do
    x=$i-1
    currentGroup=$(cat $1 | jq ".[${x}]")
    groupName=$( echo $currentGroup | jq ".group" | jq ".name" )
    groupConfig=$( echo $currentGroup | jq ".configurations" )
    echo $groupName
    echo "以下是组内配置"
    for (( j=$( echo $groupConfig | jq 'length' ); j >= 0; j -- ))
    do
        y=$j-1
        echo $groupConfig | jq ".[${y}]" | jq ".name"
        echo $groupConfig | jq ".[${y}]" | jq ".secondary_configuration"
    done
    groupProxies=$( echo $currentGroup | jq ".action_proxies" )
    echo "-------------------"
    echo "以下是组配置关联的组件配置"
    for (( j=$( echo $groupProxies | jq "length" ); j >=0; j-- ))
    do
        y=$j-1
        echo $groupProxies | jq ".[${y}]" | jq ".name"
        echo $groupProxies | jq ".[${y}]" | jq ".primary_configuration"
    done
    echo "======================"
done



