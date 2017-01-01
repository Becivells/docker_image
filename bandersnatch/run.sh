#!/bin/bash

#set -e
set -x

#if update finsh will sleep $TIMESLEEP
[[ $TIMESLEEP -ge 300  ]] || TIMESLEEP=300
echo $TIMESLEEP

while true
do
    /usr/local/bin/bandersnatch mirror 
    sleep $TIMESLEEP
done
