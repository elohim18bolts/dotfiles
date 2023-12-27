#!/bin/bash
virsh --connect qemu:///system start win11 && sleep 1 && looking-glass-client
