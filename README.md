<img src="https://raw.githubusercontent.com/dukestreetstudio/zondicons/master/src/window-open.svg" height="150"></img><br>

#

# show-window.sh

A script that allows you to bring a given app to the foreground, i.e. to focus on it, with a single key.

# show-terminal.sh

Say, you are hacking away on a JavaScript in your Atom editor and want to run the script in the terminal.
You are too lazy to hit Alt-Tab three times to get to the correct window. You just want to press , say, 
the `F2` key so that your gnome-terminal window comes to the foreground. Well, then this script is for you.
This is exactly what it does. And if no gnome-terminal exists at the moment the single key, `F2` will
start a terminal for you and bring it to the foreground. No more Alt-Tab-ing! Assign this script to any key 
you like in ´Settings :arrow_right: Keyboard Shortcuts´ like so `gnome-terminal -e focus-terminal.sh`.

# show-atom.sh

The `atom` editor is somewhere. Not sure if you opened it already. To tired of hitting Alt-Tab five times 
to get to it. Assign the script `show-atom` to, say, key `F3` and with one keystroke you are done. `F3`, 
voila, the atom editor is in front of you. Open and focused. Assign this script to any key 
you like in ´Settings :arrow_right: Keyboard Shortcuts´ like so `gnome-terminal -e focus-atom.sh`.

# show-firefox.sh

You get it! Use `F4` or whatever you wish to always have `Firefox` ready with the touch of one button.  
Assign this script to any key 
you like in ´Settings :arrow_right: Keyboard Shortcuts´ like so `gnome-terminal -e focus-firefox.sh`.

# What it does

This script brings the first instance of a running app into the foreground and focuses on it.
If the app is currently not running it will start it, and bring it to the foreground.
It uses the utility `wmctrl` to do the work.
The idea is to assign this script to a shortcut key like F2 with `gnome-terminal -x /your/path/focus-something.sh`
So, by hitting the F2 key, the app is brought to foreground (and is started if necessary).
Tested on Ubuntu 20.04.

# Setup

  - Download the scripts and put them where you want on your local disk.
  - Install a window manager with `sudo apt install wmctrl` (Debian, Ubuntu, etc.) or `sudo dnf install wmctrl` (Fedora, etc.).
  - Set file permisions with `chmod 744 path/to/files/focus-*.sh`. Example: `chmod 744 $HOME/scripts/focus-*sh`.
  - Go to ´Settings :arrow_right: Keyboard Shortcuts´ and create a keyboard shortcut with the command `gnome-terminal -x path/to/files/focus-something.sh`. Example: `gnome-terminal -x /home/a/scripts/focus-atom.sh`.

# How about app Foo?

The scripts are very simple. Just 3 lines of code. You want it for app `foo`? Create your own script. Run `wmctrl -l` to see what the window title pattern of app `foo` is and put that into the script. Easy as pie!

# Enjoy it!

Bugs? Send PR to :octocat: !

