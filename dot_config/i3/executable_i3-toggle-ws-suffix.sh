#!/bin/sh
suffix="$1"
name=$(i3-msg -t get_workspaces | jq -r '.[] | select(.focused).name')

case "$suffix" in
  '!!!')
    case "$name" in *!!!) new="${name%!!!}" ;; *) new="${name}!!!" ;; esac
    ;;
  '...')
    case "$name" in *...) new="${name%...}" ;; *) new="${name}..." ;; esac
    ;;
  '???')
    case "$name" in *\?\?\?) new="${name%???}" ;; *) new="${name}???" ;; esac
    ;;
  *) exit 1 ;;
esac

exec i3-msg -q rename workspace "$name" to "$new"
