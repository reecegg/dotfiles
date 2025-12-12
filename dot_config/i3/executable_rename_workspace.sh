#!/bin/bash

# Get the current workspace name
current_name=$(i3-msg -t get_workspaces | jq -r ".[] | select(.focused==true).name")

# Check if the current name is just a number, and if so, add ": " after the number
if [[ "$current_name" =~ ^[0-9]+$ ]]; then
    current_name="$current_name:"
fi

# Prompt for the new workspace name, seeding it with the current (or modified) name
new_name=$(rofi -dmenu -p "Rename workspace" -filter "$current_name" -lines 1)

# If the new name is not empty, rename the workspace
if [ -n "$new_name" ]; then
    i3-msg "rename workspace to \"$new_name\""
fi
