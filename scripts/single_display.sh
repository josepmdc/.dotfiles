#!/bin/bash

laptop=eDP-1
thundervolt=DP-1
hdmi=HDMI-1-0

if xrandr | grep "$hdmi connected"; then
  xrandr --output "$hdmi" --auto --output "$laptop" --off
elif xrandr | grep -w "$thundervolt connected"; then
  xrandr --output "$thundervolt" --auto --output "$laptop" --off
else
  xrandr --output "$thundervolt" --off --output "$hdmi" --off --output "$laptop" --auto
fi

sleep 1

nohup ~/.config/polybar/launch.sh &
