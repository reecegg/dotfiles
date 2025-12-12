#!/bin/bash

# Enable strict mode
set -euo pipefail

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

log "Script started with argument: $1"

# Function to stop all players
stop_all_players() {
    log "Stopping all players"
    local players
    players=$(playerctl -l || true)
    for player in $players; do
        log "Stopping player: $player"
        playerctl --player=$player stop || log "Failed to stop player: $player"
    done
}

# Function to pause all players
pause_all_players() {
    log "Pausing all players"
    local players
    players=$(playerctl -l || true)
    for player in $players; do
        log "Pausing player: $player"
        playerctl --player=$player pause || log "Failed to pause player: $player"
    done
}

# Function to play the first paused player
play_first_paused_player() {
    log "Playing the first paused player"
    local players
    players=$(playerctl -l || true)
    for player in $players; do
        status=$(playerctl --player="$player" status 2>/dev/null || true)
        log "Status of player $player: $status"
        if [ "$status" == "Paused" ]; then
            log "Playing player: $player"
            playerctl --player=$player play || log "Failed to play player: $player"
            return
        fi
    done
}

# Function to get any player that is currently playing
get_any_player_playing() {
    log "Getting any player that is currently playing"
    local players
    players=$(playerctl -l || true)
    for player in $players; do
        status=$(playerctl --player="$player" status 2>/dev/null || true)
        log "Status of player $player: $status"
        if [ "$status" == "Playing" ]; then
            log "Found playing player: $player"
            echo "$player"
            return 0
        fi
    done
    return 1
}

# Main logic for play-pause
if [ "$1" == "play-pause" ]; then
    log "Play-pause command received"
    if any_playing=$(get_any_player_playing); then
        log "A player is currently playing: $any_playing, pausing all players"
        pause_all_players
    else
        log "No player currently playing, playing first paused player"
        play_first_paused_player
    fi
fi

# Main logic for pause
if [ "$1" == "pause" ]; then
    log "Pause command received"
    pause_all_players
fi

# Main logic for stop
if [ "$1" == "stop" ]; then
    log "Stop command received"
    stop_all_players
fi

# Main logic for play
if [ "$1" == "play" ]; then
    log "Play command received"
    play_first_paused_player
fi

log "Script finished"
