#!/bin/bash

check_hdmi_port=$(xrandr | grep "disconnected")
output=$(xrandr --listmonitors | grep "HDMI")
laptop_active=0
hdmi_active=1
status=""

if [ "$check_hdmi_port" == "" ];
then
    if [ "$output" == "" ]; 
    then
        xrandr --output HDMI-A-0 --auto
        xrandr --output eDP --off
        status="$hdmi_active"
    else
        xrandr --output eDP --auto
        xrandr --output HDMI-A-0 --off
        status="$laptop_active"
    fi
else
    xrandr --output eDP --auto
    status="$laptop_active"
fi

if ["$status" -eq "$laptop_active"];
then
    i3-msg workspace 1 gaps horizontal 560px
    i3-msg smart_gaps inverse_outer
fi
