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

  - Download the focus-terminal.sh file and put where you want on your local disk.
  - Install a window manager with `sudo apt install wmctrl`.
  - Give that file permisions with `chmod 744 FilePath` Example: `chmod 744 $HOME/scripts/*sh`.
  - Create a shortcut with the command `gnome-terminal -x FilePath` Example: `gnome-terminal -x /home/a/scripts/focus-terminal.sh`.

If you want to use another terminal instead of gnome-terminal it maybe work if you just reaplace the files 7th line wiht your preference terminal but I cant asure it will work. 

Replace this

```
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

```
with 
```
#!/bin/bash

USER_AT_HOST="${USER}@${HOSTNAME}:"
count=$(wmctrl -l | grep --count "$USER_AT_HOST")

if [ "$count" == "0" ]; then
    xterm
else
    hexid=$(wmctrl -l | grep  "$USER_AT_HOST" | head -n 1 | cut --delimiter " " -f 1)
    wmctrl -i -R "$hexid"
fi
# EOF

```

I tried it with xterm and it worked, I have not tried any other terminal.

# Enjoy it!


