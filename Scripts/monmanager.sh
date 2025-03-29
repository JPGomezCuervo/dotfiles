#!/bin/bash

init() {
        xrandr --auto
        active_monitors=$(xrandr --listmonitors | awk 'NR == 1 {print $2}')

        if [ "$active_monitors" -eq 2 ]; then
                xrandr --output HDMI-A-0 --primary
                xrandr --output eDP --off
        fi
}


toggle() {
        monitor_name=$(xrandr --listmonitors | awk 'NR == 2 {print $4}')

        case $monitor_name in
                eDP)
                        echo "Your current monitor is eDP switching to HDMI-A-0"
                        xrandr --output HDMI-A-0 --auto
                        ;;

                HDMI-A-0)
                        echo "Your current monitor is HDMI-A-0 switching to eDP"
                        xrandr --output eDP --auto
                        ;;
        esac

        xrandr --output $monitor_name --off
}

while getopts "ti" flag; do
        case $flag in
                t) toggle;;
                i) init;;
        esac
done
