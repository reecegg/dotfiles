#!/usr/bin/env bash

xclip -o -selection primary | sed G;
xclip -o -selection secondary | sed G;
xclip -o -selection clipboard | sed G;
xclip -o -selection buffer-cut | sed G;
