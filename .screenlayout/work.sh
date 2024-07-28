#!/bin/sh
xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --mode 2560x1440 --pos 1920x0 --rotate normal --output DP2 --off --output DP3 --mode 2560x1440 --pos 4480x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off

i3-msg 'workspace 1; move workspace to output eDP1'
i3-msg 'workspace 10; move workspace to output eDP1'

i3-msg 'workspace 2; move workspace to output DP1'
i3-msg 'workspace 4; move workspace to output DP1'
i3-msg 'workspace 6; move workspace to output DP1'
i3-msg 'workspace 8; move workspace to output DP1'

i3-msg 'workspace 3; move workspace to output DP3'
i3-msg 'workspace 5; move workspace to output DP3'
i3-msg 'workspace 7; move workspace to output DP3'
i3-msg 'workspace 9; move workspace to output DP3'
