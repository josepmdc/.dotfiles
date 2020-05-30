#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

displays=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
exec echo $displays | grep -q "eDP1" && 
exec polybar --reload eDP1 & 

exec echo $displays | grep -q "DP1" && 
exec polybar --reload DP1 & 

