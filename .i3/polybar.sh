#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
     if [ "$m" == "HDMI-0" ]; then
        MONITOR=$m polybar -c .config/polybar/config_small &
     else
        MONITOR=$m polybar -c .config/polybar/config &
     fi
#    MONITOR=$m polybar --reload left &
#    MONITOR=$m polybar --reload center &
#    MONITOR=$m polybar --reload right &
  done
else
   polybar -r example &
#  polybar --reload left &
#  polybar --reload center &
#  polybar --reload right &
fi