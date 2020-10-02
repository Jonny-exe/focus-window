# Show-terminal

This is a linux shortcut fot the terminal

# What it does

This script brings the first instance of an running gnome-terminal into the foreground and focuses on it.
If no gnome-terminal is currently running it will start one, and bring it to the foreground.
It uses the utility `wmctrl` to do the work.
The idea is to assign this script to a shortcut key like F2 with `gnome-terminal -x /your/path/focus-terminal.sh`
So, by hitting the F2 key, the terminal is brought to foreground (and is started if necessary).
Tested on Ubuntu 20.04.

# Setup
Download the focus-terminal.sh file and put where you want on your local disk.
Install a window manager with `sudo apt install wmctrl`.
Give that file permisions with `chmod 744 Pathfile` Example: `chmod 744 $HOME/scripts/*sh`.


