#!/bin/bash

# read script ´focus-window.sh´ for explanations

# DEBUG=TRUE

USER_AT_HOST="${USER}@${HOSTNAME}:"
TITLE_PATTERN="$USER_AT_HOST"

# APP_NAME=terminator
# APP_NAME=gnome-terminal
# APP_NAME=xterm

# do a prioritized search for terminal applications
if command -v terminator &>/dev/null; then
    echo "App terminator was found. Using it."
    APP_NAME=terminator
elif command -v gnome-terminal &>/dev/null; then
    echo "App gnome-terminal was found. Using it."
    APP_NAME=gnome-terminal
elif command -v xterm &>/dev/null; then
    echo "App xterm was found. Using it."
    APP_NAME=xterm
else
    echo "No terminal app was found." | tee -a "/tmp/$(basename $0).log"
    echo "Neither terminator, gnome-terminal, nor xterm are installed." | tee -a "/tmp/$(basename $0).log"
    echo "Configure or install a terminal and retry." | tee -a "/tmp/$(basename $0).log"
    echo "Aborting now." | tee -a "/tmp/$(basename $0).log"
    exit
fi

if [ "${DEBUG,,}" == "true" ]; then
    echo "Calling script focus-window.sh with arguments \"$TITLE_PATTERN\" and \"$APP_NAME\"." | tee -a "/tmp/$(basename $0).log"
    echo "whoami=$(whoami)" | tee -a "/tmp/$(basename $0).log"
    echo "pwd=$(pwd)" | tee -a "/tmp/$(basename $0).log"
    echo "PATH=$PATH" | tee -a "/tmp/$(basename $0).log"
fi
focus-window.sh "$TITLE_PATTERN" "$APP_NAME"
