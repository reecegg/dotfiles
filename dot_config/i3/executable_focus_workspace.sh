#!/bin/bash

# Get the list of all workspace names
workspaces=$(i3-msg -t get_workspaces | jq -r '.[].name')

# Use rofi to fuzzy-select a workspace by name
selected_workspace=$(echo "$workspaces" | rofi -dmenu -i -p "Select workspace")

# If a workspace was selected, focus it
if [ -n "$selected_workspace" ]; then
    i3-msg "workspace \"$selected_workspace\""
fi
