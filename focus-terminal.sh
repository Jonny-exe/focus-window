#!/bin/bash

# read script ´focus-window.sh´ for explanations

USER_AT_HOST="${USER}@${HOSTNAME}:"
TITLE_PATTERN="$USER_AT_HOST"
APP_NAME=gnome-terminal
focus-window.sh "$TITLE_PATTERN" "$APP_NAME"
