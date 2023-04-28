#!/bin/bash
#
while :
do
echo $(pacman -Qu | wc -l) > $1
sleep 300
done
