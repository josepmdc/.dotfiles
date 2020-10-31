#!/bin/bash

laptop=eDP1
thundervolt=DP1
hdmi=HDMI1
virtual=VIRTUAL1

if xrandr | grep "$thundervolt disconnected"; then
  xrandr --output "$thundervolt" --off --output "$laptop" --auto
else
  xrandr --output "$thundervolt" --auto --output "$laptop" --off
fi
