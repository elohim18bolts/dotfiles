#!/bin/bash
#
function i3status_reload()
{
    i3-msg -t command 'exec --no-startup-id killall i3bar'
    i3-msg -t command 'exec --no-startup-id i3bar --bar_id=bar-0'
}

i3status_reload
