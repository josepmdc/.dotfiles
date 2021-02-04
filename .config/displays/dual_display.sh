#!/bin/bash

laptop=eDP-1
thundervolt=DP-1
hdmi=HDMI-1

if xrandr | grep "$thundervolt disconnected"; then
  xrandr --output "$thundervolt" --off --output "$laptop" --auto
else
  xrandr --output "$thundervolt" --auto --output "$laptop" --primary \
  --right-of "$thundervolt" --auto
fi
