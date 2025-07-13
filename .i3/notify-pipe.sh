#!/usr/bin/env sh

# Read the percentage from the input
read percentage

# Create the progress bar
progress_bar=$(create_progress_bar $percentage)

# Use notify-send to display the progress bar
notify-send -r 9999 -i /usr/share/icons/Papirus/128x128/devices/audio-headphones.svg "  Volume" -h int:value:"$percentage" -h string:synchronous:volume