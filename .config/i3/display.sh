#!/bin/bash
#output=$(xrandr -q | grep " connected" | cut -d ' ' -f1)

# Dual monitor setup
#if echo $output | grep -q "eDP1" && echo $output | grep -q "\bDP1\b"; then
#  exec xrandr --output eDP1 --left-of DP1 --primary &
#  exit 1
#fi

# Only laptop screen
#echo $output | grep -q "eDP1" &&
#exec xrandr --output eDP1 --mode 1920x1080 &

laptop=eDP1
thundervolt=DP1
hdmi=HDMI1
virtual=VIRTUAL1

if xrandr | grep "$thundervolt disconnected"; then
  xrandr --output "$thundervolt" --off --output "$laptop" --mode 1920x1080 --auto
else
  xrandr --output "$thundervolt" --mode 1920x1080 --output "$laptop" --primary --mode 1920x1080 --left-of "$thundervolt" 
fi
