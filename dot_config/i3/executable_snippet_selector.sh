#!/bin/bash

# Directory containing snippet files (with subdirectories)
SNIPPET_DIR="$HOME/.config/snippets"
LAST_FILE="$HOME/.cache/last_snippet"

# Read last selection if it exists
LAST=""
[ -f "$LAST_FILE" ] && LAST=$(cat "$LAST_FILE")

# Use `find` to get all files recursively, list them in rofi
SNIPPET_FILE=$(find "$SNIPPET_DIR" -type f | sed "s|$SNIPPET_DIR/||" | rofi -dmenu -p "Select a snippet" -select "$LAST")

# Exit if no snippet is selected
[ -z "$SNIPPET_FILE" ] && exit

# Remember selection for next time
echo "$SNIPPET_FILE" > "$LAST_FILE"

# Copy the content of the selected snippet to the clipboard
printf "%s" "$(cat "$SNIPPET_DIR/$SNIPPET_FILE")" | xclip -selection clipboard
