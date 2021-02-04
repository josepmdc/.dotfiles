#!/bin/bash

PARENT_BAR="main"
PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

update_hooks() {
    while IFS= read -r id
    do
        polybar-msg -p "$id" hook play-pause $2 1>/dev/null 2>&1
    done < <(echo "$1")
}

PLAYERCTL_STATUS=$(playerctl status 2>/dev/null)
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
    if [ "$PLAYERCTL_STATUS" = "Playing" ]; then
      update_hooks "$PARENT_BAR_PID" 1
      playerctl metadata --format "{{ title }} - {{ artist }}"
    elif [ "$PLAYERCTL_STATUS" = "Paused"  ]; then
      update_hooks "$PARENT_BAR_PID" 2
      playerctl metadata --format "{{ title }} - {{ artist }}"
    fi
fi
