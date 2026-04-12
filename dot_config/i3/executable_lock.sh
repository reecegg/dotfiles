#!/bin/bash
dunstctl set-paused true
i3lock -n \
  -c 000000 \
  --radius=45 \
  --ring-width=3.0 \
  --inside-color=00000000 \
  --ring-color=ffffff18 \
  --keyhl-color=ffffffff \
  --bshl-color=00bfffcc \
  --ringver-color=ffffff55 \
  --ringwrong-color=00bfff88 \
  --insidever-color=00000000 \
  --insidewrong-color=00bfff11 \
  --verif-text="" \
  --wrong-text="" \
  --noinput-text="" \
  --greeter-text="" \
  --line-uses-ring \
  --indicator
dunstctl set-paused false
