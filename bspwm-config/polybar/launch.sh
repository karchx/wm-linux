#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Screens
screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

primary=$(xrandr --query | grep primary | cut -d" " -f1)

for m in $screens; do
  if [[ $primary == $m ]]; then
      MONITOR=$m polybar top -r &
  else
      echo $m
      MONITOR=$m polybar top -r &
  fi
done

# Launch bar1 and bar2
#echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

#polybar example  >>/tmp/polybar1.log 2>&1 &
#polybar top -r >>/tmp/polybar1.log 2>&1 & disown

#echo "Bars launched..."

