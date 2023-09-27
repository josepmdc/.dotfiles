#!/bin/bash

laptop=eDP-1
thundervolt=DP-1
hdmi=HDMI-1-0

if xrandr | grep "$thundervolt disconnected"; then
  xrandr --output "$thundervolt" --off --output "$laptop" --auto
else
  xrandr --output "$thundervolt" --primary --auto --output "$laptop" --right-of "$thundervolt" --auto
fi

sleep 2
nohup ~/.config/polybar/launch.sh &
