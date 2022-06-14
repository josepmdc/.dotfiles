#!/bin/bash

laptop=eDP1
thundervolt=DP1
hdmi=HDMI1

if xrandr | grep "$thundervolt disconnected"; then
  xrandr --output "$thundervolt" --off --output "$laptop" --auto
else
  xrandr --output "$thundervolt" --auto --output "$laptop" --primary \
  --right-of "$thundervolt" --auto
fi

sleep 1
nohup ~/.config/polybar/launch.sh &
