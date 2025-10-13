#!/usr/bin/env bash

choice=$(echo -e "   Poweroff\n   Reboot\n 󰒲  Suspend\n   Lock\n   Logout" | fuzzel --dmenu | awk '{print tolower($2)}')

case "$choice" in
    poweroff|reboot) systemctl "$choice";;
    suspend) hyprlock & disown && systemctl suspend;;
    lock) hyprlock;;
    logout) hyprctl dispatch exit;;
esac
