#!/bin/bash
#
comm -23 <(pacman -Qqett | sort | uniq) <(pacman -Qqg base -g base-devel | sort | uniq)
