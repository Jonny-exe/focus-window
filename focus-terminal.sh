#!/bin/bash

USER_AT_HOST="${USER}@${HOSTNAME}:"
count=$(wmctrl -l | grep --count "$USER_AT_HOST")

if [ "$count" == "0" ]; then
    gnome-terminal
else
    hexid=$(wmctrl -l | grep  "$USER_AT_HOST" | head -n 1 | cut --delimiter " " -f 1)
    wmctrl -i -R "$hexid"
fi
# EOF
