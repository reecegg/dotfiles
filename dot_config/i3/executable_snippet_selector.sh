#!/bin/bash

# Directory containing snippet files (with subdirectories)
SNIPPET_DIR="$HOME/.config/snippets"

# Use `find` to get all files recursively, list them in rofi
SNIPPET_FILE=$(find "$SNIPPET_DIR" -type f | sed "s|$SNIPPET_DIR/||" | rofi -dmenu -p "Select a snippet")

# Exit if no snippet is selected
[ -z "$SNIPPET_FILE" ] && exit

# Copy the content of the selected snippet to the clipboard
printf "%s" "$(cat "$SNIPPET_DIR/$SNIPPET_FILE")" | xclip -selection clipboard
