#!/bin/sh
suffix="$1"
name=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

# Strip known suffixes
base="$name"
for s in '!!!' '...' '???'; do
  case "$base" in
    *"$s") base="${base%$s}" ;;
  esac
done

# Decide what to append
case "$suffix" in
  '')  new="$base" ;;                     # clear suffix
  '!!!'|'...'|'???') new="${base}${suffix}" ;;  # add requested suffix
  *) exit 1 ;;
esac

exec i3-msg -q rename workspace "$name" to "$new"
