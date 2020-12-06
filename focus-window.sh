#!/bin/bash
#
# This script brings the first instance of an running application into the foreground and focuses on it.
# If the specified application is currently not running it will start one, and bring it to the foreground.
# It uses the utility `wmctrl` to do the work.
# If the appropriate arguments are passed it will for example focus (bring to foreground) the terminal.
# Scripts like focus-terminal.sh or focus-atom.sh do this job.
# The idea is to assign the final script to a shortcut key like F2 with `gnome-terminal -x /your/path/focus-terminal.sh`
# So, by hitting the F2 key, the desired app (e.g. terminal) is brought to foreground (and is started if necessary).
# Tested on Ubuntu 20.04.

#
# example output from `wmctrl --list` is as follows:
# `gnome-terminal` is the window with title "someuser@somehost: ..."
# $ wmctrl -l
# 0x04800001  0 quiet someprogram.js  ~/Documents  Atom
# 0x04400005  0 quiet someapp | M
# 0x0560000a  0 quiet someuser@somehost: ~/Documents
# 0x0200008b  0 quiet somepage | Site Foo - Mozilla Firefox
#

# This script takes 2 arguments:
# argument 1: The pattern by which the app or the window of the app is recognized.
#    e.g. ´someuser@somehost: ´ for the gnome-terminal
#    e.g. ´ Atom´ for the Atom editor
#    e.g. ´ - Mozilla Firefox´ for Firefox
# argument 2: The name of the process to start of window is not found.
#    e.g. ´gnome-terminal´ to start a terminal
#    e.g. ´atom´ to start the Atom editor
#    e.g. ´firefox´ to start a browser

# DEBUG=TRUE

# argument 1: window title pattern
# argument 2: app to start if needed
focus() {
    if [ "${DEBUG,,}" == "true" ]; then echo "executing focus with arguments \"$1\" and \"$2\"." | tee -a "/tmp/$(basename $0).log"; fi
    # list windows | count how many matching windows there are
    count=$(wmctrl -l | grep --count "$1")

    if [ "$count" == "0" ]; then
        if [ "${DEBUG,,}" == "true" ]; then echo "No matching window exists, starting the app \"$2\"." | tee -a "/tmp/$(basename $0).log"; fi
        $2
    else
        # list windows | get matching window | get first line | get first field
        hexid=$(wmctrl -l | grep "$1" | head -n 1 | cut --delimiter " " -f 1)
        if [ "${DEBUG,,}" == "true" ]; then echo "Window \"$1\" exists, bringing it to foreground." | tee -a "/tmp/$(basename $0).log"; fi
        # bring window to foreground, focus
        wmctrl -i -R "$hexid"
    fi
}

# no error checking, sorry
if [ "${DEBUG,,}" == "true" ]; then echo "calling focus with arguments \"$1\" and \"$2\"." | tee -a "/tmp/$(basename $0).log"; fi
focus "$1" "$2"
