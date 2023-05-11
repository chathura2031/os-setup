#!/bin/bash

notify() {
    icon_name="/usr/share/icons/Adwaita/48x48/devices/audio-headset.png"
    volume=$(amixer get Master | tail -n 1 | grep -o "\[.*%\]" | sed "s/[^0-9]//g")
    bar_count=20
    divisor=$((100/$bar_count))
    echo $(($bar_count - $volume/$divisor))
    echo $(($volume/$divisor))
    filled_bar=$(seq -s "█" $(($volume/$divisor)) | sed 's/[0-9]//g')
    unfilled_bar=$(seq -s "⠀" $(($bar_count - $volume/$divisor)) | sed 's/[0-9]//g')
    dunstify " $filled_bar$unfilled_bar    $volume%" -i $icon_name -t 2000 -r 555
}

# Set the volume of the individual devices to max
initialise() {
    amixer set Headphone 100%
    amixer set Speaker 100%
}

# Increase the master volume
increase() {
    amixer set Master 1%+
}

# Decrease the master volume
decrease() {
    amixer set Master 1%-
}

initialise
if [[ $1 = "inc" ]]; then
    increase
    notify
elif [[ $1 = "dec" ]]; then
    decrease
    notify
else
    echo "UNKNOWN COMMAND"
    exit 1
fi
