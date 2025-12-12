#!/bin/bash

# Enable strict mode
set -euo pipefail

# List the scripts in ~/.screenlayout without the .sh extension, sort by number, and let the user choose one
SCRIPT=$(find ~/.screenlayout -type f -name "*.sh" -print0 | xargs -0 -n 1 basename | sed 's/\.sh$//' | sort -V | rofi -dmenu -p "Select Screen Layout")

# If a script was selected, execute it
if [ -n "$SCRIPT" ]; then
    ~/.screenlayout/"$SCRIPT".sh
fi
