#!/bin/sh
gconftool-2 --set "/apps/gnome-terminal/profiles/Default/cursor_shape" --type string "$1"

