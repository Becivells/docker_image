#!/bin/bash

set -x

#if update finsh will sleep $TIMESLEEP
[[ $TIMESLEEP -ge 300  ]] || export TIMESLEEP=21600
echo $TIMESLEEP

while true
do
    /usr/local/bin/bandersnatch mirror 
    sleep $TIMESLEEP
done
